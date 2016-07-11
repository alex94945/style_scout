$(function(){

  $(".photo-upload-fields").on('change', 'input', function(){
    readURL(this, $(this).parents('.btn-file').siblings('img'));
    hideChooseButton($(this).parents('.btn-file'));
  });

})


function duplicateUploadField(){
  var htmlCloneString = $('.ghost-photo-input-group').clone()
                            .removeClass('hidden')
                            .removeClass('ghost-photo-input-group')
                            .addClass('photo-input-group');

  $('.photo-upload-fields').prepend(htmlCloneString)
}

function hideChooseButton(element){
  element.addClass('hidden')
}



function readURL(input, render_element) {
  console.log(input)
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
      render_element.attr('src', e.target.result);
      duplicateUploadField();

    }

    reader.readAsDataURL(input.files[0]);

  }
}