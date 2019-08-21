/* 
A bracket to attach a printhead 
Drafted on August 20, 2019 
By Jessica Snyder
*/


/* Base */
base_width = 60; 
base_length = 83; 
base_height = 7;

hole_1_height = base_height;
hole_1_radius = 3.75;
hole_2_radius = 2;
hole_3_radius = 2;
hole_4_radius = 2;


/* Subtract the holes from the bracket base */
 difference() {
     $fn=50;
     cube([base_width, base_length, base_height]);

for ( i=[6, 6+18, 6+18+13, 6+18+13+18] ) {  
    for ( j=[5,25+5] ) {  
        translate( [i, j, hole_1_height/2] ) 
        cylinder(h = hole_1_height, r=hole_1_radius);  
        
        translate( [i, j, -hole_1_height/4] ) 
        cylinder(h = hole_1_height, r=hole_2_radius); 
}}

for ( i=[21.5, 21.5+18] ) {  
    for ( j=[25+5+22, 25+5+22+25] ) {  
        translate( [i, j, hole_1_height/2] ) 
        cylinder(h = hole_1_height, r=hole_1_radius);  
        
        translate( [i, j, -hole_1_height/4] ) 
        cylinder(h = hole_1_height, r=hole_2_radius); 
}}

for ( i=[11, 11+38] ) {  
    for ( j=[5+25+21] ) {   
        translate( [i, j, hole_1_height/2] ) 
        cylinder(h = hole_1_height, r=hole_1_radius); 
        
        translate( [i, j, -hole_1_height/4] ) 
        cylinder(h = 2*hole_1_height, r=hole_3_radius); 
}}
        
for ( i=[1:7] ) {  
    for ( j=[5+11, 5+11+25, 5+11+25+25 ] ) {   
        translate( [8*i, j, -hole_1_height/4] ) 
        cylinder(h = 2*hole_1_height, r=hole_4_radius); 
}}

}

     