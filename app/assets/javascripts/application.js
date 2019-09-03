//= require rails-ujs
//= require_tree .


$(document).ready(function () {

    $('#sidebarCollapse').on('click', function () {
        $('#sidebarCollapse').removeClass('active-focus')
        $('#sidebar').toggleClass('active');
    });

});
