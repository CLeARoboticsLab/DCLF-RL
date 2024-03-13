% Script file that adds the Kernel subdirectories to the path.
%
% Call this script before working with the Matlab Level Set Toolbox
%   (or place it in your startup.m file).

% Copyright 2004 Ian M. Mitchell (mitchell@cs.ubc.ca).
% This software is used, copied and distributed under the licensing 
%   agreement contained in the file LICENSE in the top directory of 
%   the distribution.
%
% Ian Mitchell, 1/13/04

% Proper operation of function handles seems to require an absolute path
%   (at least for Matlab version 6.5).
addpath(genpath('C:\Users\Antonio\Documents\UT Austin\Lab\Level set methods\ToolboxLS\Kernel'));
addpath(genpath('C:\Users\Antonio\Documents\UT Austin\Lab\Level set methods\helperOC-master\dynSys'));
addpath(genpath('C:\Users\Antonio\Documents\UT Austin\Lab\Level set methods\helperOC-master\grids'));
addpath(genpath('C:\Users\Antonio\Documents\UT Austin\Lab\Level set methods\helperOC-master\Hamiltonians'));
addpath(genpath('C:\Users\Antonio\Documents\UT Austin\Lab\Level set methods\helperOC-master\misc'));
addpath(genpath('C:\Users\Antonio\Documents\UT Austin\Lab\Level set methods\helperOC-master\valFuncs'));
addpath(genpath('C:\Users\Antonio\Documents\UT Austin\Lab\Level set methods\helperOC-master\visualization'));

