classdef TaskFourBTests < matlab.unittest.TestCase
    
    methods (Test)    
        function should_sum_inflows(testCase)
            QQ = [0 1 2
                  3 0 0
                  4 0 0];
            xns = [0 1 1]';
            L = 1;
            
            [Qin, ~] = find_inflow_outflow(QQ, xns, L);
            Qin_expected = 3;
            
            testCase.verifyEqual(Qin, Qin_expected, 'AbsTol', 1E-14);
        end
    
        function should_sum_outflows(testCase)
            QQ = [0 1 2
                  3 0 0
                  4 0 0];
            xns = [0 1 1]';
            L = 1;
            
            [~, Qout] = find_inflow_outflow(QQ, xns, L);
            Qout_expected = 7;
            
            testCase.verifyEqual(Qout, Qout_expected, 'AbsTol', 1E-14);
        end
    end
end