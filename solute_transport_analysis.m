%% Set parameters
Nf = 15;
L = 20;
H = 10;
s = NaN;
pL = 1E5;
pR = 0;

%% Analyze transport
[lfs, thetafs, bfs, xfs, yfs, xns, yns, CC, bb, ll, QQ, pns] = analyze_single_network(Nf, L, H, s, pL, pR);
tol = 1E-14;
QQn = (QQ > tol) .* QQ;
QQn = diag(1./sum(QQn, 2)) * QQn;

nps = transport_one_particle(xns, L, QQn);
tps = find_transport_time(nps, bb, ll, QQ);

%% Plot
plot_transport(xns, yns, CC, QQ, nps, tps, L, H); % Modify plot_flow to plot time
plot(xns(nps), yns(nps), '--b', 'LineWidth', 2);