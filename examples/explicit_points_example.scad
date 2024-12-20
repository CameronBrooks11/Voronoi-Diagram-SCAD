// explicit_points_example.scad
// Example: Voronoi with an explicit list of points

use <../voronoi.scad>

// Define a set of points
point_set = [
    [ 0, 0 ], [ 30, 0 ], [ 20, 10 ], [ 50, 20 ], [ 15, 30 ], [ 85, 30 ], [ 35, 30 ], [ 12, 60 ], [ 45, 50 ], [ 80, 80 ],
    [ 20, -40 ], [ -20, 20 ], [ -15, 10 ], [ -15, 50 ]
];

// Generate Voronoi diagram
voronoi(points = point_set, round = 4, nuclei = true);

// Uncomment below to extrude the diagram
// linear_extrude(height = 5)
// voronoi(points = point_set, round = 4, nuclei = true);
