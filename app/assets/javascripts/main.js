Galleria.configure({
  debug: false // debug is now off for deployment
});
Galleria.loadTheme('/assets/galleria.classic.min.js');

$(document).ready(function() {
  $(".next-article").click(function() {
    window.location = $(".next-article").attr("data-next-article-url");
  });

  $(".nav-menu ul li a").click(function(e) {
    var target = $(e.target);
    target.after("<img src='/assets/ajax-loader.gif' style='margin-left: 5px; margin-bottom: 2px;'>");
  });
});