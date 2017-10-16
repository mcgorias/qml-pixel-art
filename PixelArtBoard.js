function cleanGrid(){
    for(var i = grid.children.length; i > 0 ; i--)
    {
        var item = grid.children[i-1];
        item.changeState(false);
    }
}
function updateGrid() {
    var Pixel;
    Pixel = Qt.createComponent("Pixel2.qml");

    var x =Number(sx.text);
    var y =Number(sx.text);
    if(x>100)
        return;

    var w = grid.width /x ;
    var h = grid.height/y ;


    if(grid.columns==x && grid.rows == y)
    {
        for(var i  = grid.children.length; i > 0 ; i--)
        {
            grid.children[i-1].width=w;
            grid.children[i-1].height=h;
        }
        return;
    }

    for(var i = grid.children.length; i > 0 ; i--) {
            grid.children[i-1].destroy()
    }

    grid.columns=x;
    grid.rows=y;

    for(var i=0;i<x;i++)
        for(var j=0;j<y;j++)
        {
            var pix = Pixel.createObject(grid);
            pix.width = w;
            pix.height = h;

        }
    console.log("updated "+w+" "+h);
}
