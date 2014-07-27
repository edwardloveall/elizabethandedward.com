$(document).ready(function () {
  $(document).on('ajax:success', 'div.meals a.meal', function(event, data, status, xhr) {
    var choices = $(this).parent().children();
    choices.removeClass('selected');
    choices.filter("a[data-meal='" + data["meal"] + "']").addClass('selected');
  });

  $(document).on('ajax:success', 'a.choice.friday', function(event, data, status, xhr) {
    var friday = $(this)
    var choices = friday.parent().children();

    if (data['friday'] == 'true') {
      friday.addClass('selected');
      friday.attr('href', friday.attr('href').replace('true', 'false'))
    } else {
      friday.removeClass('selected');
      friday.attr('href', friday.attr('href').replace('false', 'true'))
    }
  });

  $(document).on('ajax:success', 'a.attendance', function(event, data, status, xhr) {
    $(this).parent('div.person').replaceWith(data);
  });

  $(document).on('ajax:success', 'a.plus-one', function(event, data, status, xhr) {
    $(this).parent('div.person').replaceWith(data);
  });
});
