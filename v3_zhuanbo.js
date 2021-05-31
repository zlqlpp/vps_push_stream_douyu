##youguan_zhuanbo_zidong


// ==UserScript==
// @name         youguan_zhuanbo_zidong
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://studio.youtube.com/*
// @grant        none
// @require       https://code.jquery.com/jquery-3.5.1.min.js
// ==/UserScript==



window.onload = function(){
    console.log('1---页面已加载，查看twittch是否开播');
    //setTimeout(post(),3000);
    post();
  // kaibo();
}


 function post(){
        $.ajax({
            url: 'https://173.82.11.121:8887/okcode',
            type: "get", // 请求类型
            data: {
            },
            dataType: 'json',
            async: false, // 是否异步
            success: function (ret) {
                if (ret==1) {
                   // kaibo();
                    console.log('2---twittch开播了');
                    test();

                }else{
                    console.log('2---twittch没有开播 ，3秒后查看twittch是否开播');
                     setTimeout(function a(){post();},3000);

                }
            }
        });
}

////
async function test() {
    console.log('检查当前页面');
   // await sleep(5000);
    var url=window.location.pathname;//获取当前的url
    if(url.startsWith('/channel')){//如果是channel页面
         if(document.getElementById("create-icon")==null){//但是没有创建那个按钮，就有这个就是开播时的中间页面，
             console.log('3---channel页面,没有创建按钮，3秒后将重新检查');
             setTimeout(function a(){test();},3000);
             return;//就重新监控当前页面，因为真正开播了，url会换成/video
         }
         console.log('3---channel页面,有创建按钮，点击');
        await sleep(1000);//等一秒钟
         document.getElementById("create-icon").click();//点击一下创建按钮
         //console.log('睡1秒，进入开播');
         await sleep(1000);//等一秒钟
         location.replace(document.getElementsByClassName("remove-default-style style-scope ytcp-text-menu")[0].href);//点击进入开播页面
    }

    if(url.startsWith('/video')){//如果是直播的页面
        console.log('3---video页面，等3秒钟，检查是否正在直播');
        await sleep(3000);//等一秒钟
        if(document.getElementById("end-stream-button").hidden){//但是没有开播
            console.log('4---video页面，没开播，页面将跳转到studio.youtube.co');
            location.replace("https://studio.youtube.com/");//那么刷新页面
        }
        console.log('4---video页面，开播了，页面不会跳转');
    }

    setTimeout(function a(){post();},5000);
}

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms))
}
