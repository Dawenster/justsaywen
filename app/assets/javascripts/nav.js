var ready;
ready = function() {
  $(".menu-logo").click(function() {
    $(".nav-menu").removeClass("hidden");
    $(".site-nav-overlay").removeClass("hidden");
    $("body").attr("style", "overflow: hidden;");
    if ($(".top-of-page")) {
      $(".top-of-page").addClass("hidden");
    }
    showNavMenu();
  });
  $(".clickable").click(function() {
    hideNavMenu();
    $("body").attr("style", "");
  });
  $(".menu-logo").on('dragstart', function(e) {
    e.preventDefault();
  });
  $(".nav-menu a").click(function() {
    $(".nav-menu").attr("data-status", "hidden");
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);

var showOptions = {
  duration: 200,
  complete: function() {
    $(".nav-menu").attr("data-status", "open");
    $(".menu-logo-dup").removeClass("hidden");
  }
}

var hideOptions = {
  duration: 200,
  complete: function () {
    $(".nav-menu").attr("data-status", "hidden");
    $(".nav-menu").addClass("hidden");
    $(".site-nav-overlay").addClass("hidden");
    $(".menu-logo-dup").addClass("hidden");
    if ($(".top-of-page")) {
      $(".top-of-page").removeClass("hidden");
    }
  }
}

function showNavMenu() {
  $(".movable-by-menu").stop().animate({
    left: "+=280px"
  }, showOptions);
}

function hideNavMenu() {
  $(".movable-by-menu").stop().animate({
    left: "-=280px"
  }, hideOptions);
}