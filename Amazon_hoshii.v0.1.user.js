// ==UserScript==
// @name         Amazon ほしい物リスト 合計金額
// @namespace    http://www.geocities.jp/s107ken/
// @version      0.2
// @description  標準価格と最低価格を算出。とりあえず、jpのみ。
// @author       Kensuke Sato / 佐藤 賢輔
// @match        https://www.amazon.co.jp/hz/wishlist/*
// @match        http://www.amazon.co.jp/gp/registry/wishlist/*
// @match        https://www.amazon.co.jp/gp/registry/wishlist/*
// @grant        none
// ==/UserScript==
/* jshint -W097 */
'use strict';

(function () {
    // "123456" -> "123,456"
    function fmt(money) {
        var sm = money.toString();
        var l = sm.length;
        if (l <= 3) {
            return sm;
        }
        switch (l%3) {
            case 1:
                sm = "00" + sm;
                break;
            case 2:
                sm = "0" + sm;
                break;
            case 0:
                break;
        }
        l = sm.length;
        var rm = "";
        for (var i = 0; i < l; i+=3) {
            rm += sm.substr(i, 3) + ",";
        }
        rm = rm.replace(/^0+/, "");
        return rm.substr(0, rm.length-1);
    }

    // ","と"￥"を削除して、数値変換
    //<span id="itemPrice_IQAJO22V0916N" class="a-size-base a-color-price a-text-bold">￥ 1,316</span>
    //<span class="a-color-price itemUsedAndNewPrice">￥ 1,316</span>より
    function getPrice(elm) {
        var price = parseInt(elm.innerHTML.replace(',', '').replace('￥', ''));
        if (isNaN(price)) {
            price = 0;
        }
        return price;
    }

    // 合計算出
    var ama = 0;
    var ama_total = 0;
    var ama_list = document.getElementsByClassName('a-size-base a-color-price a-text-bold');
    ama_list = document.getElementsByClassName('a-price-whole');

    var shop = 0;
    var shop_total = 0;
    var shop_list = document.getElementsByClassName('a-color-price itemUsedAndNewPrice');

    var i, price;

    // アマゾン価格
    for (i = 0; i < ama_list.length; i++) {
        price = getPrice(ama_list[i]);
        if (price !== 0) {
            ama++;
        }
        ama_total += price;
    }

    // 最低？価格
    for (i = 0; i < shop_list.length; i++) {
        price = getPrice(shop_list[i]);
        if (price !== 0) {
            shop++;
        }
        shop_total += price;
    }

    // 出力
    var tag = document.getElementById('profile-list-name');
    var msg = ama + '点　￥ ' + fmt(ama_total) + '　／　' + shop + '点　￥ ' + fmt(shop_total);
    if (tag === null) {
        window.alert('profile-list-name を読み込めません！\n' + msg);
        return;
    }
    msg = tag.innerHTML + '　／　' + msg;
    tag.innerHTML = msg;
}) ();
