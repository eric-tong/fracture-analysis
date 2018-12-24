function [lfs, thetafs, bfs, xfs, yfs, xns, yns, CC, bb, ll, QQ, pns] = analyze_single_network(Nf, L, H, s, pL, pR)
%% Task 1A
[lfs, thetafs, bfs, xfs, yfs] = generate_fractures(Nf, L, H, s);

%% Task 2B
[xns, yns, CCf] = build_node_matrix(lfs, thetafs, xfs, yfs, L, H);

%% Task 3
[CC, bb, ll] = build_network(xns, yns, CCf, bfs);

%% Task 4A
[pns, QQ] = solve_flow(CC, bb, ll, pL, pR, xns, L);

end

