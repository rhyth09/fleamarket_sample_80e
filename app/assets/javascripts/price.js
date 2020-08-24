$(document).on('turbolinks:load', ()=> {

  $('.product-price').on('keydown', '#price-box', function() {
    const price = this.value;
    const fee = Math.floor(price * 0.1);
    const profit = price - fee;

    $('#fee').text(`¥${fee}`);
    $(`#profit`).text(`¥${profit}`);
  });

  $('.product-price').on('change', '#price-box', function() {
    const price = this.value;
    const fee = Math.floor(price * 0.1);
    const profit = price - fee;
    $('#fee').text(`¥${fee}`);
    $(`#profit`).text(`¥${profit}`);
  });

});