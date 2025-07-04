// Brendan Fennell
// BF3DPrinting
// Abstracted Program

// Create A Meta Program To Generate Any Standard Name Tag


//Lettering Style
letter="Flush";//[Flush,Extruded, Negative]

//Style of Tag Perimeter
border="Bordered";//[Bordered,Clean]

//General Tag Shape
shape="Square";//[Square,Hanging,Bubble]

//Amount of Lean
lean="Nolean";//[Nolean,Lean]

//Lines of Text
lines="1 Line";//[1 Line,2 Lines,3 Lines]

//Side Differences?
side="Mirrored";//[Mirrored,Unique,Single Sided]

// Size
size="25mm";//[15mm,25mm,35mm]

// User Input
input="";

// Accents or Background
mode="accents";//[accents,background]


// Print To Screen
echo("");
echo("");
echo("");
echo("");

echo(str(letter,"-",border,"-","-",shape,"-",lean,"-",lines,"-",side,"-",size,"-",mode));
echo(PN);

echo("");
echo("");
echo("");
echo("");

// Geometry
cube(1);
if(letter[0]=="F"){
translate([.5,.5,.5])
cube(1);
}



// Compress inputs into a part number
PN=str(letter[0],border[0],shape[0],lean[0],lines[0],side[0],"-",size[0],size[1],mode[0]);

// Process Variables
hlay=.2;//200 micron
wnoz=.4;//400 micron

// Tag Dimensions in mm
wtag=(ord(size[0])-48)*10+ord(size[1])-48;
htag=5;//Five millimeters Height
htex=wtag*.6;// 60% Tag Width
hlet=8*hlay;//Letters Ten Layers Thick
tstrip=hlet;//Border Same As Letters
rout=wtag/2;//Corner Radius
rhole=3;//Hole Size


// Incremental Value
bit=.001;//1 micron "nudge"