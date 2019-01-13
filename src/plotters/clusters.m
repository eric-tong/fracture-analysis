function k = clusters(x)
S = length(x);
N = 15;
xmax = max(x);
xmin = min(x);
d = (xmax - xmin) / (S / N);
k = 0;
for i = 1:S/N
    if (sum(x < d * i & x > d * (i-1)) > N * 1.5)
        k = k + 1;
    end
end

end