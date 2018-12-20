function Qns = find_net_flow_in_inner_nodes(QQ, xns, L)
% FIND_INFLOW_OUTFLOW Find total flow rate for all inner nodes
tol = 1E-14;
ni = abs(xns) > tol & abs(L - xns) > tol;
Qns = abs(sum(QQ(ni', :), 2));
end