classdef TaskThreeTests < matlab.unittest.TestCase
    
    methods (Test)    
        function should_generate_connection_between_two_nodes_on_one_fracture(testCase)
            xns = [1 2]';
            yns = [1 2]';
            CCf = [0 1 2
                   1 0 0
                   2 0 0];
            bfs = [1 1 1]';
            
            [CC, ~, ~] = build_network(xns, yns, CCf, bfs);
            CC_expected = [0 1
                           1 0];
            
            testCase.verifyEqual(CC, CC_expected);
        end
    
        function should_generate_connections_between_three_nodes_on_one_fracture(testCase)
            xns = [1 3 2]';
            yns = [1 3 2]';
            CCf = [0 1 2 3
                   1 0 0 0
                   2 0 0 0
                   3 0 0 0];
            bfs = [1 1 1 1]';
            
            [CC, ~, ~] = build_network(xns, yns, CCf, bfs);
            CC_expected = [0 0 1
                           0 0 1
                           1 1 0];
            
            testCase.verifyEqual(CC, CC_expected);
        end
    
        function should_generate_connections_between_nodes_on_four_fractures(testCase)
            xns = [2 1 3 2]';
            yns = [3 2 2 1]';
            CCf = [0 0 2 1
                   0 0 4 3
                   2 4 0 0
                   1 3 0 0];
            bfs = [1 1 1 1]';
            
            [CC, ~, ~] = build_network(xns, yns, CCf, bfs);
            CC_expected = [0 1 4 0
                           1 0 0 3
                           4 0 0 2
                           0 3 2 0];
            
            testCase.verifyEqual(CC, CC_expected);
        end
    end
end