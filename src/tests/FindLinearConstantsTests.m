classdef FindLinearConstantsTests < matlab.unittest.TestCase    
    methods (Test)
        function slope_should_be_unitary(testCase)
            [m, c] = find_linear_constants(pi / 4, 1, 1);
            testCase.verifyEqual([m, c], [1, 0], 'AbsTol', 1E-6);
        end
    
        function slope_should_be_zero(testCase)
            [m, c] = find_linear_constants(0, 1, 1);
            testCase.verifyEqual([m, c], [0, 1], 'AbsTol', 1E-6);
        end
        
        function slope_should_be_negative_unitary(testCase)
            [m, c] = find_linear_constants(pi * 3 / 4, 1, 1);
            testCase.verifyEqual([m, c], [-1, 2], 'AbsTol', 1E-6);
        end
    end
end