%% Set parameters
Nf = 40;
L = 20;
H = 10;
s = NaN;
pL = 1E5;
pR = 0;
N = 10000;

%% Simulate transport
[lfs, thetafs, bfs, xfs, yfs, xns, yns, CC, bb, ll, QQ, pns] = analyze_single_network(Nf, L, H, s, pL, pR);
[nnps, ttps, llps] = simulate_transport(xns, L, bb, ll, QQ, N);

%% Arrival time distribution
ttps = sort(ttps, 'descend');
arrivalTimes = ttps(1,:);
arrivalTimes = arrivalTimes(arrivalTimes - mean(arrivalTimes) < 2 * std(arrivalTimes)); % Remove outliers

figure();
histogram(arrivalTimes);
