$(document).on('turbolinks:load', ()=> {

  $('.select--wrap').on('change', '#price', function() {
    const fee = Math.floor(this.value * 0.1);
    const profit = this.value - fee;
    $('#fee').text(`¥ ${fee}`);
    $('#profit').text(`¥ ${profit}`);

    $('#hidden-price').prop('value', profit);
  });

  $('.select--wrap').on('keydown', '#price', function() {
    const fee = Math.floor(this.value * 0.1);
    const profit = this.value - fee;
    $('#fee').text(`¥ ${fee}`);
    $('#profit').text(`¥ ${profit}`);

    $('#hidden-price').prop('value', profit);
  });

});