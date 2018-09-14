$(document).on('turbolinks:load', function () {
  $(document).on('ajax:success', function(data, status, xhr) {
    $('body').html(data.detail[0])
  }).on('ajax:error', function(xhr, status, error) {
    $('.error p').text('comando inválido')
  });
});
