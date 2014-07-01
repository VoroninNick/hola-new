// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

function initializeHomeMap(){
    var map;
    var HOME_MAPTYPE_ID = 'home_style';

    var homeStyleProperties = [
        {
            featureType: 'all',
            stylers: [
                { "saturation": -100 },
                { "lightness": 0 },
                { "gamma": 1.18 }
            ]
        }
    ];

    var mapOptions = {
        zoom: 16,
        center: new google.maps.LatLng(49.840387, 24.030778),
        scrollwheel: false,
        mapTypeId: HOME_MAPTYPE_ID
    };

    map = new google.maps.Map(document.getElementById('home-map-container'),
        mapOptions);

    var styledMapOptions = {
        //name: 'Custom Style'
        name: 'home style'
    };

    var customMapType = new google.maps.StyledMapType(homeStyleProperties, styledMapOptions);

    map.mapTypes.set(HOME_MAPTYPE_ID, customMapType);
}

$(document).on('ready page:load', function(){
//  var $home_form = $('#home-form')
//  var $home_form_selects = $home_form.find('select')
//  $home_form_selects.selectize({
//      //createOnBlur: true,
//      onLoad: function(){
//          console.log('onload')
//        //$(this).find('input').css({display: 'none'})
//      }
//  })

    /*$('#select-state').selectize({
        maxItems: 3
    });

    $('#select-country').selectize();

    $('#my-select').selectize({

    })*/


    initializeHomeMap()


    /*$(".modal-link").each(function() {
        $link = $(this)
        var original_href = $link.attr('href')
    });*/


})