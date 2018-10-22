function [tests] = initializeSampleTestComponents()
%% INITIALIZESAMPLETESTCOMPONENTS 
% Allocate memory for dynamic arrays of *tests* structure.
%
% * Syntax
%
%   [TESTS] = INITIALIZESAMPLETESTCOMPONENTS()
%
% * Output
%
% -- tests - structure for healthy plant leaves.
% 
% * Examples:
%
% Insert function before loop for adding elements to arrays.
% 
% * See also: 
%   
% No dependencies.
%
% * Author: *Dmitrii Leliuhin* 
% * Email: dleliuhin@mail.ru
% * Date: 12/09/2018 ??9:05:46
% * Version: 1.0 $ 
% * Requirements: PCWIN64, MatLab R2016a   
%
% * Warning:
%
% # Warnings list.
% 
% * TODO:
%
% # Replace dynamic memory allocation *[]* with *zeros()* function.
%

%% Code

%% _Initialize empty arrays for R component_
tests.h.R.Contrast=[];
tests.h.R.Correlation=[];
tests.h.R.Energy=[];
tests.h.R.Homogeneity=[];
tests.nh.R.Contrast=[];
tests.nh.R.Correlation=[];
tests.nh.R.Energy=[];
tests.nh.R.Homogeneity=[];
    
%% _Initialize empty arrays for G component_
tests.h.G.Contrast=[];
tests.h.G.Correlation=[];
tests.h.G.Energy=[];
tests.h.G.Homogeneity=[];
tests.nh.G.Contrast=[];
tests.nh.G.Correlation=[];
tests.nh.G.Energy=[];
tests.nh.G.Homogeneity=[];
    
%% _Initialize empty arrays for B component_
tests.h.B.Contrast=[];
tests.h.B.Correlation=[];
tests.h.B.Energy=[];
tests.h.B.Homogeneity=[];
tests.nh.B.Contrast=[];
tests.nh.B.Correlation=[];
tests.nh.B.Energy=[];
tests.nh.B.Homogeneity=[];
    
%% _Initialize empty arrays for RG component_
tests.h.RG.Contrast=[];
tests.h.RG.Correlation=[];
tests.h.RG.Energy=[];
tests.h.RG.Homogeneity=[];
tests.nh.RG.Contrast=[];
tests.nh.RG.Correlation=[];
tests.nh.RG.Energy=[];
tests.nh.RG.Homogeneity=[];

%% _Initialize empty arrays for RB component_
tests.h.RB.Contrast=[];
tests.h.RB.Correlation=[];
tests.h.RB.Energy=[];
tests.h.RB.Homogeneity=[];
tests.nh.RB.Contrast=[];
tests.nh.RB.Correlation=[];
tests.nh.RB.Energy=[];
tests.nh.RB.Homogeneity=[];

%% _Initialize empty arrays for GBs component_
tests.h.GB.Contrast=[];
tests.h.GB.Correlation=[];
tests.h.GB.Energy=[];
tests.h.GB.Homogeneity=[];
tests.nh.GB.Contrast=[];
tests.nh.GB.Correlation=[];
tests.nh.GB.Energy=[];
tests.nh.GB.Homogeneity=[];

end
