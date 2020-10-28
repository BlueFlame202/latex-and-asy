//////////////////////////////////////////////////
// Aathreya's Useful Functions Package :P
// V 1.2
// Needs olympiad.asy!
//////////////////////////////////////////////////

import olympiad;
import geometry;

// Gets a point from a circle where the x coordinate of the point is x from the x coordinate of the center, the center is O, and the r represents the radius. If pos is true, the positive solution is returned and if not the negative solution is returned.
pair fromCircle(real x, pair O, real r, bool pos) 
{
    real y;
    if (pos)
        y = O.y + sqrt(r^2 - x^2);
    else
        y = O.y - sqrt(r^2 - x^2);
    pair X = (O.x + x, y);
    return X;
}

// Finds all the intersection points between a line and a path
pair[] allSegmentIntersects(pair A, pair B, path p, real val = 2.0) // increase val to get more points
{
    line AB = line(A, false, B, false);
    point G = relpoint(AB, val);
    point H = relpoint(AB, -val);
    path g = H--G;
    pair[] result = intersectionpoints(g, p);
    return result;
}

// Gets the pairs for my personal triangle.
pair[] getMyTri()
{
    pair A, B, C;
    A = (0, 0);
    B = (150, 0);
    C = (89, 100);
    pair[] r = {A, B, C};
    return r;
}

// Sets up a triangle by labeling and drawing in sides. The value of n decides the configuration of the labels, so you may need to play around with that value if the alighnment is messed up.
void setupTri(pair a, pair b, pair c, string s = "$A$", string t = "$B$", string u = "$C$", int n = 0)
{
    draw(a--b--c--cycle);
    if (n == 0) label(s, a, SW); if (n == 1) label(s, a, SE); if (n == 2) label(s, a, N);  
    dot(a); 
    if (n == 0) label(t, b, SE); if (n == 1) label(t, b, N); if (n == 2) label(t, b, SW);  
    dot(b);
    if (n == 0) label(u, c, N); if (n == 1) label(u, c, SW); if (n == 2) label(u, c, SE);  
    dot(c);
}