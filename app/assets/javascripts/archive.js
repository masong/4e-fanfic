archive = {}

archive.toggle = function() {
  var target = $(window.event.target).parents('.story');
  target.children(':nth-child(2)').children(':first').slideToggle();
  target.children(':first').children(':first').toggleClass('arrow-rotate-down');
  window.console.log(window.event.target);
  window.console.log(window.event.target.parentNode);
};
