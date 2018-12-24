%% Set parameters
Nf = 40;
L = 20;
H = 10;
s = 1;
pL = 1E5;
pR = 0;

%% Analyze network
tic
[lfs, thetafs, bfs, xfs, yfs, xns, yns, CC, bb, ll, QQ, pns] = analyze_single_network(Nf, L, H, s, pL, pR);
toc
%% Task 4B
Qns = find_net_flow_in_inner_nodes(QQ, xns, L);

%% Task 5A
[Qin, Qout] = find_inflow_outflow(QQ, xns, L);
k = Qin * 1E-3 * L / (pL - pR);

disp(['e_max = ' num2str(max(Qns)) ', e_mean = ' num2str(mean(Qns)) ', e_std = ' num2str(std(Qns))]);
disp(['Qin = ' num2str(Qin) ', Qout = ' num2str(Qout) ', e = ' num2str(Qin + Qout)]);
disp(['k = ' num2str(k)]);
disp(['p_max = ' num2str(max(pns)) ' p_min = ' num2str(min(pns)) ', p_mean = ' num2str(mean(pns)) ', p_std = ' num2str(std(pns))]);

%% Plot
plot_fractures(lfs, thetafs, xfs, yfs, L, H);
% scatter(xns, yns, 25, linspace(1, 10, length(xns)), '*');
% plot_network(xns, yns, CC, L, H);
% plot_flow(xns, yns, CC, QQ, pns, L, H);

%% Histogram
QQabs = abs(QQ(:));
QQabs = QQabs(QQabs > 1E-14);
disp(['Q_max = ' num2str(max(QQabs)) ' Q_min = ' num2str(min(QQabs)) ', Q_mean = ' num2str(mean(QQabs)) ', Q_std = ' num2str(std(QQabs))]);
% figure();
% histogram(QQabs);
% figure();
% scatter(xns, pns);
