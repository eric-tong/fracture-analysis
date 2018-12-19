function [lfs, thetafs, bfs, xfs, yfs, xns, yns, CC, QQ, pns, Qns, Qin, Qout, k] = analyze_single_network(Nf, L, H, s, pL, pR)
%% Task 1A
[lfs, thetafs, bfs, xfs, yfs] = generate_fractures(Nf, L, H, s);

%% Task 2B
[xns, yns, CCf] = build_node_matrix(lfs, thetafs, xfs, yfs, L, H);

%% Task 3
[CC, bb, ll] = build_network(xns, yns, CCf, bfs);

%% Task 4A
[pns, QQ] = solve_flow(CC, bb, ll, pL, pR, xns, L);

%% Task 4B
Qns = find_net_flow_in_inner_nodes(QQ, xns, L);

%% Task 5A
[Qin, Qout] = find_inflow_outflow(QQ, xns, L);
k = Qin * 1E-3 * L / (pL - pR);
end

