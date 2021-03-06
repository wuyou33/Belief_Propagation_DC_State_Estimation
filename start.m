 clc
 clearvars

 
%------------------------------Load Data-----------------------------------
 addpath(genpath('data'))
 load('dc_ieee118_177_9.mat')
%--------------------------------------------------------------------------


%-----------------------Post-processing Options----------------------------
 user.radius = 1;
 user.error  = 1;
%--------------------------------------------------------------------------
 

%-----------------------Design of Iteration Scheme-------------------------
 user.stop = 10^-10;
 user.maxi = 2000;
%--------------------------------------------------------------------------


%-----------------------Convergence Parameters-----------------------------
 user.prob = 0.6;
 user.alph = 0.5;
%--------------------------------------------------------------------------


%-----------------------Virtual Factor Nodes-------------------------------
 user.vari = 10^60;
%--------------------------------------------------------------------------


%--------------------------Main Functions----------------------------------
 [sys, bp, wls] = a1_preprocessing(dataSE, user);
 [bp]           = b1_belief_propagation(bp, user); 
 [wls, bp]      = c1_postprocessing(wls, bp, user);
%--------------------------------------------------------------------------