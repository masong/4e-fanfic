archive = {}

archive.toggle = function(event) {
  var target = $(event.target).parents('.story');
  target.children(':nth-child(2)').children(':first').slideToggle();
  target.children(':first').children(':first').toggleClass('arrow-rotate-down');
};
