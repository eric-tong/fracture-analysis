classdef TaskTwoBTests < matlab.unittest.TestCase
    
    methods (Test)    
        function should_find_intersection_between_two_fractures(testCase)
            lfs = [1000 1000]';
            thetafs = [pi/4 pi*3/4]';
            xfs = [1 2];
            yfs = [1 0];
            L = 4;
            H = 4;
            
            [xns, yns, CCf] = build_node_matrix(lfs, thetafs, xfs, yfs, L, H);
            testCase.verifyEqual(CCf, [0 1; 1 0], 'AbsTol', 1E-6);
            testCase.verifyEqual(xns, 1, 'AbsTol', 1E-6);
            testCase.verifyEqual(yns, 1, 'AbsTol', 1E-6);
        end
    
        function should_find_intersection_between_three_fractures(testCase)
            lfs = [1000 1000 1000]';
            thetafs = [pi/4 pi*3/4 pi*3/4]';
            xfs = [1 2 4];
            yfs = [1 0 0];
            L = 4;
            H = 4;
            
            [xns, yns, CCf] = build_node_matrix(lfs, thetafs, xfs, yfs, L, H);
            testCase.verifyEqual(CCf, [0 1 2; 1 0 0; 2 0 0], 'AbsTol', 1E-6);
            testCase.verifyEqual(xns, [1 2]', 'AbsTol', 1E-6);
            testCase.verifyEqual(yns, [1 2]', 'AbsTol', 1E-6);
        end
    end
end