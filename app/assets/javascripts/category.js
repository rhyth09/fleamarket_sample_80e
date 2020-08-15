$(function(){
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子カテゴリーの表示作成
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='select--wrap' id= 'children_wrapper'>
                        <select id="child__category" name="item[category_id]" class="select--wrap__box1">
                          <option value="">---</option>
                          ${insertHTML}
                        <select>
                        <i class='fa-angle-down'></i>
                      </div>`;
    $('.product-details__form__category').append(childSelectHtml);
  }
  // 孫カテゴリーの表示作成
  function appendGrandchildrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='select--wrap' id= 'grandchildren_wrapper'>
                              <select id="grandchild__category" name="item[category_id]" class="select--wrap__box1">
                                <option value="">---</option>
                                ${insertHTML}
                              <select>
                              <i class='fa-angle-down'></i>
                            </div>`;
    $('.product-details__form__category').append(grandchildSelectHtml);
  }
  // 親カテゴリー選択後のイベント
  $('#item_category_id').on('change', function(){
    var parentId = document.getElementById('item_category_id').value; 
    if (parentId != "---"){ 
      $.ajax({
        url: '/items/get_category_children/',
        type: 'GET',
        data: { parent_id: parentId },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove(); 
        $('#grandchildren_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove(); 
      $('#grandchildren_wrapper').remove();
    }
  });
  // 子カテゴリー選択後のイベント
  $('.product-details__form__category').on('change', '#child__category', function(){
    var childId = document.getElementById('child__category').value;
    if(childId != "" && childId != 46 && childId != 74 && childId != 134 && childId != 142 && childId != 147 && childId != 150 && childId != 158){
      $.ajax({
        url: '/items/get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        $('#grandchildren_wrapper').remove();
        var insertHTML = '';
        grandchildren.forEach(function(grandchild){
          insertHTML += appendOption(grandchild);
        });
        appendGrandchildrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove();
    }
  });
});

