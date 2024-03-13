function dx = dynamics(obj, ~, x, u, d)
% Dynamics of the Dubins Car
%    \dot{x}_1 = v * cos(x_3) + d1
%    \dot{x}_2 = v * sin(x_3) + d2
%    \dot{x}_3 = w
%   Control: u = w;
%
% Mo Chen, 2016-06-08

if nargin < 5
  d = [0; 0];
end

if iscell(x)
  dx = cell(length(obj.dims), 1);
  
  for i = 1:length(obj.dims)
    dx{i} = dynamics_cell_helper(obj, x, u, d, obj.dims, obj.dims(i));
  end
else
  dx = zeros(obj.nx, 1);
  
  dx(1) = obj.speed * sin(x(2)) + d(1);
  dx(2) = u + d(2);
end
end

function dx = dynamics_cell_helper(obj, x, u, d, dims, dim)

switch dim
  case 1
    dx = obj.speed * sin(x{dims==2});
  case 2
    dx = u 
  otherwise
    error('Only dimension 1-2 are defined for dynamics of DubinsCar!')
end
end