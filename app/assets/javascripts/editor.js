editor = {}

editor.init = function() {
  if (document.getElementById('story_body')) {
    document.getElementById('story_body').oninput = editor.inputChange;
    editor.originalText = $('.story-body').html();
  }
};

editor.inputChange = function(event) {
  var input = event.target.value;
  $('.story-body').html(editor.originalText + input.replace(/\n/g, '<br />'));
};
