function [nnps,ttps,llps] = simulate_transport(xns, L, bb, ll, QQ, N)
nnps = zeros(length(xns), N);
ttps = zeros(length(xns), N);
llps = zeros(length(xns), N);

tol = 1E-14;
QQn = (QQ > tol) .* QQ;
QQn = diag(1./sum(QQn, 2)) * QQn;

for i = 1:N
    disp(i)
    nps = transport_one_particle(xns, L, QQn);
    nnps(1:length(nps), i) = nps;
    ttps(1:length(nps), i) = find_transport_time(nps, bb, ll, QQ);
    llps(1:length(nps), i) = find_transport_distance(nps,ll);
end
end

