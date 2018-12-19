function K = generate_darcys_coefficient(bb, ll)
K = bb.*bb.*bb ./ (12E-3 .* ll);
K(isnan(K)) = 0;
end