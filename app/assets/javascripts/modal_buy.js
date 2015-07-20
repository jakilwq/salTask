jQuery(function($) {
  Stripe.setPublishableKey('pk_test_xoYZU4aHGMPY9k2TXQB3LH6t');

  $('.buy_sal').submit(function(event) {
    var $form = $(this);

    //alert('submitted');
    // Disable the submit button to prevent repeated clicks
    $form.find('button').prop('disabled', true);

    stripecard = Stripe.card.createToken($form, stripeResponseHandler);
    console.log(stripecard);

    // Prevent the form from submitting with the default action
    return false;
  });
});

function stripeResponseHandler(status, response) {
  var $form = $('.buy_sal');

  if (response.error) {
    // Show the errors on the form
    $form.find('.payment-errors').text(response.error.message);
    $form.find('button').prop('disabled', false);
    console.log(response.error.message);
  } else {
    // response contains id and card, which contains additional card details
    var token = response.id;
    console.log(token);
    // Insert the token into the form so it gets submitted to the server
    $form.append($('<input type="hidden" name="order[stripeToken]" />').val(token));
    // and submit
    $form.get(0).submit();
  }
};