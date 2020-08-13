$(document).on('turbolinks:load', ()=> {

  // 画像用input要素
  const buildFileField = (index) => {
    const html = `<div class="js-file_group" data-index="${index}">
                    <input class="js-file" type="file" name="item[images_attributes][${index}][src]" id="item_images_attributes_${index}_src">
                  </div>`;
    return html;
  }

  // プレビュー
  const buildImage = (index, url) => {
    const html = `<div class="preview">
                    <img data-index="${index}" src="${url}" width="120px" height="120px">
                    <div class="img-dele-btn" id="delete_btn_${index}">削除</div>
                  </div>`;
    return html;
  }

  let count = 0;
  let fileIndex = [1, 2, 3, 4];

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {
      count ++;
      $('.dropbox__img').attr('for', `item_images_attributes_${count}_src`).before(buildImage(targetIndex, blobUrl));
      if ($('.preview').length === 5) {
        $('label').hide();
      }
    }
    // fileIndexの削除と追加
    $('#image-box').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
  });

  // 画像の要素とプレビューの削除
  $(document).on('click', '.img-dele-btn', function() {
    let id = $(this).attr('id').slice(11);
    $(`#item_images_attributes_${id}_src`).parent().remove();
    $(this).parent().remove();
    
    if ($('.preview').length < 5) {
      $('#image-box').append(buildFileField(fileIndex[0]));
      $('label').show();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }  
  });
  
});