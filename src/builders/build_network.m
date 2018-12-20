function [CC, bb, ll] = build_network(xns, yns, CCf, bfs)
% BUILD_NETWORK Characterise the properties of fracture network
% Inputs:   node coordinates xns yns, fracture-connectivity matrix CCf
%           fracture apertures bfs
% Outputs:  network-connectivity matrix CC, link-aperture matrix bb,
%           link-length matrix ll

N = length(CCf);
Nn = length(xns);

CC = zeros(Nn, Nn);
bb = zeros(Nn, Nn);
ll = zeros(Nn, Nn);

CCf_sorted = sort_nodes_by_position(CCf, xns, yns);

for i = 1:N
    for j = 1:N-1
        node1 = CCf_sorted(i, j);
        node2 = CCf_sorted(i, j+1);
        if (node1 ~= 0 && node2 ~= 0)
            connect(node1, node2, i);
        else
            break;
        end
    end
end

    function connect(node1, node2, fracture)
        b = bfs(fracture);
        if (b > 0)
            bb(node1, node2) = b;
            bb(node2, node1) = b;
            
            d = get_distance_between_nodes(node1, node2);
            ll(node1, node2) = d;
            ll(node2, node1) = d;
            
            CC(node1, node2) = fracture;
            CC(node2, node1) = fracture;
        end
    end

    function d = get_distance_between_nodes(node1, node2)
        dx = xns(node1) - xns(node2);
        dy = yns(node1) - yns(node2);
        d = sqrt(dx*dx + dy*dy);
    end
end

