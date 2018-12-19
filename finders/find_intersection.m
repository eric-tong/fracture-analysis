function [x, y] = find_intersection(l1, theta1, x1, y1, l2, theta2, x2, y2)
% FIND_INTERSECTION Find intersection between two fractures
% Inputs:   lengths l1 l2, orientations theta1 theta2, horizontal midpoints x1 x2,
%           vertical midpoints x2 y2
% Outputs:  coordintates of intersection x y

[x, y] = find_linear_intersection(theta1, x1, y1, theta2, x2, y2);

d1 = find_distance(x, y, x1, y1);
d2 = find_distance(x, y, x2, y2);

if (l1 / 2 < d1 || l2 / 2 < d2)
    x = NaN;
    y = NaN;
end
end

function [x, y] = find_linear_intersection(theta1, x1, y1, theta2, x2, y2)
[m1, c1] = find_linear_constants(theta1, x1, y1);
[m2, c2] = find_linear_constants(theta2, x2, y2);

if (m1 == m2)
    x = NaN;
    y = NaN;
elseif (m1 == Inf)
    x = x1;
    y = m2 * x + c2;
elseif (m2 == Inf)
    x = x2;
    y = m1 * x + c1;
else
    x = (c2 - c1) / (m1 - m2);
    y = (m1 * c2 - m2 * c1) / (m1 - m2);
end
end

function d = find_distance(x1, y1, x2, y2)
dx = (x1 - x2);
dy = (y1 - y2);
d = sqrt(dx * dx + dy * dy);
end

