// random_voronoi_example.scad
// Example: Random Voronoi diagram

use <../voronoi.scad>
use <../voronoi_random.scad>

// Generate and display a random Voronoi diagram
linear_extrude(height = 10) random_voronoi(n = 64, round = 6, min = 0, max = 300, seed = 42);