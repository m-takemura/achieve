ready = ->
    $(window).scroll ->
        element = $('#page-top-btn')
        visible = element.is(':visible')
        height = $(window).scrollTop()
        scrolledHeight = $('#page-top-btn').attr('data-scrolled')
        if height > scrolledHeight
            element.fadeIn() if !visible
        else
            element.fadeOut()
            
    $(document).on 'click', '#move-page-top', ->
        $('html,body').animate({scrollTop:0},'slow')
    
$(document).ready(ready)
$(document).on('page:load', ready)