classdef GenerateExtraSimplifiedPressureSystemTest < matlab.unittest.TestCase
    
    methods (Test)    
        function should_simplify_system_for_three_nodes_with_one_boundary(testCase)
            Ap = [2 -1 -1
                 -1  2 -1
                 -1 -1  2];
            xns = [0 1 2]';
            pL = 1;
            pR = 0;
            L = 3;
            
            [nL, nR] = find_edge_nodes(xns, L);
            [Aps, c] = generate_extra_simplified_pressure_system(Ap, xns, nL, pL, nR, pR, L);
            Aps_expected = [2 -1
                           -1  2];
            c_expected = [pL pL]';
            
            testCase.verifyEqual(Aps, Aps_expected, 'AbsTol', 1E-14);
            testCase.verifyEqual(c, c_expected, 'AbsTol', 1E-14);
        end
    
         function should_simplify_system_for_three_nodes_with_two_boundaries(testCase)
             Ap = [2 -1 -1
                  -1  2 -1
                  -1 -1  2];
             xns = [0 1 3]';
             pL = 1;
             pR = 0;
             L = 3;
             
             [nL, nR] = find_edge_nodes(xns, L);
             [Aps, c] = generate_extra_simplified_pressure_system(Ap, xns, nL, pL, nR, pR, L);
             Aps_expected = 2;
             c_expected = pL + pR;
            
             testCase.verifyEqual(Aps, Aps_expected, 'AbsTol', 1E-14);
             testCase.verifyEqual(c, c_expected, 'AbsTol', 1E-14);
         end
    end
end