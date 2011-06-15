(function ($) {
  
  
    // Monkey patch jQuery 1.3.1+ css() method to support CSS 'transform'
    // property uniformly across Webkit/Safari/Chrome, Firefox 3.5+, and IE 9+.
    // 2009-2010 Zachary Johnson www.zachstronaut.com
    // Updated 2010.11.26
    function getTransformProperty(element)
    {
        // Try transform first for forward compatibility
        var properties = ['transform', 'WebkitTransform', 'MozTransform', 'msTransform', 'OTransform'];
        var p;
        while (p = properties.shift())
        {
            if (typeof element.style[p] != 'undefined')
            {
                return p;
            }
        }
        
        // Default to transform also
        return 'transform';
    }
    
    var proxied = $.fn.css;
    $.fn.css = function (arg, val)
    {
        // Find the correct browser specific property and setup the mapping using
        // $.props which is used internally by jQuery.attr() when setting CSS
        // properties via either the css(name, value) or css(properties) method.
        // The problem with doing this once outside of css() method is that you
        // need a DOM node to find the right CSS property, and there is some risk
        // that somebody would call the css() method before body has loaded or any
        // DOM-is-ready events have fired.
        if
        (
            typeof $.props['transform'] == 'undefined'
            &&
            (
                arg == 'transform'
                ||
                (
                    typeof arg == 'object'
                    && typeof arg['transform'] != 'undefined'
                )
            )
        )
        {
            $.props['transform'] = getTransformProperty(this.get(0));
        }
        
        // We force the property mapping here because jQuery.attr() does
        // property mapping with jQuery.props when setting a CSS property,
        // but curCSS() does *not* do property mapping when *getting* a
        // CSS property.  (It probably should since it manually does it
        // for 'float' now anyway... but that'd require more testing.)
        //
        // But, only do the forced mapping if the correct CSS property
        // is not 'transform' and is something else.
        if ($.props['transform'] != 'transform')
        {
            // Call in form of css('transform' ...)
            if (arg == 'transform')
            {
                arg = $.props['transform'];
                
                // User wants to GET the transform CSS, and in jQuery 1.4.3
                // calls to css() for transforms return a matrix rather than
                // the actual string specified by the user... avoid that
                // behavior and return the string by calling jQuery.style()
                // directly
                if (typeof val == 'undefined' && jQuery.style)
                {
                    return jQuery.style(this.get(0), arg);
                }
            }

            // Call in form of css({'transform': ...})
            else if
            (
                typeof arg == 'object'
                && typeof arg['transform'] != 'undefined'
            )
            {
                arg[$.props['transform']] = arg['transform'];
                delete arg['transform'];
            }
        }
        
        return proxied.apply(this, arguments);
    };
})(jQuery);

(function ($) {
    // Monkey patch jQuery 1.3.1+ to add support for setting or animating CSS
    // scale and rotation independently.
    // 2009-2010 Zachary Johnson www.zachstronaut.com
    // Updated 2010.11.06
    var rotateUnits = 'deg';
    
    $.fn.rotate = function (val)
    {
        var style = $(this).css('transform') || 'none';
        
        if (typeof val == 'undefined')
        {
            if (style)
            {
                var m = style.match(/rotate\(([^)]+)\)/);
                if (m && m[1])
                {
                    return m[1];
                }
            }
            
            return 0;
        }
        
        var m = val.toString().match(/^(-?\d+(\.\d+)?)(.+)?$/);
        if (m)
        {
            if (m[3])
            {
                rotateUnits = m[3];
            }
            
            $(this).css(
                'transform',
                style.replace(/none|rotate\([^)]*\)/, '') + 'rotate(' + m[1] + rotateUnits + ')'
            );
        }
        
        return this;
    }
    
    // Note that scale is unitless.
    $.fn.scale = function (val, duration, options)
    {
        var style = $(this).css('transform');
        
        if (typeof val == 'undefined')
        {
            if (style)
            {
                var m = style.match(/scale\(([^)]+)\)/);
                if (m && m[1])
                {
                    return m[1];
                }
            }
            
            return 1;
        }
        
        $(this).css(
            'transform',
            style.replace(/none|scale\([^)]*\)/, '') + 'scale(' + val + ')'
        );
        
        return this;
    }

    // fx.cur() must be monkey patched because otherwise it would always
    // return 0 for current rotate and scale values
    var curProxied = $.fx.prototype.cur;
    $.fx.prototype.cur = function ()
    {
        if (this.prop == 'rotate')
        {
            return parseFloat($(this.elem).rotate());
        }
        else if (this.prop == 'scale')
        {
            return parseFloat($(this.elem).scale());
        }
        
        return curProxied.apply(this, arguments);
    }
    
    $.fx.step.rotate = function (fx)
    {
        $(fx.elem).rotate(fx.now + rotateUnits);
    }
    
    $.fx.step.scale = function (fx)
    {
        $(fx.elem).scale(fx.now);
    }
    
    /*
    
    Starting on line 3905 of jquery-1.3.2.js we have this code:
    
    // We need to compute starting value
    if ( unit != "px" ) {
        self.style[ name ] = (end || 1) + unit;
        start = ((end || 1) / e.cur(true)) * start;
        self.style[ name ] = start + unit;
    }
    
    This creates a problem where we cannot give units to our custom animation
    because if we do then this code will execute and because self.style[name]
    does not exist where name is our custom animation's name then e.cur(true)
    will likely return zero and create a divide by zero bug which will set
    start to NaN.
    
    The following monkey patch for animate() gets around this by storing the
    units used in the rotation definition and then stripping the units off.
    
    */
    
    var animateProxied = $.fn.animate;
    $.fn.animate = function (prop)
    {
        if (typeof prop['rotate'] != 'undefined')
        {
            var m = prop['rotate'].toString().match(/^(([+-]=)?(-?\d+(\.\d+)?))(.+)?$/);
            if (m && m[5])
            {
                rotateUnits = m[5];
            }
            
            prop['rotate'] = m[1];
        }
        
        return animateProxied.apply(this, arguments);
    }
})(jQuery);









$(function(){

  var menu_top = 265//$('#menu').offset().top - $('#menu').height() + 7

  $(window).scroll(function() {
    // $('#foo').css('top', (600 - $(this).scrollTop()/4)+'px')
    if( $(this).scrollTop() > menu_top )
      $('#menu').show().css('position', 'fixed').css('top', 0).addClass('docked');
    else
      $('#menu').css('position', 'relative').removeClass('docked')
  });

  $('dd.links a').mouseover(function(){
    var img = $(this).find('img')
    var src = img.attr('src')
    img.attr('src', src.replace('.png','-hover.png'))
  }).mouseout(function(){
    var img = $(this).find('img')
    var src = img.attr('src')
    img.attr('src', src.replace('-hover',''))
  })

  imgs = $('.photos .frame img')
  imgs.css({left:'-20px', top:'-60px'})
  abouts = $('.photos .about')
  bios = $('.photos .bio')
  speakers = $('#spearkers-list li')
  
  actual = 0
  change_img = function(){
    imgs.eq(actual).fadeOut(function(){ $(this).scale(1) })
    abouts.eq(actual).hide()
    bios.eq(actual).hide()
    speakers.eq(actual).removeClass('selected')
    actual++
    if( actual == imgs.length )
      actual = 0
    abouts.eq(actual).show()
    bios.eq(actual).show()
    speakers.eq(actual).addClass('selected')
    imgs.eq(actual).fadeIn(function(){
      $(this).animate({scale:0.9}, {duration:10000, easing:'linear', complete:change_img})
    })
  }

  imgs.hide().eq(0).show().animate({scale:0.9}, {duration:10000, easing:'linear', complete:change_img})
  abouts.hide().eq(0).show()
  bios.hide().eq(0).show()
  speakers.eq(0).addClass('selected')

  $('a.tip[rel]').each(function(){

    $(this).attr('title','clique para saber mais').qtip({
      content: {
        text: $( $(this).attr('rel') ).html(),
        title: {
          text: $(this).text(),
          button: 'Fechar'
        }
      },

      position: {
         adjust: {
            screen: true // Keep the tooltip on-screen at all times
         }
      },

      style: {
        border: {
         radius: 4,
         color: '#999'
        },
        tip: true,
        name: 'light',
        width: 640
      },
      
      position: {
         target: $(document.body), // Position it via the document body...
         corner: 'center' // ...at the center of the viewport
      },
      show: {
         when: 'click', // Show it on click
         solo: true // And hide all other tooltips
      },
      hide: false,
      api: {
         beforeShow: function()
         {
            // Fade in the modal "blanket" using the defined show speed
            $('#qtip-blanket').fadeIn(this.options.show.effect.length);
         },
         beforeHide: function()
         {
            // Fade out the modal "blanket" using the defined hide speed
            $('#qtip-blanket').fadeOut(this.options.hide.effect.length);
         }
      }
      
    })
  })


  $("a[href^='#']").click(function(){
    href = $(this).attr('href')
    pos = $(href).position()
    pos.top -= 50
    $.scrollTo(pos,600)
    //if(href == '#contact_us') $('.send_another').click()
    //if(href == '#top') change_emphasis(emphasis, 0)
    return false
  })


  // Create the modal backdrop on document load so all modal tooltips can use it
  $('<div id="qtip-blanket">')
     .css({
        position: 'absolute',
        top: $(document).scrollTop(), // Use document scrollTop so it's on-screen even if the window is scrolled
        left: 0,
        height: $(document).height() + 600, // Span the full document height...
        width: '100%', // ...and full width

        opacity: 0.7, // Make it slightly transparent
        backgroundColor: 'black',
        zIndex: 5000  // Make sure the zIndex is below 6000 to keep it below tooltips!
     })
     .appendTo(document.body) // Append to the document body
     .hide(); // Hide it initially
})