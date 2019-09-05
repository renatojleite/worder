//= require rails-ujs
//= require_tree .
//= require moment
//= require fullcalendar
//= require fullcalendar/locale-all


$('#calendar').fullCalendar({
  events: $('#calendar').data('event')
});


$(document).ready(function () {

    $('#sidebarCollapse').on('click', function () {
        $('#sidebarCollapse').removeClass('active-focus')
        $('#sidebar').toggleClass('active');
    });
});

Swal.fire(
  'Good job!',
  'You clicked the button!',
  'success'
)
