$(document).on('turbolinks:load', ()=> {
  const buildFileField = (index) => {
    const html = `<div class="js-file_group" data-index="${index}">
                    <input class="js-file" type="file" name="item[images_attributes][${index}][src]" id="item_images_attributes_${index}_src">
                  </div>`;
    return html;
  }

  const buildImage = (index, url) => {
    const html = `<img data-index="${index}" src="${url}" width="120px" height="120px">`;
    return html;
  }

  let fileIndex = [1, 2, 3, 4];

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {
      $('#previews').append(buildImage(targetIndex, blobUrl));
    }
    $('#image-box').append(buildFileField(fileIndex[0]));
    fileIndex.shift();    
  });
});