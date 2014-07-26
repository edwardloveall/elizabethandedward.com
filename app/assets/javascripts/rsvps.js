$(document).ready(function () {
  $('div.meal.choices a.choice').on('ajax:success', function(event, data, status, xhr) {
    var choices = $(this).parent().children();
    choices.removeClass('selected');
    choices.filter("a[data-meal='" + data["meal"] + "']").addClass('selected');
  });
});
