// Define the string and numerical inputs in the customizer pane
string_input = "BELLES";
// Define Font Size
sizee=1; //0.05
s1=0.60; //0.01
s2=0.6; //0.01
s3=0.60; //0.01
s4=0.60; //0.01
s5=0.60; //0.01
s6=0.60; //0.01
s7=0.60; //0.01
s8=0.60; //0.01
s9=0.60; //0.01
s10=0.60; //0.01
s11=0.60; //0.01
s12=0.60; //0.01
s13=0.60; //0.01
s14=0.60; //0.01
s15=0.60; //0.01
s16=0.60; //0.01
s17=0.60; //0.01
s18=0.60; //0.01
s19=0.60; //0.01
s20=0.60; //0.01

vec=([s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20]);

$fn=100;

// Function to create linear extrusions for each character
module createExtrusion(character, position, shift_size) {
    // Create a linear extrusion for the character
    translate([position * shift_size, 0, 0]){
    linear_extrude(height = .25) {
        text(character, size = sizee, font = "Gobold Bold");
    }}
    // Shift the object to the right by the position times the associated shift size
}

// Loop through each character in the string and create linear extrusions
translate([0,sizee/2,0])
rotate([180,0,0])
difference(){
union(){
for (i = [0:len(string_input) - 1]) {
    character = string_input[i];
    position = i;
    shift_size = vec[i % len(vec)];
    createExtrusion(character, position, shift_size);
}

translate([-.02,1.3/2,0])

    cylinder(.25,.32,.32);
    
}
translate([-.01,1.3/2,0])
cylinder(.25,.125,.125);
}

/*
In this updated script, the customizer pane will display a string input (v) and 20 numerical inputs (s). The numerical inputs default to a value of 0.60 and can be adjusted by increments of 0.01. For each character n in the string v, a linear extrusion is created. The object is shifted to the right by a size determined by the character times the integer n representing the placement of the specific character in the string v, and the associated numerical input.
*/
