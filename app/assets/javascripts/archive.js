archive = {}

archive.toggle = function() {
  var target = $(window.event.target);
  if (target.attr('class') == 'date') {
    target = target.parent();
  }
  target.next().children(0).slideToggle();
};
