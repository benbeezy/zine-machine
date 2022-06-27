// for font help go to https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Text

font="Liberation Sans:style=Bold Italic";
font_size = 3;
number_of_rows = 1;
Upper_case = true;
module letter(value){
        difference(){
            round_cube(1,20,8,7.85,3.9);
            cylinder(d=4.05, h=4, center=true, $fn=50);
            translate([0,(4.05-2)/2,0]) cube([4.05,2,4], center= true);
            
            translate ([0,3.75,0])rotate([0,90,90]){
                linear_extrude(height = 10){
                    text(value, font=font, size= font_size, halign= "center", valign="center");
                }
            }
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
    // uncomment the line below to see the outline of where the main cube will be made
    //color("gray", alpha=0.5) cube([x,y,z], center= true);
}

module row(){
    if(Upper_case == true){
        translate([0,0,1*(font_size+1)]) letter("A");
        translate([0,0,2*(font_size+1)]) letter("B");
        translate([0,0,3*(font_size+1)]) letter("C");
        translate([0,0,4*(font_size+1)]) letter("D");
        translate([0,0,5*(font_size+1)]) letter("E");
        translate([0,0,6*(font_size+1)]) letter("F");
        translate([0,0,7*(font_size+1)]) letter("G");
        translate([0,0,8*(font_size+1)]) letter("H");
        translate([0,0,9*(font_size+1)]) letter("I");
        translate([0,0,10*(font_size+1)]) letter("J");
        translate([0,0,11*(font_size+1)]) letter("K");
        translate([0,0,12*(font_size+1)]) letter("L");
        translate([0,0,13*(font_size+1)]) letter("M");
        translate([0,0,14*(font_size+1)]) letter("N");
        translate([0,0,15*(font_size+1)]) letter("O");
        translate([0,0,16*(font_size+1)]) letter("P");
        translate([0,0,17*(font_size+1)]) letter("Q");
        translate([0,0,18*(font_size+1)]) letter("R");
        translate([0,0,19*(font_size+1)]) letter("S");
        translate([0,0,20*(font_size+1)]) letter("T");
        translate([0,0,21*(font_size+1)]) letter("U");
        translate([0,0,22*(font_size+1)]) letter("V");
        translate([0,0,23*(font_size+1)]) letter("W");
        translate([0,0,24*(font_size+1)]) letter("X");
        translate([0,0,25*(font_size+1)]) letter("Y");
        translate([0,0,26*(font_size+1)]) letter("Z");
    } else {
        translate([0,0,1*(font_size+1)]) letter("a");
        translate([0,0,2*(font_size+1)]) letter("b");
        translate([0,0,3*(font_size+1)]) letter("c");
        translate([0,0,4*(font_size+1)]) letter("d");
        translate([0,0,5*(font_size+1)]) letter("e");
        translate([0,0,6*(font_size+1)]) letter("f");
        translate([0,0,7*(font_size+1)]) letter("g");
        translate([0,0,8*(font_size+1)]) letter("h");
        translate([0,0,9*(font_size+1)]) letter("i");
        translate([0,0,10*(font_size+1)]) letter("j");
        translate([0,0,11*(font_size+1)]) letter("k");
        translate([0,0,12*(font_size+1)]) letter("l");
        translate([0,0,13*(font_size+1)]) letter("m");
        translate([0,0,14*(font_size+1)]) letter("n");
        translate([0,0,15*(font_size+1)]) letter("o");
        translate([0,0,16*(font_size+1)]) letter("p");
        translate([0,0,17*(font_size+1)]) letter("q");
        translate([0,0,18*(font_size+1)]) letter("r");
        translate([0,0,19*(font_size+1)]) letter("s");
        translate([0,0,20*(font_size+1)]) letter("t");
        translate([0,0,21*(font_size+1)]) letter("u");
        translate([0,0,22*(font_size+1)]) letter("v");
        translate([0,0,23*(font_size+1)]) letter("w");
        translate([0,0,24*(font_size+1)]) letter("x");
        translate([0,0,25*(font_size+1)]) letter("y");
        translate([0,0,26*(font_size+1)]) letter("z");
    }   
}

for(variable = [0:number_of_rows-1]){
    translate([variable*10,0,0]) row();
}