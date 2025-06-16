//  OpenSCAD Program
//  Brendan Fennell
//  BF3DPrinting LLC
//  June 15, 2025

//  LeanBack Flush 25mm Accents

input="";


// Top Text
color("gray")
multmatrix(m1)
linear_extrude(hstrip)
text(text=input,size=htex,font="Arial:style=bold",halign="center",valign="center");

// Bottom Text
color("gray")
multmatrix(m2)
mirror([0,1,0])
linear_extrude(hstrip)
text(text=input,size=htex,font="Arial:style=bold",halign="center",valign="center");

// Top Stripe
color("gray")
difference(){
hull(){//StripeAdd
    //TopLeft
    translate([0,wtag/2-rout,htag-hstrip]) 
    cylinder(hstrip,rout,rout);
    //TopRight
    translate([ltex+rout-leanback*htex,wtag/2-rout,htag-hstrip]) 
    cylinder(hstrip,rout,rout);
    //BotLeft
    translate([leanback*htex,-wtag/2+rout,htag-hstrip]) 
    cylinder(hstrip,rout,rout);
    //BotRight
    translate([ltex+rout,-wtag/2+rout,htag-hstrip]) 
    cylinder(hstrip,rout,rout);
}
hull(){//StripeSubtract
    //TopLeft
    translate([0,wtag/2-rout,htag-hstrip-bit]) 
    cylinder(hstrip+2*bit,rout-tstrip,rout-tstrip);
    //TopRight
    translate([ltex+rout-leanback*htex,wtag/2-rout,htag-hstrip-bit]) 
    cylinder(hstrip+2*bit,rout-tstrip,rout-tstrip);
    //BotLeft
    translate([leanback*htex,-wtag/2+rout,htag-hstrip-bit]) 
    cylinder(hstrip+2*bit,rout-tstrip,rout-tstrip);
    //BotRight
    translate([ltex+rout,-wtag/2+rout,htag-hstrip-bit]) 
    cylinder(hstrip+2*bit,rout-tstrip,rout-tstrip);
}
}

// Bottom Stripe
color("gray")
difference(){
hull(){//StripeAdd
    //TopLeft
    translate([0,wtag/2-rout,0]) 
    cylinder(hstrip,rout,rout);
    //TopRight
    translate([ltex+rout-leanback*htex,wtag/2-rout,0]) 
    cylinder(hstrip,rout,rout);
    //BotLeft
    translate([leanback*htex,-wtag/2+rout,0]) 
    cylinder(hstrip,rout,rout);
    //BotRight
    translate([ltex+rout,-wtag/2+rout,0]) 
    cylinder(hstrip,rout,rout);
}
hull(){//StripeSubtract
    //TopLeft
    translate([0,wtag/2-rout,-bit]) 
    cylinder(hstrip+2*bit,rout-tstrip,rout-tstrip);
    //TopRight
    translate([ltex+rout-leanback*htex,wtag/2-rout,-bit]) 
    cylinder(hstrip+2*bit,rout-tstrip,rout-tstrip);
    //BotLeft
    translate([leanback*htex,-wtag/2+rout,-bit]) 
    cylinder(hstrip+2*bit,rout-tstrip,rout-tstrip);
    //BotRight
    translate([ltex+rout,-wtag/2+rout,-bit]) 
    cylinder(hstrip+2*bit,rout-tstrip,rout-tstrip);
}
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
    [0,0,1,0]];
echo(ltex);