classdef TaskTwoATests < matlab.unittest.TestCase
    
    properties (Constant)
        l1 = 1000
        theta1 = pi / 4
        x1 = 1
        y1 = 1
    end
    
    methods (Test)    
        function parallel_lines_should_return_nan(testCase)
            l2 = 1000;
            theta2 = testCase.theta1;
            x2 = 2;
            y2 = 2;
            
            [x, y] = find_intersection(testCase.l1, testCase.theta1, testCase.x1, testCase.y1, l2, theta2, x2, y2);
            testCase.verifyEqual([x, y], [NaN, NaN]);
        end
    
        function non_vertical_lines_should_return_intersection(testCase)
            l2 = 1000;
            theta2 = pi * 3 / 4;
            x2 = 2;
            y2 = 0;
            
            [x, y] = find_intersection(testCase.l1, testCase.theta1, testCase.x1, testCase.y1, l2, theta2, x2, y2);
            testCase.verifyEqual([x, y], [1, 1], 'AbsTol', 1E-6);
        end
    
        function vertical_line_and_non_vertical_line_should_return_intersection(testCase)
            l2 = 1000;
            theta2 = pi / 2;
            x2 = 2;
            y2 = 0;
            
            [x, y] = find_intersection(testCase.l1, testCase.theta1, testCase.x1, testCase.y1, l2, theta2, x2, y2);
            testCase.verifyEqual([x, y], [2, 2], 'AbsTol', 1E-6);
        end
    
        function short_line_should_not_intersect(testCase)
            l2 = sqrt(2)*2 - 0.1;
            theta2 = pi * 3 / 4;
            x2 = 2;
            y2 = 0;
            
            [x, y] = find_intersection(testCase.l1, testCase.theta1, testCase.x1, testCase.y1, l2, theta2, x2, y2);
            testCase.verifyEqual([x, y], [NaN, NaN]);
        end
    end
end