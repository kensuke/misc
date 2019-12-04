#! /bin/ksh93

# https://unix.stackexchange.com/a/403129

file="/etc/crontab"
body="false"

while IFS= read -r line
do

    set -fA array $line
    # m h dom mon dow user  command
    if test ${#array[@]} -eq 8; then
        if test ${array[0]} = "#" -a ${array[7]} = "command"; then
            body="true"
            printf "%(%F(%a) %T)T\t" now
            echo $line
            echo
            continue
        fi
    fi
    if test $body = "false"; then
        continue
    fi

    if test ${#array[@]} -gt 7; then
        cl="${array[0]} ${array[1]} ${array[2]} ${array[3]} ${array[4]}"

        printf "%(%F(%a) %T)T\t" "$cl"
        echo $line

        delta=$(($(printf '(%(%s)T - %(%s)T) / 60' "$cl" now)))
        if test $delta/60 -gt 23; then
            echo "Next run in $((delta/60/24)) days."
        else
            echo "Next run in $((delta/60)) hours and $((delta%60)) minutes."
        fi
        echo
    fi
done <"$file"
