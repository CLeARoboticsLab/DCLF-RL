function uOpt = optCtrl(obj, ~, ~, deriv, uMode)
disp("entre al optCtrl incorrecto");
%% Input processing
if nargin < 5
  uMode = 'min';
end
if ~iscell(deriv)
  deriv = num2cell(deriv);
end

%% Optimal control
if strcmp(uMode, 'max')
  uOpt = (deriv{obj.dims==2}>=0)*obj.wRange(2) + (deriv{obj.dims==2}<0)*(obj.wRange(1));
  disp("hola entre hsta Optctrl");
elseif strcmp(uMode, 'min')
  uOpt = (deriv{obj.dims==2}>=0)*(obj.wRange(1)) + (deriv{obj.dims==2}<0)*obj.wRange(2);
  disp("hola, entre hasta optCtrl");
else
  error('Unknown uMode!')
end

end