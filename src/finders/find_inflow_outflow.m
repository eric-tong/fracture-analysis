function [Qin, Qout] = find_inflow_outflow(QQ, xns, L)
% FIND_INFLOW_OUTFLOW Find total flow rate into and out of system
tol = 1E-14;
nL = abs(xns) < tol;
nR = abs(L - xns) < tol;
Qin = sum(QQ(nL', :), 'all');
Qout = sum(QQ(nR', :), 'all');
end