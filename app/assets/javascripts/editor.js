editor = {}

editor.init = function() {
  if (document.getElementById('story_body')) {
    document.getElementById('story_body').oninput = editor.inputChange;
    editor.originalText = $('.story-content').html();
  }
};

editor.inputChange = function(event) {
  var input = event.target.value;
  $('.story-body').html(editor.originalText + input.replace(/\n/g, '<br />'));
};

editor.hideInput = function() {
  $('#story-controls').fadeSliderToggle({callback: function() {
    $('#story-controls').text('Your time has expired. You must wait for someone else to edit before you can contribute again.');
    $('#story-controls').fadeSliderToggle({speed:200});
  }});
};
