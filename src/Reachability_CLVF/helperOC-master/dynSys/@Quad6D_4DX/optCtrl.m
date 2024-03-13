function u = optCtrl(obj, t, x, deriv, uMode)
% uOpt = optCtrl(obj, t, y, deriv, uMode, dims)
%% Input processing
if nargin < 5
  uMode = 'max';
end

dims = obj.dims;
% if nargin < 7
%   dims = 1:obj.nx;
% end

if ~iscell(deriv)
  deriv = num2cell(deriv);
end

if ~iscell(x)
  x = num2cell(x);
end

%% Optimal control
if strcmp(uMode, 'max')
  
  if isempty(setdiff([2, 4, 5, 6],dims))
  T1Opt = (((deriv{dims==2}.*(-1/obj.m).*(sin(x{dims==5})))+...
    (deriv{dims==4}.*((1/obj.m).*cos(x{dims==5})))+...
    0*(deriv{dims==6}.*(obj.l/obj.Iyy)))>=0).*obj.T1Max+...
    ...
    (((deriv{dims==2}.*(-1/obj.m).*(sin(x{dims==5})))+...
    (deriv{dims==4}.*((1/obj.m).*cos(x{dims==5})))+...
    0*(deriv{dims==6}.*(obj.l/obj.Iyy)))<0).*obj.T1Min;
  
  T2Opt = (((deriv{dims==2}.*(1/obj.m).*(cos(x{dims==5}))) +...
    (deriv{dims==4}.*((1/obj.m).*sin(x{dims==5})))+...
    (deriv{dims==6}.*(obj.l/obj.Iyy)))>=0).*obj.T2Max+...
    ...
    (((deriv{dims==2}.*(-1/obj.m).*(sin(x{dims==5}))) +...
    (deriv{dims==4}.*((1/obj.m).*cos(x{dims==5})))+...
    (deriv{dims==6}.*(obj.l/obj.Iyy)))<0).*obj.T2Min;
  
  elseif isempty(setdiff([2,5, 6],dims))
    T1Opt = (((deriv{dims==2}.*(-1/obj.m).*(sin(x{dims==5})))+...
      (deriv{dims==6}.*(-obj.l/obj.Iyy)))>=0).*obj.T1Max+...
      ...
      (((deriv{dims==2}.*(-1/obj.m).*(sin(x{dims==5})))+...
      (deriv{dims==6}.*(-obj.l/obj.Iyy)))<0).*obj.T1Min;
    
    T2Opt = (((deriv{dims==2}.*(-1/obj.m).*(sin(x{dims==5}))) +...
      (deriv{dims==6}.*(obj.l/obj.Iyy)))>=0).*obj.T2Max+...
      ...
      (((deriv{dims==2}.*(-1/obj.m).*(sin(x{dims==5}))) +...
      (deriv{dims==6}.*(obj.l/obj.Iyy)))<0).*obj.T2Min;
    
  elseif isempty(setdiff([4,5, 6],dims))
    T1Opt = (((deriv{dims==4}.*((1/obj.m).*cos(x{dims==5})))+...
      (deriv{dims==6}.*(-obj.l/obj.Iyy)))>=0).*obj.T1Max+...
      ...
      (((deriv{dims==4}.*((1/obj.m).*cos(x{dims==5})))+...
      (deriv{dims==6}.*(-obj.l/obj.Iyy)))<0).*obj.T1Min;
    
    T2Opt = (((deriv{dims==4}.*((1/obj.m).*cos(x{dims==5})))+...
      (deriv{dims==6}.*(obj.l/obj.Iyy)))>=0).*obj.T2Max+...
      ...
      (((deriv{dims==4}.*((1/obj.m).*cos(x{dims==5})))+...
      (deriv{dims==6}.*(obj.l/obj.Iyy)))<0).*obj.T2Min;
    
  else
    error('not set up for that deconstruction!')
  end

elseif strcmp(uMode, 'min')
  if isempty(setdiff([2, 4, 5, 6],dims))
    T1Opt = (((deriv{dims==2}.*(-1/obj.m).*(sin(x{dims==5})))+...
      (deriv{dims==4}.*((1/obj.m).*cos(x{dims==5})))+...
      0*(deriv{dims==6}.*(obj.l/obj.Iyy)))>=0).*obj.T1Min+...
      ...
      (((deriv{dims==2}.*(-1/obj.m).*(sin(x{dims==5})))+...
      (deriv{dims==4}.*((1/obj.m).*cos(x{dims==5})))+...
      0*(deriv{dims==6}.*(obj.l/obj.Iyy)))<0).*obj.T1Max;
    
    T2Opt = (((deriv{dims==2}.*(1/obj.m).*(cos(x{dims==5}))) +...
      (deriv{dims==4}.*((1/obj.m).*sin(x{dims==5})))+...
      (deriv{dims==6}.*(obj.l/obj.Iyy)))>=0).*obj.T2Min+...
      ...
      (((deriv{dims==2}.*(1/obj.m).*(cos(x{dims==5}))) +...
      (deriv{dims==4}.*((1/obj.m).*sin(x{dims==5})))+...
      (deriv{dims==6}.*(obj.l/obj.Iyy)))<0).*obj.T2Max;
    
  elseif isempty(setdiff([2, 5, 6],dims))
    T1Opt = (((deriv{dims==2}.*(-1/obj.m).*(sin(x{dims==5})))+...
      (deriv{dims==6}.*(-obj.l/obj.Iyy)))>=0).*obj.T1Min+...
      ...
      (((deriv{dims==2}.*(-1/obj.m).*(sin(x{dims==5})))+...
      (deriv{dims==6}.*(-obj.l/obj.Iyy)))<0).*obj.T1Max;
    
    T2Opt = (((deriv{dims==2}.*(-1/obj.m).*(sin(x{dims==5}))) +...
      (deriv{dims==6}.*(obj.l/obj.Iyy)))>=0).*obj.T2Min+...
      ...
      (((deriv{dims==2}.*(-1/obj.m).*(sin(x{dims==5}))) +...
      (deriv{dims==6}.*(obj.l/obj.Iyy)))<0).*obj.T2Max;
    
  elseif isempty(setdiff([4, 5, 6], dims))
        T1Opt = (((deriv{dims==4}.*((1/obj.m).*cos(x{dims==5})))+...
          (deriv{dims==6}.*(-obj.l/obj.Iyy)))>=0).*obj.T1Min+...
          ...
          (((deriv{dims==4}.*((1/obj.m).*cos(x{dims==5})))+...
          (deriv{dims==6}.*(-obj.l/obj.Iyy)))<0).*obj.T1Max;
        
        T2Opt = (((deriv{dims==4}.*((1/obj.m).*cos(x{dims==5})))+...
          (deriv{dims==6}.*(obj.l/obj.Iyy)))>=0).*obj.T2Min+...
          ...
          (((deriv{dims==4}.*((1/obj.m).*cos(x{dims==5})))+...
          (deriv{dims==6}.*(obj.l/obj.Iyy)))<0).*obj.T2Max;
  else
    error('not set up for that deconstruction!')
  end
end


u = [T1Opt, T2Opt];
end