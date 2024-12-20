// (c)2013 Felipe Sanches <juca@members.fsf.org>
// licensed under the terms of the GNU GPL version 3 (or later)

use <voronoi.scad>;

//
// The random_voronoi() function is the helper wrapper over the voronoi() core.
// It generates random nuclei site coordinates into the square area,
// passing other arguments to voronoi() unchanged.
//
// Parameters:
//   n                 ... number of nuclei sites to be generated
//   nuclei (bool)     ... show nuclei sites
//   L                 ... the radius of the "world" (the pattern is built within this circle)
//   thickness         ... the thickness of the lines between cells
//   round             ... the radius applied to corners (fillet in CAD terms)
//   min               ... minimum x and y coordinate for nuclei generation
//   max               ... maximum x and y coordinate for nuclei generation
//   seed              ... seed for the random generator (random if undefined)
//   center (bool)     ... move resulting pattern to [0, 0] if true
//
module random_voronoi(n = 20, nuclei = true, L = 200, thickness = 1, round = 6, min = 0, max = 100, seed = undef,
                      center = false)
{
    seed = seed == undef ? rands(0, 100, 1)[0] : seed;
    echo("Seed", seed);

    // Generate points.
    x = rands(min, max, n, seed);
    y = rands(min, max, n, seed + 1);
    points = [for (i = [0:n - 1])[x[i], y[i]]];

    // Center Voronoi.
    offset_x = center ? -(max(x) - min(x)) / 2 : 0;
    offset_y = center ? -(max(y) - min(y)) / 2 : 0;
    translate([ offset_x, offset_y ])

        voronoi(points, L = L, thickness = thickness, round = round, nuclei = nuclei);
}