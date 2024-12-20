// This is the helper function using the original Voronoi script
// licensed under the terms of the GNU GPL version 3 (or later)

use <voronoi.scad>

//
// The voronoi_polygon() function fills an arbitrary polygon with a Voronoi pattern.
//
// Parameters:
//   border (required) ... polygon to be filled by a Voronoi pattern (array of [x, y] pairs, no holes)
//   n                 ... number of nuclei sites to be generated (pattern density; complexity: O(n^2) )
//   thickness         ... the thickness of the lines between cells
//   round             ... the radius applied to corners (fillet in CAD terms)
//   edging            ... the width of the border, set 0 for no border
//   seed              ... seed for the random generator (random if undefined)
//
module voronoi_polygon(border, n = 30, thickness = 1.7, round = 1.0, edging = 3.0, seed = undef)
{

    // bounding box
    only_x = [for (point = border) point[0]];
    only_y = [for (point = border) point[1]];
    min_x = min(only_x);
    min_y = min(only_y);
    max_x = max(only_x);
    max_y = max(only_y);
    // echo([[min_x,min_y],[max_x,max_y]]);

    // compute sizes, centers and scaling
    size_x = max_x - min_x;
    size_y = max_y - min_y;
    L = max(size_x, size_y);
    scale_voro = [ size_x / L, size_y / L ];
    center_poly = [ (min_x + max_x) / 2, (min_y + max_y) / 2 ];

    // subtract Voronoi pattern from the border polygon
    difference()
    {
        polygon(border);
        translate(center_poly) scale(scale_voro)
            random_voronoi(n = n, nuclei = false, L = L, thickness = thickness, round = round, min = 0, max = L,
                           seed = seed, center = true);
    }

    // add the border edge if required
    if (edging)
    {
        difference()
        {
            polygon(border);
            offset(delta = -edging) polygon(border);
        }
    }
}