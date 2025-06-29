//  OpenSCAD Program
//  Brendan Fennell
//  BF3DPrinting LLC

//  Leaned Flush 25mm Base

input="";

difference(){
hull(){//BodyAdd
    //TopLeft
    translate([0,wtag/2-rout,0]) 
    cylinder(htag,rout,rout);
    //TopRight
    translate([ltex+rout-leanback*htex,wtag/2-rout,0]) 
    cylinder(htag,rout,rout);
    //BotLeft
    translate([leanback*htex,-wtag/2+rout,0]) 
    cylinder(htag,rout,rout);
    //BotRight
    translate([ltex+rout,-wtag/2+rout,0]) 
    cylinder(htag,rout,rout);
}
// Top Text
color("gray")
multmatrix(m1)
linear_extrude(hstrip+bit)
text(text=input,size=htex,font="Arial:style=bold",halign="center",valign="center");

// Bottom Text
color("gray")
multmatrix(m2)
mirror([0,1,0])
linear_extrude(hstrip+bit)
text(text=input,size=htex,font="Arial:style=bold",halign="center",valign="center");

// Borders - New Approach - Dual Cut
color("gray")
difference(){
hull(){//BodyAdd
    //TopLeft
    translate([0,wtag/2-rout,-bit]) 
    cylinder(htag+2*bit,rout+bit,rout+bit);
    //TopRight
    translate([ltex+rout-leanback*htex,wtag/2-rout,-bit]) 
    cylinder(htag+2*bit,rout+bit,rout+bit);
    //BotLeft
    translate([leanback*htex,-wtag/2+rout,-bit]) 
    cylinder(htag+2*bit,rout+bit,rout+bit);
    //BotRight
    translate([ltex+rout,-wtag/2+rout,-bit]) 
    cylinder(htag+2*bit,rout+bit,rout+bit);
}
hull(){//BodyHollow
    //TopLeft
    translate([0,wtag/2-rout,-bit]) 
    cylinder(htag+2*bit,rout-tstrip,rout-tstrip);
    //TopRight
    translate([ltex+rout-leanback*htex,wtag/2-rout,-bit]) 
    cylinder(htag+2*bit,rout-tstrip,rout-tstrip);
    //BotLeft
    translate([leanback*htex,-wtag/2+rout,-bit]) 
    cylinder(htag+2*bit,rout-tstrip,rout-tstrip);
    //BotRight
    translate([ltex+rout,-wtag/2+rout,-bit]) 
    cylinder(htag+2*bit,rout-tstrip,rout-tstrip);
}
hull(){//BodySplit
    //TopLeft
    translate([0,wtag/2-rout,hstrip]) 
    cylinder(htag-2*hstrip,rout+bit,rout+bit);
    //TopRight
    translate([ltex+rout-leanback*htex,wtag/2-rout,hstrip]) 
    cylinder(htag-2*hstrip,rout+bit,rout+bit);
    //BotLeft
    translate([leanback*htex,-wtag/2+rout,hstrip]) 
    cylinder(htag-2*hstrip,rout+bit,rout+bit);
    //BotRight
    translate([ltex+rout,-wtag/2+rout,hstrip]) 
    cylinder(htag-2*hstrip,rout+bit,rout+bit);
}
}
color("white")
translate([leanback*htex/2,0,-bit])
cylinder(htag+2*bit,rhole,rhole);
}

// Tag Dimensions
wtag=25;
htag=5;
htex=wtag*.6;
hstrip=(5*.2);
rout=7;
rhole=3;
lhole=5;
tstrip=(5*.4);
leanback=0.5;//.05
bit=.01;
$fn=50;
metrics=textmetrics(text=input,size=htex,font="Arial:style=bold",halign="left",valign="center");
ltex=metrics.size[0]-metrics.position[0]+leanback*htex;
m1= [[1,-leanback,0,rout+ltex/2],
    [0,1,0,0],
    [0,0,1,htag-hstrip]];
m2= [[1,-leanback,0,rout+ltex/2],
    [0,1,0,0],
    [0,0,1,-bit]];
echo(ltex);