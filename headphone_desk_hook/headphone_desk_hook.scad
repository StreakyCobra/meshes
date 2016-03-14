// Dimensions has been corrected for my printer!!!

// Hook
width = 70;
height = 29;
depth = 33;
size = 5;

// Holes
spacing = 51;
position = 24;
hole = 4;

// Headphones
head_width = 36;

$fn = 100;

module base() {
     translate ([- width/2, 0, 0]) cube([width, depth, size]);
}

module bottom() {
     module hole() {
          translate([0, 0, -height]) difference() {
               translate([spacing/2, position, -1]) cylinder(height+2, hole, hole);
          }
     }
     difference() {
          translate([0, 0, -size]) base();
          hole();
          mirror([1,0,0]) hole();
     }
}

module front() {
     translate([-width/2, -size, -size]) cube([width, size, height + 2 * size]);
}

module top() {
     translate([0, 0, height]) base();
}

module support() {
     intersection() {
          translate([-width/2, -head_width - size, -size]) cube([width, head_width, height + 2 * size]);
          translate([0, -size, -60]) rotate([90, 0, 0]) cylinder(head_width, 70, 70);
     }
}

module head_front() {
     intersection() {
          translate([-width/2, -head_width - 2 * size, -size]) cube([width, size, height + 2 * size]);
          translate([0, -head_width-size, -60]) rotate([90, 0, 0]) cylinder(size, 90, 90);
     }
}

union() {
     bottom();
     front();
     top();
     support();
     head_front();
}
