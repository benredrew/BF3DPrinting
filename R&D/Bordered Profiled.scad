//  OpenSCAD Program
//  Brendan Fennell
//  BF3DPrinting LLC
//  11/25/2023

//  Goal: Differently Shaped Bordered Tag

$fn=100;

input="Clean";

// Tag dimensions
ltag=3.0;//0.5
wtag=1.25;
ztag=0.2;
zcut=0.05;
rout=0.3;
rhole=0.125;
tstrip=.08;
hstrip=.05;
bit=.001;

union(){
difference(){
   
hull(){ //body
cylinder(ztag,rout,rout);
    translate([ltag-2*rout,wtag/2-rout,0])
cylinder(ztag,rout,rout);
    translate([ltag-2*rout,-wtag/2+rout,0])
cylinder(ztag,rout,rout);
    translate([rout,wtag/2-rout,0])
cylinder(ztag,rout,rout);
    translate([rout,-wtag/2+rout,0])
cylinder(ztag,rout,rout);
}
hull(){ //relief
    translate([0,0,ztag-zcut])
cylinder(zcut+bit,rout-tstrip,rout-tstrip);
    translate([ltag-2*rout,wtag/2-rout,ztag-zcut])
cylinder(zcut+bit,rout-tstrip,rout-tstrip);
    translate([ltag-2*rout,-wtag/2+rout,ztag-zcut])
cylinder(zcut+bit,rout-tstrip,rout-tstrip);
    translate([rout,wtag/2-rout,ztag-zcut])
cylinder(zcut+bit,rout-tstrip,rout-tstrip);
    translate([rout,-wtag/2+rout,ztag-zcut])
cylinder(zcut+bit,rout-tstrip,rout-tstrip);
}
translate([0,0,-bit/2])
cylinder(h=ztag+bit,r1=rhole,r2=rhole);
}
#translate([rout,0,0])
    resize([ltag-3*rout,0,ztag],auto=true)
    linear_extrude(height=ztag) 
    text(input,font="Collegiate:style=Bold",halign="left",valign="center",$fn=100);
}