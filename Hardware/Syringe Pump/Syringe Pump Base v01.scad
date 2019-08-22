/* 
A syring pump
Drafted on August 21, 2019 
By Jessica Snyder
*/

base_width = 60;
base_length = 140;
base_height = 10;

motor_mount_hole = 22; // Measured hole of the motor mounting - mm
motor_screw = 6; // Measured hole of the motor screws - mm
motor_screw_pattern = 28; // Measured hole of the motor srew pattern diameter - mm
guide_rod_diameter = 10; // Measured diameter of the guide rod
guide_rod_pattern = 40; // Design the guide rod pattern diameter

screw_exit_hole = 10; // Measured hole of the motor mounting - mm
mounting_hole = 8; // Measured hole to mount to printer - mm
mounting_hole_spacing = 35; // Measured hole to mount to printer - mm

difference(){

union(){
cube([base_width, base_length, base_height]);
rotate([0,90,0])  
translate([-base_width, -base_height, -base_height])  
cube([base_width, base_length+base_height, base_height]);

for ( i = [0,base_length]) {
translate([0,i,0])  
rotate([90,0,0])
cube([base_width, base_width, base_height]);
}
}

    // Hole for the motor mount - base
    translate([base_width/2, base_width/8, base_width/2])
    rotate([90,0,0])
    cylinder(h = 2*base_height, r=motor_mount_hole/2); 

    // Hole for the motor mount - screws
    for ( i = [motor_screw_pattern/2, -motor_screw_pattern/2]) {
        for ( j = [motor_screw_pattern/2, -motor_screw_pattern/2]) {
    translate([base_width/2+i, base_width/8, base_width/2+j])
    rotate([90,0,0])
    cylinder(h = 2*base_height, r=motor_screw/2); 
        }}
        
        
     // Hole for the guide rod
    for ( i = [guide_rod_pattern/2, -guide_rod_pattern/2, 0, 0]) {
         translate([base_width/2+i, -base_width/2, base_width/2])
        rotate([90,0,180])
        cylinder(h = 2*base_height + base_length, r=guide_rod_diameter/2); 
        }
        
    for ( i = [guide_rod_pattern/2]) {
         translate([base_width/2, -base_width/2, base_width/2+i])
        rotate([90,0,180])
        cylinder(h = 2*base_height + base_length, r=guide_rod_diameter/2); 
        }
    

    // Hole for the lead screw to exit
    translate([base_width/2,  base_length+base_width/8, base_width/2])
    rotate([90,0,0])
    cylinder(h = 2*base_height, r=screw_exit_hole/2); 

    // Hole for attachment to the printer
    for ( i = [1:3]) {
        for ( j = [1:5]) {
    translate([-mounting_hole_spacing/8+mounting_hole_spacing/2*i,  mounting_hole_spacing/2*j, -base_width/8])
    rotate([0,0,0])
    cylinder(h = 2*base_height, r=mounting_hole/2); 
    }}
    
    for ( i = [1:2]) {
        for ( j = [1:5]) {
    translate([-mounting_hole_spacing/8+mounting_hole_spacing/4+mounting_hole_spacing/2*i, mounting_hole_spacing/4+ mounting_hole_spacing/2*j, -base_width/8])
    rotate([0,0,0])
    cylinder(h = 2*base_height, r=mounting_hole/2); 
    }}


}