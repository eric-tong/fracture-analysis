classdef TaskOneATests < matlab.unittest.TestCase
   
    properties
        generator
    end
    
    properties (Constant)
        Nfs = 100
        L = 20
        H = 10
        s = 5
    end
 
    methods(TestMethodSetup)
        function generate_properties(testCase)
            testCase.generator = FractureGenerator(testCase.Nfs, testCase.L, testCase.H, testCase.s);
        end
    end
    
    methods (Test)
        function lfs_is_within_range(testCase)
            lfs = testCase.generator.generate_lengths();
   
            is_within_range = and(lfs > testCase.L / 3, lfs < testCase.L * 3);
            testCase.verifyTrue(length(lfs) == testCase.Nfs && all(is_within_range));
        end
    
        function thetafs_is_within_range(testCase)
            thetafs = testCase.generator.generate_orientations();
   
            is_within_range = and(thetafs > 0, thetafs < pi);
            testCase.verifyTrue(length(thetafs) == testCase.Nfs && all(is_within_range));
        end
    
        function xfs_is_within_range(testCase)
            xfs = testCase.generator.generate_horizontal_positions();
   
            is_within_range = and(xfs > 0, xfs < testCase.L);
            testCase.verifyTrue(length(xfs) == testCase.Nfs && all(is_within_range));
        end
    
        function yfs_is_within_range(testCase)
            yfs = testCase.generator.generate_vertical_positions();
   
            is_within_range = and(yfs > 0, yfs < testCase.H);
            testCase.verifyTrue(length(yfs) == testCase.Nfs && all(is_within_range));
        end
    
        function bfs_is_within_range(testCase)
            bfs = testCase.generator.generate_apertures();
   
            is_within_range = and(bfs > testCase.generator.b_min, bfs < testCase.generator.b_max);
            testCase.verifyTrue(length(bfs) == testCase.Nfs && all(is_within_range));
        end
    end
end