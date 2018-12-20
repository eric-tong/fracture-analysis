function [Aps, c, nL, nR] = generate_extra_simplified_pressure_system(Ap, xns, nL, pL, nR, pR, L)
% GENERATE_SIMPLIFIED_PRESSURE_SYSTEM
% Simplify pressure equations by replacing with known values

Aps = Ap;
c = -1 * (sum(Aps(:,nL), 2) * pL  + sum(Aps(:,nR), 2) * pR);

delete([nL; nR]);

    function delete(i)
        Aps(i,:) = [];
        Aps(:,i) = [];
        c(i) = [];
    end
end

