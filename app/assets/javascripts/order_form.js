$(document).on('ready', function(){
    var $from_input = $('#from-field input')
    var $to_input = $('#to-field input')
    var today = new Date()
    var calendar_config = {
        inline:true,
        container: '#calendar',
        alwaysOpen:true,
        startDate: ''+today.getDate()+'.'+today.getMonth()+'.'+today.getYear(),
        format: 'DD.MM.YYYY',
        separator : ' to ',
        getValue: function()
        {
            if ($('#from-field input').val() && $('#to-field input').val() ) {
                return $('#from-field input').val() + ' to ' + $('#to-field input').val();
            }
            else {
                return '';
            }
        },
        setValue: function(s,s1,s2)
        {
            //$('#from-field input').val(s1);
            //$('#to-field input').val(s2);
        }
    }

    $('#calendar').dateRangePicker(calendar_config);

    keycodes = []
    number_key_codes = [48, 49, 50, 51, 52, 53, 54, 55, 56, 57 ];
    separator_codes = [44, 45, 46, 47, 13, 92, 188, 190, 191, 220]
    backspace = 8
    arrows = [37, 38, 39, 40]


    keycodes = keycodes.concat(number_key_codes)
    keycodes = keycodes.concat(separator_codes)
    keycodes.push(backspace)
    keycodes = keycodes.concat(arrows)

    var default_separator = '.'

    var validateFormat = function(date){
        var res = date.match(/^\d{1,2}.|\/|-|\\\d{1,2}.|\/|-|\\\d{1,2}$/g);
        return res? true : false;
    }

    function analizeKeyboardEvents(){
        var $this = $(this)
        var val = $this.val()
        if(keycodes.indexOf(event.keyCode) == -1){
            event.preventDefault()
        }
        else if(event.keyCode == 13){ // Enter
            $this.val(val + default_separator)
        }

        var to = $to_input.val()
        var from = $from_input.val()



        if(typeof from == 'string' && validateFormat(from) && typeof to == 'string' && validateFormat(to)){

                $('#calendar').data('dateRangePicker').setDateRange( from, to )
            console.log("from: "+from +"\nto: "+to)

        }
        else if(typeof to == 'string' && validateFormat(to)){
            $('#calendar').data('dateRangePicker').setDateRange( false, to )
            console.log("from: "+false +"\nto: "+to)
        }
        else if(typeof from == 'string' && validateFormat(from)){
            $('#calendar').data('dateRangePicker').setDateRange( from, false )
            console.log("from: "+from +"\nto: "+false)
        }

        else{
            //alert('none')
        }



    }

    $from_input.on('keydown', analizeKeyboardEvents)

    $to_input.on('keydown', analizeKeyboardEvents)




})