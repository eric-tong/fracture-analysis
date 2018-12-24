classdef SortNodesByPositionTests < matlab.unittest.TestCase    
    methods (Test)
        function sort_nodes_by_position_in_one_row(testCase)
            xns = [10 20 30]';
            yns = [10 20 30]';
            CCf = [3 1 2];
            
            CCf_sorted = sort_nodes_by_position(CCf, xns, yns);
            CCf_expected = [1 2 3];
            
            testCase.verifyEqual(CCf_sorted, CCf_expected);
        end
    
        function sort_nodes_by_position_in_two_rows(testCase)
            xns = [10 20 30]';
            yns = [10 20 30]';
            CCf = [3 1 2
                   2 1 3];
            
            CCf_sorted = sort_nodes_by_position(CCf, xns, yns);
            CCf_expected = [1 2 3
                            1 2 3];
            
            testCase.verifyEqual(CCf_sorted, CCf_expected);
        end
    
        function sort_nodes_by_position_in_multiple_rows(testCase)
            xns = [10 20 30 40]';
            yns = [10 20 30 40]';
            CCf = [3 1 2 0
                   2 1 3 4
                   0 2 3 4];
            
            CCf_sorted = sort_nodes_by_position(CCf, xns, yns);
            CCf_expected = [1 2 3 0
                            1 2 3 4
                            2 3 4 0];
            
            testCase.verifyEqual(CCf_sorted, CCf_expected);
        end
    end
end