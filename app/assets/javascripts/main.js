Galleria.configure({
  debug: false // debug is now off for deployment
});
Galleria.loadTheme('/assets/galleria.classic.min.js');

$(document).ready(function() {
  $(".next-article").click(function() {
    window.location = $(".next-article").attr("data-next-article-url");
  });
});