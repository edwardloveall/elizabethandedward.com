$(document).ready(function () {
  $(document).on('ajax:success', 'a.choice', function(event, data, status, xhr) {
    var choices = $(this).parent().children();
    choices.removeClass('selected');
    choices.filter("a[data-meal='" + data["meal"] + "']").addClass('selected');
  });

  $(document).on('ajax:success', 'a.attendance', function(event, data, status, xhr) {
    $(this).parent('div.person').replaceWith(data);
  });
});
