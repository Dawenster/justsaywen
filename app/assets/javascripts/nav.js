$(document).ready(function() {
  $(".menu-logo").click(function() {
    if ($(".nav-menu").attr("data-status") == "hidden") {
      $(".nav-menu").removeClass("hidden");
      $(".site-nav-overlay").removeClass("hidden");
      $("body").attr("style", "overflow: hidden;");
      showNavMenu();
    }
  });
  $(".clickable").click(function() {
    if ($(".nav-menu").attr("data-status") == "open") {
      hideNavMenu();
      $("body").attr("style", "");
    }
  })
  $(".menu-logo").on('dragstart', function(e) {
    e.preventDefault();
  });
  $(".nav-menu a").click(function() {
    $(".nav-menu").attr("data-status", "hidden");
  });
});

var showOptions = {
  duration: 200,
  complete: function() {
    $(".nav-menu").attr("data-status", "open");
  }
}

var hideOptions = {
  duration: 200,
  complete: function () {
    $(".nav-menu").attr("data-status", "hidden");
    $(".nav-menu").addClass("hidden");
    $(".site-nav-overlay").addClass("hidden");
  }
}

function showNavMenu() {
  $(".movable-by-menu").animate({
    left: "+=280px"
  }, showOptions);
}

function hideNavMenu() {
  $(".movable-by-menu").animate({
    left: "-=280px"
  }, hideOptions);
}