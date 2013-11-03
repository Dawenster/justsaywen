$(document).ready(function() {
  $(".menu-logo").click(function(e) {
    e.preventDefault();
    if ($(".nav-menu").attr("data-status") == "hidden") {
      $(".nav-menu").removeClass("hidden");
      $("body").attr("style", "overflow: hidden;");
      showNavMenu();
    }
  });
  $(".movable-by-menu").click(function() {
    if ($(".nav-menu").attr("data-status") == "open") {
      hideNavMenu();
      $("body").attr("style", "");
    }
  })
  $(".menu-logo").on('dragstart', function(e) {
    e.preventDefault();
  });
});

var showOptions = {
  duration: 100,
  complete: function() {
    $(".nav-menu").attr("data-status", "open");
  }
}

var hideOptions = {
  duration: 100,
  complete: function () {
    $(".nav-menu").attr("data-status", "hidden");
    $(".nav-menu").addClass("hidden");
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