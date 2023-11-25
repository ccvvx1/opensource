// ==UserScript==
// @name         �Զ��尴ťʾ��
// @namespace    http://your.namespace.com
// @version      1.0
// @description  ����ҳ������Զ��尴ť
// @author       Your Name
// @match        https://www.baidu.com/*
// @match        https://wangda.chinamobile.com/*
// @match        https://www.fonts.net.cn/*

// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    // ����һ����ťԪ��
    var customButton = document.createElement("button");
    customButton.innerHTML = "�����";
    customButton.style.padding = "10px";
    customButton.style.backgroundColor = "blue";
    customButton.style.color = "white";
    customButton.style.border = "none";
    customButton.style.cursor = "pointer";

    // ����ť��ӵ�ҳ��
    var header = document.querySelector("header"); // ����ѡ������ƥ����Ҫ��Ӱ�ť��λ��
    if (header) {
        header.appendChild(customButton);
    }

    var body = document.querySelector("body");
    body.appendChild(customButton);


    // ��Ӱ�ť����¼�
    customButton.addEventListener("click", function() {
        // �ڰ�ť���ʱ��ʾ������Ϣ��

        setInterval("$('button.videojs-referse-btn:first').click()",5000);
        alert("�������Զ��尴ť��");
    });

    // ���Ҿ���ָ�����Եİ�ť
    var buttons = document.querySelectorAll('button[download-data-id][download-data-type]');

    // ������ť�б�
    buttons.forEach(function(button) {
        // ����һ���°�ť
        var newButton = document.createElement('button');
        newButton.type = 'button';
        newButton.innerHTML = '�°�ť';

        // ������������ֵ
        var downloadDataId = button.getAttribute('download-data-id');
        newButton.setAttribute('download-data-id', downloadDataId);
        var downloadDataType = button.getAttribute('download-data-type');
        newButton.setAttribute('download-data-type', downloadDataType);
        var cls = button.getAttribute('class');
        newButton.setAttribute('class', cls);


        // ��ӵ���¼�������
        button.addEventListener('click', function(event) {
            // ��ֹĬ�ϵ����ز���
            event.preventDefault();
            console.log("+++++++++++++");

            // ��ȡ��������
            //var downloadDataId = button.getAttribute('download-data-id');
            //var downloadDataType = button.getAttribute('download-data-type');

            // �������������ӻ�ִ���Զ������
            //var newDownloadLink = 'https://www.example.com/download?data_id=' + downloadDataId + '&data_type=' + downloadDataType;

            // ������ִ�����Զ���Ĳ����������������ݻ��������
            // ���磬����ʹ�� window.location.href ��������
            //window.location.href = newDownloadLink;
        });

        // ��ӵ���¼��������
        //newButton.addEventListener('click', function() {
            // ������ִ���°�ť�Ĳ���
            // ���Ը�����Ҫ�Զ������
            //console.log("hello");
        //});

        // �����°�ť����ԭ��ťͬһ��Ԫ����
        button.parentElement.appendChild(newButton);
    });
})();
