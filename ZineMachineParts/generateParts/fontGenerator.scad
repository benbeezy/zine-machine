/*
This openScad file is for generating block for use with the 3D printed zine machine project
This does a few really cool things

1) You can make custom blocks with any size you'd like. These blocks can span multiple rows and be any width you'd like
2) You can use any font you have installed on your computer! Including things like Font Awesome!

*/
font="Liberation Sans:style=Bold Italic";
letters = "abcdefghijklmnopqrstuvwxyz";
font_size = 3;
number_of_rows = 1;
letter_width = 4;
row_count = 1;
connecting_ridge= true;
module letter(value){
    union(){
        difference(){
            round_cube(1,20,8*row_count,7.85,letter_width);
            translate([-4*(row_count-1),0,0]) for(idx = [ 0 : row_count - 1 ] ){
                translate([idx*8,0,0]){
                    translate([0,0.5,0]) cylinder(d=4.05, h=letter_width+1, center=true, $fn=50);
                    translate([0,(4.05-2)/2 +0.5,0]) cube([4.05,2,letter_width+1], center= true);
                }
            }
            translate ([0,3.5,0])rotate([0,90,90]){
                linear_extrude(height = 10){
                    text(value, font=font, size= font_size, halign= "center", valign="center");
                }
            }
        }
        translate([0,(4.05-1)/2 + 0.5,0]) cube([7*row_count,1,letter_width], center= true);
    }
    translate ([0,-3.9-3,0])rotate([0,90,90]){
        linear_extrude(height = 3){
            text(value, font=font, size= font_size, halign= "center", valign="center");
        }
    }
}

module round_cube(radius, resolution, x, y, z){
    hull(){
        translate([(x/2)-radius,(y/2)-radius,(z/2)-radius]) sphere(r=radius,$fn = resolution);
        translate([-(x/2)+radius,(y/2)-radius,(z/2)-radius]) sphere(r=radius,$fn = resolution);
        translate([(x/2)-radius,-(y/2)+radius,(z/2)-radius]) sphere(r=radius,$fn = resolution);
        translate([-(x/2)+radius,-(y/2)+radius,(z/2)-radius]) sphere(r=radius,$fn = resolution);
        translate([(x/2)-radius,(y/2)-radius,-(z/2)+radius]) sphere(r=radius,$fn = resolution);
        translate([-(x/2)+radius,(y/2)-radius,-(z/2)+radius]) sphere(r=radius,$fn = resolution);
        translate([(x/2)-radius,-(y/2)+radius,-(z/2)+radius]) sphere(r=radius,$fn = resolution);
        translate([-(x/2)+radius,-(y/2)+radius,-(z/2)+radius]) sphere(r=radius,$fn = resolution);
    }
}

module row(){
    list = [ for (i = [0 : 1 : len(letters) - 1]) letters[i] ];
    for(idx = [ 0 : len(list) - 1 ] ){
        translate([0,0,idx*(letter_width+2)]) letter(list[idx]);
    }
    if(connecting_ridge = true){
        translate([(8*row_count)/2-1.5,((7.85-.5)/2),((len(list)-1)*(letter_width+2))/2]) cube([1,.5,len(list)*(letter_width+2)], center = true);
        translate([-((8*row_count)/2-1.5),((7.85-.5)/2),((len(list)-1)*(letter_width+2))/2]) cube([1,.5,len(list)*(letter_width+2)], center = true);
    }
}

for(variable = [0:number_of_rows-1]){
    translate([(variable*letter_width)*row_count,0,0]) row();
}