function [m, c] = find_linear_constants(theta, x, y)
% FIND_LINEAR_CONSTANTS Find linear constants from center and orientation

if (theta == pi / 2)
    m = Inf;
    c = Inf;
else
    m = tan(theta);
    c = y - m * x;
end
end