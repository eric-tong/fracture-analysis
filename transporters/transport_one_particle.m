function [nps, tps] = transport_one_particle(xns, L, QQn)
tol = 1E-14;
N = size(xns, 1);
nps = zeros(size(xns));
tps = [];

% Find initial candidates from leftmost nodes with nonzero flow
candidates = find(xns < tol);
candidates = candidates(any(QQn(candidates, :) > tol, 2));

np = candidates( ceil(size(candidates, 1) * rand()) );
xp = xns(np);
nps(1) = np;
i = 1;

while abs(xp - L) > tol
    np = randsrc(1, 1, [1:N; QQn(np, :)]);
    xp = xns(np);
    
    i = i + 1;
    nps(i) = np;
end

nps = nps(1:i, :);

end

