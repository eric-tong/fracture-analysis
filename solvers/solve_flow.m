function [pns, QQ] = solve_flow(CC, bb, ll, pL, pR, xns, L)
% SOLVE_FLOW Solve flow equations for a general fracture network

Nn = length(CC);
QQ = zeros(Nn, Nn);

K = generate_darcys_coefficient(bb, ll);
Ap = sparse(generate_pressure_coefficient_matrix(CC, K));
[Aps, c] = generate_simplified_pressure_system(Ap, xns, pL, pR, L);
Aps = sparse(Aps);
pns = Aps\c;

for i = 1:Nn
    for j = i+1:Nn
        Qij = K(i,j) .* (pns(i) - pns(j));
        QQ(i,j) = Qij;
        QQ(j,i) = -Qij;
    end
end
end

