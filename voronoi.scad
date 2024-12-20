// (c)2013 Felipe Sanches <juca@members.fsf.org>
// licensed under the terms of the GNU GPL version 3 (or later)

use <voronoi_polygon.scad>;

function normalize(v) = v / (sqrt(v[0] * v[0] + v[1] * v[1]));

//
// The voronoi() function generates a 2D surface, which can be provided to
// a) linear_extrude() to produce a 3D object
// b) intersection() to restrict it to a a specified shape -- see voronoi_polygon.scad
//
// Parameters:
//   points (required) ... nuclei coordinates (array of [x, y] pairs)
//   L                 ... the radius of the "world" (the pattern is built within this circle)
//   thickness         ... the thickness of the lines between cells
//   round             ... the radius applied to corners (fillet in CAD terms)
//   nuclei (bool)     ... show nuclei sites
//
// These parameters need to be kept more or less in proportion to each other, and to the distance
// apart of points in the point_set. If one or the other parameter is increased or decreased too
// much, you'll get no output.
//
module voronoi(points, L = 200, thickness = 1, round = 6, nuclei = true)
{
    for (p = points)
    {
        difference()
        {
            minkowski()
            {
                intersection_for(p1 = points)
                {
                    if (p != p1)
                    {
                        angle = 90 + atan2(p[1] - p1[1], p[0] - p1[0]);

                        translate((p + p1) / 2 - normalize(p1 - p) * (thickness + round)) rotate([ 0, 0, angle ])
                            translate([ -L, -L ]) square([ 2 * L, L ]);
                    }
                }
                circle(r = round, $fn = 20);
            }
            if (nuclei)
                translate(p) circle(r = 1, $fn = 20);
        }
    }
}