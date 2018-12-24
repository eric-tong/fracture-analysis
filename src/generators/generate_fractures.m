function [lfs, thetafs, bfs, xfs, yfs] = generate_fractures(Nf, L, H, s)
% GENERATE_FRACTURES Generate random fractures
% Produce a list of random fracture lengths, orientations, locations, 
% and apertures for Nf fractures
% Inputs:   number of fractures Nf, length L, height H
% Outputs:  fracture lengths lfs, fracture orientations thetafs, 
%           fracture apertures bfs, horizontal midpoint xfs, vertical midpoint yfs

generator = FractureGenerator(Nf, L, H, s);

[lb, thetab, bb, xb, yb] = generator.generate_bounds();

lfs = [lb; generator.generate_lengths()];
thetafs = [thetab; generator.generate_orientations()];
bfs = [bb; generator.generate_apertures()];
xfs = [xb; generator.generate_horizontal_positions()];
yfs = [yb; generator.generate_vertical_positions()];
end



