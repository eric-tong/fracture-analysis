function pnsx = insert_known_values(pns, nL, pL, nR, pR)
N = length(pns) + length(nL) + length(nR);
pnsx = zeros(N, 1);

lCount = 1;
rCount = 1;

for i = 1:N
    if lCount <= length(nL) && i == nL(lCount)
        pnsx(i) = pL;
        lCount = lCount + 1;
    elseif rCount <= length(nR) && i == nR(rCount)
        pnsx(i) = pR;
        rCount = rCount + 1;
    else
        pnsx(i) = pns(i - lCount - rCount + 2);
    end
end

end

