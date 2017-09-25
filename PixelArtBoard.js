function updateGrid() {

    var x =sx.text;
    var y =sx.text;

    grid.columns=x;
    grid.rows=y;

    var w = grid.width/grid.columns;
    var h = grid.height/grid.rows;
    for(var i = grid.children.length; i > 0 ; i--) {
            grid.children[i-1].destroy()
    }

    for(var i=0;i<x;i++)
        for(var j=0;j<y;j++)
        {
            var obj = Qt.createQmlObject("import Pixels 1; Pixel{width:"+w+";height:"+h+";}",grid,"pix"+(i*x+j));

        }
    console.log("updated");
}
