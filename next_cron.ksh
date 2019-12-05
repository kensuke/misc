#! /bin/ksh93

# https://unix.stackexchange.com/a/403129
# ksh printf %(date cmd format)T params
# "%F(%a) %T" mean "YYYY-MM-DD(dow) HH:MM:SS"

# TODO: show multiple plans

# TODO: support for multiple files / crontab -l result
file="/etc/crontab"
body="false"

while IFS= read -r line
do

    # TODO: improve parse method

    # check start state
    set -fA array $line
    # found "# m h dom mon dow user  command"
    if test ${#array[@]} -eq 8; then
        if test ${array[0]} = "#" -a ${array[7]} = "command"; then
            body="true"
            printf "%(%Y-%m-%d(%a) %H:%M:%S)T\t%s\n\n" now "$line"
            continue
        fi
    fi
    if test $body = "false"; then
        continue
    fi

    # parse cron line
    if test ${#array[@]} -ge 7; then
        mhdmw="${array[0]} ${array[1]} ${array[2]} ${array[3]} ${array[4]}"
        printf "%(%Y-%m-%d(%a) %H:%M:%S)T\t%s\n" "$mhdmw" "$line"

        delta=$(($(printf '(%(%s)T - %(%s)T) / 60' "$mhdmw" now)))
        if test $delta -eq 0; then
            printf "Executing NOW!!\n\n"
            continue
        fi

        mon=
        day=
        hor=
        min=
        if test $delta/60/24 -ge 30; then
            mon="$(($delta/60/24/30)) months"
            delta=$(($delta - $delta/60/24/30*60*24*30))
        fi
        if test $delta -gt 0 -a $delta/60 -ge 24; then
            day="$(($delta/60/24)) days"
            delta=$(($delta - $delta/60/24*60*24))
        fi
        if test $delta -gt 0 -a $delta/60 -ge 1; then
            hor="$(($delta/60)) hours"
            delta=$(($delta - $delta/60*60))
        fi
        if test $delta -gt 0; then
            min="$(($delta)) minutes"
        fi
        printf "Next run in $mon $day $hor $min.\n\n"
    fi

done <"$file"
