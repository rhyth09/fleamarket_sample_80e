$(document).on('turbolinks:load', ()=> {

  // 画像用input要素生成のための関数
  const buildFileField = (index) => {
    const html = `<div class="js-file_group" data-index="${index}">
                    <input class="js-file" type="file" name="item[images_attributes][${index}][src]" id="item_images_attributes_${index}_src">
                  </div>`;
    return html;
  }

  // プレビュー生成のための関数
  const buildImage = (index, url) => {
    const html = `<div class="preview">
                    <img data-index="${index}" src="${url}">
                    <div class="img-dele-btn" id="delete_btn_${index}">削除</div>
                  </div>`;
    return html;
  }

  let count = 0;
  //  画像用input要素に入れるindex番号
  let fileIndex = [0, 1, 2, 3, 4, 5, 6];

  // データベースに保存されていた画像分のfileIndex番号を除外
  let lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  count = fileIndex[0];

  // 画像が5枚揃っている場合
  $('.dropbox__img').prop('for', `item_images_attributes_${count}_src`);
  if ($('.preview').length === 5) {
    $('.dropbox__img').hide();
  }
  

  // データベースに保存されていた画像の削除ボタンが押されたときの処理
  $(document).on('click', '.data-dele-btn', function() {
    // プレビュー部分の削除
    $(this).parent().remove();
    // 削除ボタンの番号の取得
    let targetIndex = $(this).attr('id').slice(11);
    // 削除ボタンを押された画像と同じ番号を持つチェックボックスの取得とチェック
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


  // データベース保存済み画像の変更があったときの処理
  $('#image-box').on('change', '.reselection', function(e) {
    const targetIndex = $(this).data('index');
    // 画像URLの取得
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // プレビュー画像の差し替え
    $('#reselect-image').prop('src', blobUrl);
  });
  

  // 画像用input要素に入力があったときの処理
  $('#image-box').on('change', '.js-file_group', function(e) {
    const targetIndex = $(this).data('index');
    // 画像URLの取得
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    count ++;
    // for属性を指定したlabelの追加
    $('.dropbox__img').prop('for', `item_images_attributes_${count}_src`).before(buildImage(targetIndex, blobUrl));
    // 画像が5枚になったらlabelの除去
    if ($('.preview').length === 5) {
      $('.dropbox__img').hide();
    }
    
    // 画像用input要素に入れるindex番号の削除と追加
    $('#image-box').append(buildFileField(fileIndex[1]));
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
  });

  // 削除ボタンが押されたときの処理
  $(document).on('click', '.img-dele-btn', function() {
    // 削除ボタンの番号の取得
    let id = $(this).attr('id').slice(11);
    // 削除ボタンが押された画像の、input要素部分の削除
    $(`#item_images_attributes_${id}_src`).parent().remove();
    // プレビュー部分の削除
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