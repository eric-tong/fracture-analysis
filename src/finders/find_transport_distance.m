function lps = find_transport_distance(nps, ll)
lps = zeros(size(nps));

for i = 2:size(nps)
    lps(i) = abs(ll(nps(i), nps(i-1)));
end
lps = cumsum(lps);
end

