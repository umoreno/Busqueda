function showdeadcenterdiv(Xwidth,Yheight,divid) { 

    // First, determine how much the visitor has scrolled 

    var scrolledX, scrolledY; 
    if( self.pageYOffset ) { 
    scrolledX = self.pageXOffset; 
    scrolledY = self.pageYOffset; 
    } else if( document.documentElement && document.documentElement.scrollTop ) { 
    scrolledX = document.documentElement.scrollLeft; 
    scrolledY = document.documentElement.scrollTop; 
    } else if( document.body ) { 
    scrolledX = document.body.scrollLeft; 
    scrolledY = document.body.scrollTop; 
    } 

    // Next, determine the coordinates of the center of browser's window 

    var centerX, centerY; 
    if( self.innerHeight ) { 
    centerX = self.innerWidth; 
    centerY = self.innerHeight; 
    } else if( document.documentElement && document.documentElement.clientHeight ) { 
    centerX = document.documentElement.clientWidth; 
    centerY = document.documentElement.clientHeight; 
    } else if( document.body ) { 
    centerX = document.body.clientWidth; 
    centerY = document.body.clientHeight; 
    } 

    // Xwidth is the width of the div, Yheight is the height of the 
    // div passed as arguments to the function: 
    var leftOffset = scrolledX + (centerX - Xwidth) / 2; 
    var topOffset = scrolledY + (centerY - Yheight) / 2; 
    // The initial width and height of the div can be set in the 
    // style sheet with display:none; divid is passed as an argument to // the function 
    var o=document.getElementById(divid);     
    if (o != null) { 
        var r=o.style;
        r.position='absolute'; 
        r.top = topOffset + 'px'; 
        r.left = leftOffset + 'px'; 
        r.display = "block";
    }
}
    
function getWidth() {
  var myWidth = 0, myHeight = 0;
  if( typeof( window.innerWidth ) == 'number' ) {
    //Non-IE
    myWidth = window.innerWidth;
    myHeight = window.innerHeight;
  } else if( document.documentElement && ( document.documentElement.clientWidth || document.documentElement.clientHeight ) ) {
    //IE 6+ in 'standards compliant mode'
    myWidth = document.documentElement.clientWidth;
    myHeight = document.documentElement.clientHeight;
  } else if( document.body && ( document.body.clientWidth || document.body.clientHeight ) ) {
    //IE 4 compatible
    myWidth = document.body.clientWidth;
    myHeight = document.body.clientHeight;
  }
  return myWidth;
}
    
function setComboWidth(){
    if(!document.getElementById('projId') || !document.getElementById(document.getElementById('projId').value)) return;
    
    //document.getElementById(document.getElementById('projId').value).style.width=(getWidth()-110)+"px";
    var windowWidth = getWidth();
    if (getWidth() < 1210)
        document.getElementById(document.getElementById('projId').value).style.width="300px";
    else
        document.getElementById(document.getElementById('projId').value).style.width=(windowWidth-810)+"px";
}

function multilineMaxLength(txt,maxLen,name) {
    try {
        if (txt.value.length > (maxLen - 1)) {
            window.alert(name + ' can not have more than ' + maxLen + ' characters');
            return false;
        }
        else return true;
    } catch (e) {
    }
}  

function disableEnterKey(e)
{
    var key;      
    if(window.event)
        key = window.event.keyCode; //IE
    else
        key = e.which; //firefox      

    return (key != 13);
}
