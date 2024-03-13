function dataz= twoD_zposition(S)

%% problem parameters
g=S.g;
tau=S.tau;
% control trying to min or max value function?
uMode = 'min';
dMode = 'max';


%% Pack problem parameters
state=[0,0];
dQuad = Quad10D_2DZ(state);

gamma1 = 0;
gamma2 = 0.3;
gamma3 = 3;


schemeData.grid = g;
schemeData.dynSys = dQuad;
schemeData.accuracy = 'high'; %set accuracy
schemeData.uMode = uMode;
schemeData.dMode = dMode;


%% Compute the CLVF using algorithm 1. 
% First find the smallest value for the value function with gamma = 0
R = 0;

%data0_1 = shapeCylinder(g, 3, [0; 0; 0], R); % under current setup. it's necessary to use shapeCylinder
%[V_1,tau1] = ComputeHJ(data0_1,tau,schemeData,1,gamma1);
%c = min(V_1,[],'all');
% save('V_gamma=0_fine.mat','V_1')
 %save('g_fine.mat','g')

%Compute CLVF with gamma \neq 0
 data0_2 = shapeRectangleByCorners(g,[0,0,0,0],[0,0,0,0]);
 [dataz,tau2] = ComputeHJ(data0_2,tau,schemeData,2,gamma2);
 %save('V_gamma03','V_2')

function [data,tau] = ComputeHJ(data0,tau0,schemeData,n,gamma)

HJIextraArgs.visualize.valueSet = 1;
HJIextraArgs.visualize.valueFunction = 1;
HJIextraArgs.visualize.initialValueSet = 1;
HJIextraArgs.visualize.figNum = n; %set figure number
HJIextraArgs.visualize.deleteLastPlot = true; %delete previous plot as you update
HJIextraArgs.convergeThreshold = 0.0015;
HJIextraArgs.stopConverge = 1;
HJIextraArgs.keepLast = 1;
HJIextraArgs.makeVideo = 0;
HJIextraArgs.targetFunction = data0;
HJIextraArgs.visualize.plotData.plotDims = [1 0 1 0]; %plot x, y
HJIextraArgs.visualize.plotData.projpt = {0,0}; %project at theta = 0
HJIextraArgs.visualize.viewAngle = [30,45]; % view 2D
% HJIextraArgs.visualize.viewAxis = [-1.5 1.5 -1.5 1.5 -pi pi];
HJIextraArgs.ignoreBoundary = 1;
schemeData.clf.gamma = gamma;


[data, tau, ~] = ...
  HJIPDE_ZGsolve(data0, tau0, schemeData, 'minCLF', HJIextraArgs);

end



end