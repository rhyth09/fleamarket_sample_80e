$(document).on('turbolinks:load', ()=> {
  function buildHTML(comment){
    let html = `<div class="commentBox__comment">
                  <div class="profile">
                    <div class="profile__name">
                      ${comment.name}
                    </div>
                    <div class="profile__right">
                      <div class="image">
                        <i class="fas fa-user-circle"></i>
                      </div>
                      <div class="seller_or_buyer">
                        出品者
                      </div>
                    </div>
                  </div>
                  <div class="comment">
                    <div class="comment__text">
                      ${comment.comment}
                    </div>
                    <div class="comment__bottom">
                      <div class="comment__date">
                        <i class="far fa-clock"></i>
                        本日
                      </div>
                      <div class="comment__trash">
                        <a item_id="@item" rel="nofollow" data-method="delete" href="/items/${comment.item_id}/comments/${comment.comment_id}"><i class="fa fa-trash"></i>
                        </a>
                      </div>
                    </div>
                  </div>
                </div>`
    return html;
  }

  function buildHTMLother(comment){
    let html = `<div class="commentBox__comment__other">
                  <div class="profile__right">
                    <div class="image">
                      <i class="far fa-user-circle"></i>
                    </div>
                    <div class="seller_or_buyer">
                      お客様
                    </div>
                  </div>
                    <div class="profile__name">
                      ${comment.name}
                    </div>
                  <div class="comment">
                    <div class="comment__text">
                      ${comment.comment}
                    </div>
                    <div class="comment__bottom">
                      <div class="comment__icon">
                        <div class="flag">
                          <i class="far fa-flag"></i>
                        </div>
                        <div class="trash">
                          <a item_id="@item" rel="nofollow" data-method="delete" href="/items/${comment.item_id}/comments/${comment.comment_id}"><i class="fa fa-trash"></i></a>
                        </div>
                      </div>
                      <div class="date">
                        <i class="far fa-clock"></i>
                          本日
                      </div>
                    </div>
                  </div>
                </div>`
    return html;
  }

  $('.new_comment').on ('submit',function(e){
    e.preventDefault();
    let formData = new FormData(this)
    let url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      if (data.comment_seller_id == data.item_seller_id) {
        let html = buildHTML(data);
        $('.commentBox__comments').append(html);
        $('.text_area').val('');
        $('.commentBtn').prop('disabled', false);
      } else {
        let html = buildHTMLother(data);
        $('.commentBox__comments').append(html);
        $('.text_area').val('');
        $('.commentBtn').prop('disabled', false);
      }
    })
    .fail(function(){
      alert('error');
    })
  })
});