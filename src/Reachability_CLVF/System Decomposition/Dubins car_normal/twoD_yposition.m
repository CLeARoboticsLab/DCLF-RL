function data= twoD_yposition(S)

g=S.g;
tau=S.tau;

%% target set
R=0;
% data0 = shapeCylinder(grid,ignoreDims,center,radius)
%data0 = shapeCylinder(g, 2, [0; 0], R);
% also try shapeRectangleByCorners, shapeSphere, etc.
data0=shapeRectangleByCorners(g, [-0.1,-Inf], [0.1,Inf]);


%% problem parameters

% input bounds
speed = 1;
%wMax = 1;
wRange = [ 0  2*pi ];
dRange={[0;0];[0;0]};
% do dStep1 here

% control trying to min or max value function?
uMode = 'min';
% do dStep2 here

%% Pack problem parameters

% Define dynamic system
% obj = DubinsCar(x, wMax, speed, dMax)
dCar = DubinsCar2Dy([0, 0], wRange, speed, dRange, [1,2]); %do dStep3 here

% Put grid and dynamic systems into schemeData
schemeData.grid = g;
schemeData.dynSys = dCar;
schemeData.accuracy = 'high'; %set accuracy
schemeData.uMode = uMode;
%do dStep4 here

%% Compute value function

%HJIextraArgs.visualize = true; %show plot
HJIextraArgs.visualize.valueSet = 1;
HJIextraArgs.visualize.initialValueSet = 0;
HJIextraArgs.visualize.figNum = 1; %set figure number
HJIextraArgs.visualize.deleteLastPlot = true; %delete previous plot as you update

% uncomment if you want to see a 2D slice
%HJIextraArgs.visualize.plotData.plotDims = [1 0 1]; %plot x, y
%HJIextraArgs.visualize.plotData.projpt = [0]; %project at theta = 0
%HJIextraArgs.visualize.viewAngle = [0,90]; % view 2D

%[data, tau, extraOuts] = ...
% HJIPDE_solve(data0, tau, schemeData, minWith, extraArgs)
[data, tau2, ~] = ...
  HJIPDE_solve(data0, tau, schemeData, 'none', HJIextraArgs);


end