classdef FractureGenerator
    % FRACTURE_GENERATOR Generate random fractures
    
    properties
        Nf      % number of fractures
        L       % length of domain
        H       % height of domain
        s       % random seed
    end
    
    properties (Constant)
        b_min = 3E-5
        b_max = 3E-3
    end
    
    methods
        function obj = FractureGenerator(Nf, L, H, s)
            obj.Nf = Nf;
            obj.L = L;
            obj.H = H;
            
            if (isnan(s))
                rng('shuffle');
                obj.s = rng;
            else
                obj.s = s;
                rng(s)
            end
        end

        function lfs = generate_lengths(obj)
            min_length = obj.L / 3;
            max_length = obj.L * 3;
            range = max_length - min_length;
            
            lfs = obj.random_array() * range + min_length;
        end
    
        function thetafs = generate_orientations(obj)            
            thetafs = obj.random_array() * pi;
        end
    
        function xfs = generate_horizontal_positions(obj)            
            xfs = obj.random_array() * obj.L;
        end
    
        function yfs = generate_vertical_positions(obj)            
            yfs = obj.random_array() * obj.H;
        end
    
        function bfs = generate_apertures(obj)            
            range = obj.b_max - obj.b_min;
            bfs = obj.random_array() * range + obj.b_min;
        end
    
        function [lb, thetab, bb, xb, yb] = generate_bounds(obj)
            % Generates bounds for top, down, left, right
            lb = [obj.L obj.L obj.H obj.H]';
            thetab = [0 0 pi/2 pi/2]';
            bb = zeros(4, 1);
            xb = [obj.L/2 obj.L/2 0 obj.L]';
            yb = [obj.H 0 obj.H/2 obj.H/2]';
        end
    end
    
    methods (Access = private)
        function random_array = random_array(obj)
            random_array = rand(obj.Nf, 1);
        end
    end
end

