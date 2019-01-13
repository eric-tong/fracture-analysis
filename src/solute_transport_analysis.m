%% Set parameters
Nf = 40;
L = 20;
H = 10;
s = 1856259887;
pL = 1E5;
pR = 0;
N = 8;

%% Analyze transport
[lfs, thetafs, bfs, xfs, yfs, xns, yns, CC, bb, ll, QQ, pns] = analyze_single_network(Nf, L, H, s, pL, pR);
tol = 1E-14;
QQn = (QQ > tol) .* QQ;
QQn = diag(1./sum(QQn, 2)) * QQn;

%% Plot
plot_transport(xns, yns, CC, QQ, nps, tps, L, H); % Modify plot_flow to plot time
nnps = [];
ttps = [];
ttps_max = [];
for i = 1:N
    nps = transport_one_particle(xns, L, QQn);
    tps = find_transport_time(nps, bb, ll, QQ);
    nnps = [nnps; nps];
    ttps = [ttps; tps];
    ttps_max = [ttps_max; max(ttps)];
    plot(xns(nps), yns(nps), '--b', 'LineWidth', 2);
end
ttps_max
% Plot the nodes, color-coded by time
cmap = colormap(parula(256));
cmin = log(min(ttps(ttps>0)));
cmax = log(max(ttps(ttps>0)));
for i=1:length(ttps)
    if ttps(i)==0
        cind = 1;
    else
        cind = round(255*(log(ttps(i))-cmin)/(cmax-cmin)) + 1;
    end
    plot(xns(nnps(i)),yns(nnps(i)),'o','MarkerSize',6,'MarkerFaceColor',cmap(cind,:),'MarkerEdgeColor','None')
end
