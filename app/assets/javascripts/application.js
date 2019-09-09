//= require rails-ujs
//= require moment
//= require fullcalendar
//= require fullcalendar/locale-all
//= require jquery.slick
//= require_tree .

//= require chartkick
//= require Chart.bundle

$('#calendar').fullCalendar({
  events: $('#calendar').data('event')
});


$(document).ready(function () {

    $('#sidebarCollapse').on('click', function () {
        $('#sidebarCollapse').removeClass('active-focus')
        $('#sidebar').toggleClass('active');
    });
});


$('.single-item').slick();


