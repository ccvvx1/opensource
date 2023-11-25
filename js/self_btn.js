// ==UserScript==
// @name         自定义按钮示例
// @namespace    http://your.namespace.com
// @version      1.0
// @description  在网页上添加自定义按钮
// @author       Your Name
// @match        https://www.baidu.com/*
// @match        https://wangda.chinamobile.com/*
// @match        https://www.fonts.net.cn/*

// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    // 创建一个按钮元素
    var customButton = document.createElement("button");
    customButton.innerHTML = "点击我";
    customButton.style.padding = "10px";
    customButton.style.backgroundColor = "blue";
    customButton.style.color = "white";
    customButton.style.border = "none";
    customButton.style.cursor = "pointer";

    // 将按钮添加到页面
    var header = document.querySelector("header"); // 更改选择器以匹配您要添加按钮的位置
    if (header) {
        header.appendChild(customButton);
    }

    var body = document.querySelector("body");
    body.appendChild(customButton);


    // 添加按钮点击事件
    customButton.addEventListener("click", function() {
        // 在按钮点击时显示弹出消息框

        setInterval("$('button.videojs-referse-btn:first').click()",5000);
        alert("你点击了自定义按钮！");
    });

    // 查找具有指定属性的按钮
    var buttons = document.querySelectorAll('button[download-data-id][download-data-type]');

    // 遍历按钮列表
    buttons.forEach(function(button) {
        // 创建一个新按钮
        var newButton = document.createElement('button');
        newButton.type = 'button';
        newButton.innerHTML = '新按钮';

        // 设置特殊属性值
        var downloadDataId = button.getAttribute('download-data-id');
        newButton.setAttribute('download-data-id', downloadDataId);
        var downloadDataType = button.getAttribute('download-data-type');
        newButton.setAttribute('download-data-type', downloadDataType);
        var cls = button.getAttribute('class');
        newButton.setAttribute('class', cls);


        // 添加点击事件监听器
        button.addEventListener('click', function(event) {
            // 阻止默认的下载操作
            event.preventDefault();
            console.log("+++++++++++++");

            // 获取下载链接
            //var downloadDataId = button.getAttribute('download-data-id');
            //var downloadDataType = button.getAttribute('download-data-type');

            // 构建新下载链接或执行自定义操作
            //var newDownloadLink = 'https://www.example.com/download?data_id=' + downloadDataId + '&data_type=' + downloadDataType;

            // 在这里执行您自定义的操作，例如下载数据或打开新链接
            // 例如，可以使用 window.location.href 打开新链接
            //window.location.href = newDownloadLink;
        });

        // 添加点击事件处理程序
        //newButton.addEventListener('click', function() {
            // 在这里执行新按钮的操作
            // 可以根据需要自定义操作
            //console.log("hello");
        //});

        // 插入新按钮到与原按钮同一父元素中
        button.parentElement.appendChild(newButton);
    });
})();
