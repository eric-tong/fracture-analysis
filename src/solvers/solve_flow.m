function [pns, QQ] = solve_flow(CC, bb, ll, pL, pR, xns, L)
% SOLVE_FLOW Solve flow equations for a general fracture network

Nn = length(CC);
K = generate_darcys_coefficient(bb, ll);
Ap = sparse(generate_pressure_coefficient_matrix(CC, K));
[nL, nR] = find_edge_nodes(xns, L);

[Aps, c] = generate_extra_simplified_pressure_system(Ap, xns, nL, pL, nR, pR, L);
pns = full(Aps\c);
pns = insert_known_values(pns, nL, pL, nR, pR);

QQ = K .* ( repmat(pns,1,Nn) - repmat(pns',Nn,1) );
end

