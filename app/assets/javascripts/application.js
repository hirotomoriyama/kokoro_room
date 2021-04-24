// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require jquery
//= require jquery_ujs
//= require jquery.raty.js
//= require rails-ujs
//= require activestorage
//= require_tree .

/*global $ */
/*global ScrollReveal */

// アイコンをクリックすると、ページ上部へスクロール
$(function(){
  $('#back a').on('click', function(event){
    $('body, html').animate({
      scrollTop:0
    }, 800);
    event.preventDefault();
  });
});

// トップページの画像スライダー
$(function(){
  $("#theTarget").skippr({
    // スライドショーの変化
    transition:'fade',
    // 変化にかかる時間
    speed:2000,
    // easingの種類
    easing:'easeOutQuart',
    // ナビゲーションの形が泡型
    navType:'bubble',
    // 子要素の種類
    childrenElementType:'img',
    // ナビゲーション矢印を表示
    arrows:true,
    // スライドショーの自動再生
    autoPlay:true,
    // 自動再生時のスライド切替間隔
    autoPlayDuration:3000,
    // 矢印キーによるスライド送りの設定
    keyboardOnAlways:true,
    // 一枚目のスライド表示時に戻る矢印を非表示
    hidePrevious:false
  });
});

// トップページのグラフのアニメーション
$(function(){
  ScrollReveal().reveal('.graph1',{
  // 表示までの時間
  duration:4000,
  // 左から移動しながら表示
  origin:'left',
  distance:'200px'
  });
});

// トップページのグラフのアニメーション
$(function(){
  ScrollReveal().reveal('.graph2',{
  // 表示までの時間
  duration:4000,
  // 右から移動しながら表示
  origin:'right',
  distance:'200px'
  });
});

// トップページの文章のアニメーション
$(function(){
  ScrollReveal().reveal('.scale',{
    // 表示までの時間
  duration:4000,
  // 徐々に拡大しながら表示
  scale:0.3
  });
});

// アバウトページの目次をクリックすると、同名の部分に遷移
$(function(){
  $('a[href^="#"]').click(function(){
    let speed = 400;
    let href = $(this).attr("href");
    let target = $(href == "#" || href == "" ? 'html' : href);
    let position = target.offset().top;
    $('body, html').animate({
      scrollTop: position
    }, speed, 'swing');
    return false;
  });
});

// アバウトページのアコーディオンメニュー
$(function() {
  $(".acmenu dt").on("click", function(){
    $(this).next().slideToggle();
  });
});