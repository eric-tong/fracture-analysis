function [Aps, c] = generate_simplified_pressure_system(Ap, xns, pL, pR, L)
% GENERATE_SIMPLIFIED_PRESSURE_SYSTEM
% Simplify pressure equations by replacing with known values

tol = 1E-14;
Nn = length(Ap);
nL = find(abs(xns) < tol);
nR = find(abs(L - xns) < tol);

Aps = Ap;
c = zeros(Nn, 1);

replace_all_in_rows(nL, pL);
replace_all_in_rows(nR, pR);

    function replace_all_in_rows(rows, content)
        for i = rows'
            Aps(i,:) = zeros(1, Nn);
            Aps(i,i) = 1;
            c(i) = content;
        end
    end
end

