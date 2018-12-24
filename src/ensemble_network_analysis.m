%% Set parameters
Nf = 40 ;
L = 20;
H = 10;
s = NaN;
pL = 1E5;
pR = 0;
N = 10000;

%% Analyze network
Qt = zeros(N:1);
for i = 1:N
    [lfs, thetafs, bfs, xfs, yfs, xns, yns, CC, bb, ll, QQ, pns] = analyze_single_network(Nf, L, H, s, pL, pR);
    [Qin, Qout] = find_inflow_outflow(QQ, xns, L);
    Qt(i) = Qin;
    disp(num2str(i));
    
    %Find inflow only
end

%% Plot
histogram(Qt);
disp(['Q_max = ' num2str(max(Qt)) ' Q_min = ' num2str(min(Qt)) ', Q_mean = ' num2str(mean(Qt)) ', Q_std = ' num2str(std(Qt))]);