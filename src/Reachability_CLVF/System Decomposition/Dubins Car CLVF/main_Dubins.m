
%times of computation 
t0 = 0;
tMax = 1.5;
dt = 0.01;
tau = t0:dt:tMax;
finaltime=size(tau);
finaltime=finaltime(2);

%grid 
grid_min = [-3; -pi]; % Lower corner of computation domain
grid_max = [3; pi];    % Upper corner of computation domain

gridx=51;
gridy=51;
gridTheta=61;
N = [gridx; gridTheta];         % Number of grid points per dimension
pdDims = 2;               % 2nd dimension is periodic
g = createGrid(grid_min, grid_max, N, pdDims);

S.g=g;
S.tau=tau;
%call subsystems data 
datax=twoD_xposition(S);
datay=twoD_yposition(S);

%initialize the complete system 
new_sys=zeros(gridx,gridy,gridTheta);

%make the backprojections 

for i=1:gridx
    for j=1:gridy
        for k=1:gridTheta
            val=datax(i,k)+datay(j,k);
            new_sys(i,j,k)=val;
        end
    end  
end

save('V_1.mat',"new_sys")
%plot 
figure 
N_3D=[gridx; gridy; gridTheta];
grid_min = [-3; -3; -pi]; % Lower corner of computation domain
grid_max = [3; 3; pi];    % Upper corner of computation domain
grid_3D=createGrid(grid_min, grid_max, N_3D, 3);
h=visSetIm(grid_3D,new_sys, 'blue', 0);
xlim([-4 4]);
ylim([-4 4]);






