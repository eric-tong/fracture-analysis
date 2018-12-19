function Ap = generate_pressure_coefficient_matrix(CC, K)
% GENERATE_PRESSURE_COEFFICIENT_MATRIX Generate coefficient matrix for system of pressure equations

Nn = length(CC);
Ap = -K;
Ksum = sum(K);

for i = 1:Nn
    Ap(i, i) = Ksum(i);
end
end

