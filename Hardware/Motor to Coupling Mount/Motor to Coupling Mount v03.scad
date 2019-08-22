/* 
A bracket to attach a printhead 
Drafted on August 21, 2019 
By Jessica Snyder
*/

/* Measurements */
motor_shaft = 7.5; // diameter in mm
motor_height = 16; // height of motor shaft in mm

coupling_hole = 3.5; // diameter of coupling hole in mm
coupling_depth = 12; // depth of coupling hole in mm
coulpling_od = 22+2; // measured outer diameter of the coupling plus a tolerance

wall_thickness = 5; // Design element for wall thickness 
part_diameter = coulpling_od + wall_thickness; // Calculated diameter of the part 

through_hole_depth = 2.2; // diameter of through hole - M4 screw

/* Set the facets used to generate an arc */
$fn=80;

/* Define the points for the revolve */
a01 = [motor_shaft/2, 0];
a02 = [part_diameter/2, 0];
a03 = [part_diameter/2, motor_height + motor_shaft /2 + coupling_depth];
a04 = [part_diameter/2 - wall_thickness , motor_height + motor_shaft/2 + coupling_depth];
a05 = [part_diameter/2 - wall_thickness , motor_height + motor_shaft/2];
a06 = [coupling_hole/2 , motor_height + motor_shaft /2];
a07 = [coupling_hole/2 , motor_height + motor_shaft /2 + coupling_depth ];
a08 = [0, motor_height + motor_shaft /2 + coupling_depth ];
a09 = [0, motor_height ];
a10 = [motor_shaft/2, motor_height ];
a11 = [motor_shaft/2, 0];


difference(){
    union(){
        rotate_extrude(angle = 360, convexity = 2) 
        polygon(points=[a01, a02, a03, a04, a05, a06, a07, a08, a09, a10, a11]);
    
        translate( [-motor_shaft/2, 3, 0] ) 
        cube([motor_shaft, motor_shaft/2, motor_height]);
    }
    
    
    /* Holes for screws to secure the coupling */
    for ( j = [90,180]) {
        for ( i = [motor_height/2, coupling_depth/2 + motor_shaft/2 + motor_height ]) { 
            translate( [0, 0, i] ) 
            rotate( [0, 90, j] )  
            cylinder(h = 5*motor_shaft, r=through_hole_depth); 
            }
        }
       
     /* Subtraction to remove the internal shaft for the coupling
       Because it cannot be built with fidelity using the given 3D printer. */ 
     translate( [0, 0, motor_height + motor_shaft/2] ) 
     rotate( [0, 0, 0] )  
     cylinder(h = 5*motor_shaft, r=through_hole_depth); 
        
    
     /* Add a dome to the top of the internal cutout for manufacturbility. */
    translate([0, 0, motor_height])
    sphere(motor_shaft/2);

}
