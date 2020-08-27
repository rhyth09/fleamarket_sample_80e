$(document).on('turbolinks:load', ()=> {
  $('.image__sub__list').on('click', '#thumbnail', function() {
    const thumbnailSrc = $(this).prop('src');
    $('.image__main__list > img').prop('src', thumbnailSrc);
  });
});