classdef GeneratePressureCoefficientMatrixTests < matlab.unittest.TestCase
    
    methods (Test)    
        function should_generate_coefficient_matrix_for_two_nodes(testCase)
            CC = [0 1
                  1 0];
            bb = [0 1
                  1 0];
            ll = [0 1
                  1 0] / 12E-3;
            K = generate_darcys_coefficient(bb, ll);
            
            Ap = generate_pressure_coefficient_matrix(CC, K);
            Ap_expected = [1 -1
                         -1  1];
            
            testCase.verifyEqual(Ap, Ap_expected, 'AbsTol', 1E-14);
        end
    
        function should_generate_coefficient_matrix_for_three_nodes(testCase)
            CC = [0 1 3
                  1 0 2
                  3 2 0];
            bb = [0 1 1
                  1 0 1
                  1 1 0];
            ll = [0 1 1
                  1 0 1
                  1 1 0] / 12E-3;
            K = generate_darcys_coefficient(bb, ll);
            
            Ap = generate_pressure_coefficient_matrix(CC, K);
            Ap_expected = [2 -1 -1
                          -1  2 -1
                          -1 -1  2];
            
            testCase.verifyEqual(Ap, Ap_expected, 'AbsTol', 1E-14);
        end
    end
end