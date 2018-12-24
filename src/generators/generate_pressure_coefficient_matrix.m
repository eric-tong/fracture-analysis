function Ap = generate_pressure_coefficient_matrix(CC, K)
% GENERATE_PRESSURE_COEFFICIENT_MATRIX Generate coefficient matrix for system of pressure equations
Ap = -K + diag(K) + diag(sum(K));
end

