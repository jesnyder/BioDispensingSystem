/* 
A bracket to attach a printhead 
Drafted on August 21, 2019 
By Jessica Snyder
*/

/* Measurements */
motor_shaft = 6; // diameter in mm
motor_height = 16; // height of motor shaft in mm

coupling_hole = 3.5; // diameter of coupling hole in mm
coupling_depth = 12; // depth of coupling hole in mm

through_hole_depth = 2.2; // diameter of through hole - M4 screw

/* Set the facets used to generate an arc */
$fn=70;

difference(){
    union(){
        
        /* Prepare the  */
        rotate_extrude(angle = 360, convexity = 2)
        polygon(points=[[motor_shaft/2,0],[motor_shaft/2,motor_height],[4*motor_shaft/2, motor_height],[4*motor_shaft/2, 0]]);
        
        translate( [-motor_shaft/2, 2, 0] ) 
        cube([motor_shaft, motor_shaft/2, motor_height]);
        
        /*
        translate( [0, 0, -motor_shaft] ) 
        cylinder(h = motor_shaft , r=4*motor_shaft/2);  */
        rotate_extrude(angle = 360, convexity = 2)
        translate( [0, 0, -motor_shaft/2] )

        polygon(points=[[0,0],[4*motor_shaft/2, 0],[coupling_hole/2, -motor_shaft],[coupling_hole/2,0],[0,0]]);
        
        translate( [0, 0, -motor_shaft/2] )
        rotate_extrude(angle = 360, convexity = 2) 
        polygon(points=[[0,0],[0,-coupling_depth],[coupling_hole, -coupling_depth],[coupling_hole, 0]]);
        
        }
        
        for ( j = [90, 180]) {
        
        for ( i = [motor_height*1/4, motor_height*2/3] ) { 
            translate( [0, 0, i] ) 
            rotate( [0, 90, 90] )  
            cylinder(h = 5*motor_shaft, r=through_hole_depth); 
            }
        }
            
        translate([0, 0, -motor_shaft/4])
        sphere(motor_shaft/2);
}
    
   
  
