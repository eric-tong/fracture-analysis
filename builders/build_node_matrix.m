function [xns, yns, CCf] = build_node_matrix(lfs, thetafs, xfs, yfs, L, H)
% BUILD_NODE_MATRIX Build matrix CCf describing connecctivity of network
% Matrix where CCf(i,j) = n indicates that fracture i and fracture j
% intersect at node n, with coordinates [xns(n) and yns(n)].

N = length(lfs);    % fracture count
Nn = 0;             % node count

CCf = zeros(N, N);
xns = zeros(N*N, 1);
yns = zeros(N*N, 1);

for i = 1:N-1
    for k = i+1:N
        [x, y] = find_intersection(lfs(i), thetafs(i), xfs(i), yfs(i), ...
                                   lfs(k), thetafs(k), xfs(k), yfs(k));
                               
        if (is_valid(x, y))
            add_node(x, y);
        end
    end
end

slice_array_to_size();

    function valid = is_valid(x, y)
        tol = 1E-14;
        valid = ~isnan(x) && ~isnan(y) ...
            && -tol <= x && x <= L + tol && -tol <= y && y <= H + tol;
    end

    function add_node(x, y)
        Nn = Nn + 1;
        xns(Nn) = x;
        yns(Nn) = y;
        CCf(i, k) = Nn;
        CCf(k, i) = Nn;
    end

    function slice_array_to_size()
        xns = xns(1:Nn,:);
        yns = yns(1:Nn,:);
    end
end

