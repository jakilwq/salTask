$(function() {

  var pusher = new Pusher('5c1cae8c48708e1f8953'); // Replace with your app key
  var channel = pusher.subscribe('main');

  // Some useful debug msgs
  pusher.connection.bind('connecting', function() {
    $('div#status').text('Connecting to Pusher...');
  });
  pusher.connection.bind('connected', function() {
    $('div#status').text('Connected to Pusher!');
  });
  pusher.connection.bind('failed', function() {
    $('div#status').text('Connection to Pusher failed :(');
  });
  channel.bind('subscription_error', function(status) {
    $('div#status').text('Pusher subscription_error');
  });

  channel.bind('new_message', function(data) {
    msg = 'Someone from ' + data.city + 'has just bought a säl';
    dom_notify(msg);
  });

  channel.bind('total', function(data) {
    msg = data.total + " säl bought";
    dom_total(msg);
  });

});

function dom_notify(msg) {
  $('#notify').text(msg);
  $('#notify').fadeIn();
  setTimeout(function() {
    $('#notify').fadeOut
    ();
  }, 2000);
}

function dom_total(msg) {
  $('#total').text(msg);
  //$('#total').fadeIn();
  setTimeout(function() {
    $('#total').fadeIn
    ();
  }, 1000);
}