function tps = find_transport_time(nps, bb, ll, QQ)
tt = ll ./ (QQ ./ bb ./ bb);
tt(isnan(tt)) = 0;
tps = zeros(size(nps));

for i = 2:size(nps)
    tps(i) = abs(tt(nps(i), nps(i-1)));
end
tps = cumsum(tps);
end

