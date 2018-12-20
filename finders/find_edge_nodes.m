function [nL,nR] = find_edge_nodes(xns, L)
tol = 1E-14;
nL = find(abs(xns) < tol);
nR = find(abs(L - xns) < tol);
end

