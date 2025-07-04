//  OpenSCAD Program
//  Brendan Fennell
//  BF3DPrinting LLC

//  BE1M-15a
//  Bordered Extruded 1-line Mirrored 15mm Background

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