/* 
A bracket to attach a printhead 
Drafted on August 20, 2019 
By Jessica Snyder
*/

/* Base */
base_width = 100; 
base_length = 100; 
base_height = 8;

/* Hole pattern */
cylinder_height_1 = 3*base_height;
cylinder_radius_1 = 2;

cylinder_height_1_countersunk = 2*base_height;
cylinder_radius_1_countersunk = 6;

cylinder_height_2 = 2*base_height;
cylinder_radius_2 = 1;

multiplier_x = 20;
multiplier_y = 20;
 
/* Subtract the holes from the bracket base */
 difference() {
     $fn=50;
     cube([base_width, base_length, base_height]);
     
    for ( i=[1:4] ) {  
        for ( j=[1:4] ) {
            translate( [multiplier_x*i, multiplier_y*j, -base_height/2] ) 
            cylinder(h = cylinder_height_1, r=cylinder_radius_1);          
    }}
 
  for ( i=[1:4] ) {  
        for ( j=[1:4] ) {
            translate( [multiplier_x*i, multiplier_y*j, base_height/2] ) 
            cylinder(h = cylinder_height_1_countersunk, r=cylinder_radius_1_countersunk);  
    }}
    
  for ( i=[1:9] ) {  
        for ( j=[1:9] ) {
            translate( [multiplier_x*i/2, multiplier_y*j/2, -base_height/2] ) 
            cylinder(h = cylinder_height_2, r=cylinder_radius_2);  
    }}   
 
 }


     