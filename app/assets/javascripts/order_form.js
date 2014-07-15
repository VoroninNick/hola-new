$(document).on('ready', function(){
    var calendar_config = {
        inline:true,
        container: '#calendar',
        alwaysOpen:true
    }
    $('#calendar').dateRangePicker(calendar_config);
})