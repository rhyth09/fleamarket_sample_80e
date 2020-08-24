$(document).on('turbolinks:load', ()=> {

  $('.hidden-destroy').prop('checked', false);
  
  // 画像追加用のinput要素
  const buildFileField = (index) => {
    const html = `<div class="js-file_group" data-index="${index}">
                    <input class="js-file" type="file" name="item[images_attributes][${index}][src]" id="item_images_attributes_${index}_src">
                  </div>`;
    return html;
  }

  // プレビュー
  const buildImage = (index, url) => {
    const html = `<div class="preview">
                    <label for="item_images_attributes_${index}_src">
                      <img data-index="${index}" src="${url}" id="image-preview" class="image-${index}" width="120px" height="120px">
                    </label>
                    <div class="img-dele-btn" id="delete_btn_${index}">削除</div>
                  </div>`;
    return html;
  }

  // labelのfor属性に付ける値のカウント
  let count = 0;
  //  input要素に付けるindex番号
  let fileIndex = [0, 1, 2, 3, 4, 5, 6];

  // 保存済み画像に割り当てられるfileIndex番号の除外
  const lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  count = fileIndex[0];

  // 保存済み画像が5枚あった場合
  $('.dropbox__img').prop('for', `item_images_attributes_${count}_src`);
  if ($('.preview').length === 5) {
    $('.dropbox__img').hide();
  }
  
  // 保存済み画像の削除処理
  $(document).on('click', '.data-dele-btn', function() {
    // プレビュー部分の削除
    $(this).parent().remove();
    // 削除ボタン番号の取得
    let targetIndex = $(this).attr('id').slice(11);
    // 削除ボタン番号と同じ番号を持つチェックボックスの取得とチェック
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    hiddenCheck.prop('checked', true);
    // 5枚保存されていた画像が1枚でも削除された場合
    if ($('.preview').length < 5) {
      $('#image-box').append(buildFileField(fileIndex[0]));
      // labelの再表示とindex番号の追加
      $('.dropbox__img').show();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  // 保存済み画像の差し替え処理
  $('#image-box').on('change', '.reselection', function(e) {
    const targetIndex = $(this).data('index');
    const findImage = $(`.image-${targetIndex}`);
    // 画像URLの取得
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // プレビュー画像の差し替え
    $(findImage).prop('src', blobUrl);
  });

  // 保存前画像の追加処理
  $('#image-box').on('change', '.js-file_group', function(e) {
    const targetIndex = $(this).data('index');
    
    // 差し替える場合
    if ($.inArray(targetIndex, fileIndex) === -1) {
      const findImage = $(`.image-${targetIndex}`);
      // 画像URLの取得
      const file = e.target.files[0];
      const blobUrl = window.URL.createObjectURL(file);
      // プレビュー画像の差し替え
      findImage.prop('src', blobUrl);
    }
    else {
      // 画像URLの取得
      const file = e.target.files[0];
      const blobUrl = window.URL.createObjectURL(file);
  
      count ++;
      // for属性付きのlabelの追加
      $('.dropbox__img').prop('for', `item_images_attributes_${count}_src`).before(buildImage(targetIndex, blobUrl));
      // 画像が5枚になった時のlabelの除去
      if ($('.preview').length === 5) {
        $('.dropbox__img').hide();
      }
      // 画像用input要素に入れるindex番号の削除と追加
      $('#image-box').append(buildFileField(fileIndex[1]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }

  });

  // 保存前画像の削除処理
  $(document).on('click', '.img-dele-btn', function() {
    // 削除ボタン番号の取得
    let id = $(this).attr('id').slice(11);
    // 削除ボタン番号と同じ番号を持つinput要素部分の削除
    $(`#item_images_attributes_${id}_src`).parent().remove();
    // プレビューの削除
    $(this).parent().remove();
    
    // 一度5枚分プレビューした画像が消された場合
    if ($('.preview').length < 5) {
      $('#image-box').append(buildFileField(fileIndex[0]));
      // labelの再表示とindex番号の追加
      $('.dropbox__img').show();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }  
  });

});