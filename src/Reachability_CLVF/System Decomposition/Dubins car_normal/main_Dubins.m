
%times of computation 
t0 = 0;
tMax = 1;
dt = 0.01;
tau = t0:dt:tMax;
finaltime=size(tau);
finaltime=finaltime(2);

%grid 
grid_min = [-3; 0]; % Lower corner of computation domain
grid_max = [3; 2*pi];    % Upper corner of computation domain

gridx=256;
gridy=256;
gridTheta=256;
N = [gridx; gridTheta];         % Number of grid points per dimension
pdDims = 2;               % 3rd dimension is periodic
g = createGrid(grid_min, grid_max, N, pdDims);

S.g=g;
S.tau=tau;
%call subsystems data 
datax=twoD_xposition(S);
datay=twoD_yposition(S);

%initialize the complete system 
new_sys=zeros(gridx,gridy,gridTheta,1);

%make the backprojections 

for i=1:gridx
    for j=1:gridy
        for k=1:gridTheta
            val=max(datax(i,k,finaltime),datay(j,k,finaltime));
            new_sys(i,j,k,1)=val;
        end
    end  
end


%plot 
figure 
N_3D=[gridx; gridy; gridTheta];
grid_min = [-3; -3; 0]; % Lower corner of computation domain
grid_max = [3; 3; 2*pi];    % Upper corner of computation domain
grid_3D=createGrid(grid_min, grid_max, N_3D, 3);
h=visSetIm(grid_3D,new_sys, 'blue', 0);
xlim([-4 4]);
ylim([-4 4]);

save('V_1.mat',"new_sys")




