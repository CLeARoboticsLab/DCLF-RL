
%times of computation 
t0 = 0;
tMax = 1.5;
dt = 0.01;
tau = t0:dt:tMax;
finaltime=size(tau);
finaltime=finaltime(2);

%grid 
grid_min = [-1.5;-5; -pi;-5]; % Lower corner of computation domain
grid_max = [1.5;5; pi;5];    % Upper corner of computation domain

gridx=30;
gridvx=30;
gridy=30;
gridvy=30;
gridPhi=40;
gridOmega=30;
N = [gridx; gridvx; gridPhi; gridOmega];         % Number of grid points per dimension
pdDims = 3;               % 3rd dimension is periodic
g = createGrid(grid_min, grid_max, N, pdDims);

S.g=g;
S.tau=tau;
%call subsystems data 
datay=fourD_yposition(S);
datax=fourD_xposition(S);

save('V_datax.mat',"datax")
save('V_datay.mat',"datay")



% 
% %initialize the complete system 
% new_sys=zeros(gridx,gridvx,gridy,gridvy,gridPhi,gridOmega);
% 
% %make the backprojections 
% 
% for i=1:gridx
%     for j=1:gridy
%         for k=1:gridTheta
%             val=datax(i,k)+datay(j,k);
%             new_sys(i,j,k)=val;
%         end
%     end  
% end
% 
% save('V_1.mat',"new_sys")
% %plot 
% figure 
% N_3D=[gridx; gridy; gridTheta];
% grid_min = [-3; -3; -pi]; % Lower corner of computation domain
% grid_max = [3; 3; pi];    % Upper corner of computation domain
% grid_3D=createGrid(grid_min, grid_max, N_3D, 3);
% h=visSetIm(grid_3D,new_sys, 'blue', 0);
% xlim([-4 4]);
% ylim([-4 4]);






