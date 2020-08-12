$(document).on('turbolinks:load', ()=> {
  const buildFileField = (index) => {
    const html = `<div class="js-file_group" data-index="${index}">
                    <input class="js-file" type="file" name="item[images_attributes][${index}][src]" id="item_images_attributes_${index}_src">
                  </div>`;
    return html;
  }

  let fileIndex = [1, 2, 3, 4];

  $('#image-box').on('change', function(e) {
    $('#image-box').append(buildFileField(fileIndex[0]));
    fileIndex.shift();    
  });
});