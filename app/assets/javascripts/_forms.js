$(document).ready(function() {
  $("form a.add_fields").
      data("association-insertion-method", 'before').
      data("association-insertion-node", 'this');
})
