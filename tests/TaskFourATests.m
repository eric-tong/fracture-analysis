classdef TaskFourATests < matlab.unittest.TestCase
    
    methods (Test)    
        function should_solve_flow_for_three_nodes(testCase)
            CC = [0 1 3
                  1 0 2
                  3 2 0];
            bb = [0 1 1
                  1 0 1
                  1 1 0];
            ll = [0 1 1
                  1 0 1
                  1 1 0] / 12E-3;
            pL = 1;
            pR = 0;
            xns = [0 1 2]';
            L = 2;
            
            [pns, QQ] = solve_flow(CC, bb, ll, pL, pR, xns, L);
            pns_expected = [1 0.5 0]';
            QQ_expected = [0 0.5 1
                           -0.5 0 0.5
                           -1 -0.5 0];
            
            testCase.verifyEqual(pns, pns_expected, 'AbsTol', 1E-14);
            testCase.verifyEqual(QQ, QQ_expected, 'AbsTol', 1E-14);
        end
    end
end