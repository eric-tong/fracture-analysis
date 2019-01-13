%% Set parameters
Nf = 40;
L = 20;
H = 10;
s = 1856259887;
pL = 1E5;
pR = 0;

%% Analyze network
tic
[lfs, thetafs, bfs, xfs, yfs, xns, yns, CC, bb, ll, QQ, pns] = analyze_single_network(Nf, L, H, s, pL, pR);
toc
