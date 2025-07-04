//  OpenSCAD Program
//  Brendan Fennell
//  BF3DPrinting LLC

//  BE1M-15a
//  Bordered Extruded 1-line Mirrored 15mm Accents

input="";




// Top Text
color("gray")
translate([-metrics.position[0]+rout,0,htag-hlet])
linear_extrude(hlet)
text(text=input,size=htex,font="Collegiate:style=bold",halign="left",valign="center");

// Bottom Text
color("gray")
translate([-metrics.position[0]+rout,0,0])
mirror([0,1,0])
linear_extrude(hlet)
text(text=input,size=htex,font="Collegiate:style=bold",halign="left",valign="center");

// Top Outline
color("gray")
difference(){
   
hull(){
    //Left Cylinder
    translate([0,0,htag-hlet]) 
    cylinder(hlet,rout,rout);
    //Right Cylinder
    translate([metrics.size[0]+rout,0,htag-hlet]) 
    cylinder(hlet,rout,rout);

}
    // Body Cut
hull(){
    //Left Cylinder
    translate([0,0,htag-hlet-bit]) 
    cylinder(hlet+2*bit,rout-tstrip,rout-tstrip);
    //Right Cylinder
    translate([metrics.size[0]+rout,0,htag-hlet-bit]) 
    cylinder(hlet+2*bit,rout-tstrip,rout-tstrip);
}
}

// Bottom Outline
color("gray")
difference(){
   
hull(){
    //Left Cylinder
    translate([0,0,0]) 
    cylinder(hlet,rout,rout);
    //Right Cylinder
    translate([metrics.size[0]+rout,0,0]) 
    cylinder(hlet,rout,rout);

}
    // Body Cut
hull(){
    //Left Cylinder
    translate([0,0,0-bit]) 
    cylinder(hlet+2*bit,rout-tstrip,rout-tstrip);
    //Right Cylinder
    translate([metrics.size[0]+rout,0,0-bit]) 
    cylinder(hlet+2*bit,rout-tstrip,rout-tstrip);
}
}

// Support
color("gray")
union(){
difference(){
cylinder(hlet,rhole+.3,rhole+.3);
translate([0,0,-bit])
cylinder(hlet+2*bit,rhole,rhole);
}
cylinder(0.2,rout-tstrip-1,rout-tstrip-1);
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