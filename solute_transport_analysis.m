%% Set parameters
Nf = 20;
L = 20;
H = 10;
s = NaN;
pL = 1E5;
pR = 0;

%% Analyze transport
[lfs, thetafs, bfs, xfs, yfs, xns, yns, CC, QQ, pns, Qns, Qin, Qout, k] = analyze_single_network(Nf, L, H, s, pL, pR);
