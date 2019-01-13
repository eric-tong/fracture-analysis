function plot_surf(x,y,z)
%% Making Surface Plots From Scatter Data
%% Little triangles
% The solution is to use Delaunay triangulation. Let's look at some
% info about the "tri" variable.
tri = delaunay(x,y);
%% Plot it with TRISURF
grad = log10(abs(trigradient(tri, x, y, z)));
c = zeros(length(grad), 1);
c(grad > mean(grad), :) = repmat(0.5, sum(grad > mean(grad)), 1);
c(grad > mean(grad) * 1.1, :) = repmat(1, sum(grad > mean(grad) * 1.1), 1);

h = trisurf(tri, x, y, z, c);

mycolors = [0 0.74 0.83; 0.9 0.9 0.9; 1 0.59 0];
colormap(mycolors);
set(h,'LineWidth',0.2)
b = colorbar;
xlabel(b, 'Pressure Gradient');
xlabel('x /m');
ylabel('y /m');
zlabel('Node Pressure /Pa');
end

