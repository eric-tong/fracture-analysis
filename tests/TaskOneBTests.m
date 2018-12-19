classdef TaskOneBTests < matlab.unittest.TestCase
    
    properties (Constant)
        Nfs = 100
        L = 20
        H = 10
    end
    
    methods (Test)    
        function generated_lengths_are_different_for_nan_seed(testCase)
            generator_nan = FractureGenerator(testCase.Nfs, testCase.L, testCase.H, NaN);
            lfs_1 = generator_nan.generate_lengths();
            generator_nan = FractureGenerator(testCase.Nfs, testCase.L, testCase.H, NaN);
            lfs_2 = generator_nan.generate_lengths();
            
            testCase.verifyNotEqual(lfs_1, lfs_2);
        end
    
        function generated_lengths_are_equal_for_int_seed(testCase)
            generator_int = FractureGenerator(testCase.Nfs, testCase.L, testCase.H, 5);
            lfs_1 = generator_int.generate_lengths();
            generator_int = FractureGenerator(testCase.Nfs, testCase.L, testCase.H, 5);
            lfs_2 = generator_int.generate_lengths();
            
            testCase.verifyEqual(lfs_1, lfs_2);
        end
    end
end