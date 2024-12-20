// voronoi_polygon_examples.scad
// Example: Voronoi patterns within custom polygons

use <../voronoi.scad>
use <../voronoi_polygon.scad>

//
// Examples
// (render more times to see random effects)
//

// a complex red shape far from the coordinates origin
border1 = [
    [ 362.13, 35.7 ], [ 388.01, 47.59 ], [ 409.81, 58.66 ], [ 427.16, 68.73 ], [ 439.78, 77.62 ], [ 447.43, 85.19 ],
    [ 450.0, 91.29 ], [ 447.43, 95.84 ], [ 439.78, 98.75 ], [ 427.16, 99.96 ], [ 409.81, 99.47 ], [ 388.01, 97.27 ],
    [ 362.13, 93.41 ], [ 350.0, 60.5 ]
];
color([ 1, 0, 0 ]) translate([ -250, 0, 0 ]) linear_extrude(height = 1) voronoi_polygon(border1);

// negative blue box with no edging and some settings
border2 = [ [ 0, 0 ], [ -20, 0 ], [ -20, -20 ], [ 0, -20 ] ];
color([ 0, 0, 1 ]) translate([ 125, 150, 0 ]) linear_extrude(height = 2)
    voronoi_polygon(border2, thickness = 0.2, round = 0.5, edging = 0, seed = 42);

// longer green shape
border3 = [ [ 0, 8 ], [ 20, 178 ], [ 40, 178 ], [ 60, 8 ] ];
color([ 0, 1, 0 ]) linear_extrude(height = 10) voronoi_polygon(border3, n = 50);