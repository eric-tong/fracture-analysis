function CCf_sorted = sort_nodes_by_position(CCf, xns, yns)
% SORT_NODES_BY_POSITION Sort nodes by distance from leftmost node

CCf_sorted = zeros(size(CCf));
N = min(size(CCf));

for i = 1:N
    nodes = CCf(i,:);
    nodes(nodes==0) = [];   % Remove zeros
    dns = get_distance_from_leftmost_node(xns, yns, nodes);
    
    CCd = dns(nodes);
    [~, sort_indices] = sort(CCd);
    CCf_sorted(i,1:length(sort_indices)) = nodes(sort_indices);
end

    function dns = get_distance_from_leftmost_node(xns, yns, nodes)
        xns_filtered(nodes) = xns(nodes);
        yns_filtered(nodes) = yns(nodes);
        [xleft, nleft] = min(xns_filtered);
        yleft = yns_filtered(nleft);
        dx = xns - xleft;
        dy = yns - yleft;
        
        dns = dx.*dx + dy.*dy;
    end
end