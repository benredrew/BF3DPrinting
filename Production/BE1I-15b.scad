//  OpenSCAD Program August 2024 Major Update
//  Brendan Fennell
//  BF3DPrinting LLC
//  August 8, 2024

//  Goal: Make use of new textmetrics function to create auto-sized nametags

input="";




// Body
color("gray")
union(){
difference(){
   
hull(){
    //TopLeft
    translate([0,0,hlet]) 
    cylinder(htag-2*hlet,rout,rout);
    //TopRight
    translate([metrics.size[0]+rout,0,hlet]) 
    cylinder(htag-2*hlet,rout,rout);

}
    // Hole Cut
    translate([0,0,hlet-bit])
    cylinder(htag-2*hlet+2*bit,rhole,rhole);
}
translate([0,0,hlet])
cylinder(.2,rhole,rhole);
}

// Tag Dimensions
wtag=15;
htag=5;
htex=8;
hlet=1.6;
rout=wtag/2;
rhole=3;
tstrip=1.6;
bit=.01;
$fn=50;

metrics=textmetrics(text=input,size=htex,font="Collegiate:style=bold",halign="left",valign="center");