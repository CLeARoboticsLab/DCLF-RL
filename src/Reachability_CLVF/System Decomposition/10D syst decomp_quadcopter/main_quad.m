


%times of computation 
t0 = 0;
tMax = 0.01;
dt = 0.01;
tau = t0:dt:tMax;
finaltime=size(tau);
finaltime=finaltime(2);

%grid 
grid_min = [-4;-2; 0;-1]; % Lower corner of computation domain
grid_max = [4;2; 2*pi;1];    % Upper corner of computation domain
grid_minz=[0,-5];
grid_maxz=[10,5];

gridx=30;
gridvx=30;
gridy=30;
gridvy=30;
gridPhi=40;
gridOmega=30;
gridz=30;
gridvz=30;
N_xy = [gridx; gridvx; gridPhi; gridOmega];         % Number of grid points per dimension
pdDims = 3;               % 3rd dimension is periodic
g = createGrid(grid_min, grid_max, N_xy, pdDims);
N_z=[gridz,gridvz];
g_z=createGrid(grid_minz,grid_maxz,N_z);

S.g=g;
S.tau=tau;
S_z.g=g_z;
S_z.tau=tau;
%call subsystems data 
datax=fourD_xposition(S);
%datay=fourD_yposition(S);
%dayaz=twoD_zposition(S_z);



save('V_x.mat',"datax")
save('V_y.mat',"datay")
save('V_z.mat',"dataz")








