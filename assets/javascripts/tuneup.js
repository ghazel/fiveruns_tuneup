Event.observe(window, 'load', function() {
  $A($(document.body).descendants()).each(function(e){
    var pos = Element.getStyle(e, 'position');
    if(pos == 'absolute' || pos == 'fixed') {
     var top = parseFloat(Element.getStyle(e, 'top') || 0);
     e.style.top = (top + 55) + 'px'; 
    }
  })
  new Insertion.Top(document.body, "<div id='tuneup'><h3>TuneUp</h3><div id='tuneup-content'></div></div><div id='tuneup-flash'></div>");
  new Ajax.Request('/tuneup?uri=' + encodeURIComponent(document.location.href), {asynchronous:true, evalScripts:true});
});