function [h] = incrementHealthyComponents(h,stats)
%% INCREMENTHEALTHYCOMPONENTS
% Increment array of *h* structure.
%
% * Syntax
%
%   [H] = INCREMENTHEALTHYCOMPONENTS(H, STATS)
%
% * Intput
%
% -- h - structure for healthy plant leaves.
%
% -- stats - structure for plant leaf which must be add to end of *h*.
%
% * Output
%
% -- h - return incremented structure for healthy plant leaves.
% 
% * Examples:
%
% Provide sample usage code here.
% 
% * See also: 
%   
% No dependencies.
%
% * Author: *Dmitrii Leliuhin* 
% * Email: dleliuhin@mail.ru
% * Date: 17/07/2018 15:32:17
% * Version: 1.0 $ 
% * Requirements: PCWIN64, MatLab R2016a   
%
% * Warning:
%
% # Warnings list.
% 
% * TODO:
%
% # TODO list.
%

%% Code

%% Adding current image R statistical properties to fixed _h_ structure
h.R.Contrast(end+1) =       stats.R.Contrast(1);
h.R.Correlation(end+1) =    stats.R.Correlation(1);
h.R.Energy(end+1) =         stats.R.Energy(1);
h.R.Homogeneity(end+1) =    stats.R.Homogeneity(1); 

%% Adding current image G statistical properties to fixed _h_ structure
h.G.Contrast(end+1) =       stats.G.Contrast(1);
h.G.Correlation(end+1) =    stats.G.Correlation(1);
h.G.Energy(end+1) =         stats.G.Energy(1);
h.G.Homogeneity(end+1) =    stats.G.Homogeneity(1);    

%% Adding current image B statistical properties to fixed _h_ structure
h.B.Contrast(end+1) =       stats.B.Contrast(1);
h.B.Correlation(end+1) =    stats.B.Correlation(1);
h.B.Energy(end+1) =         stats.B.Energy(1);
h.B.Homogeneity(end+1) =    stats.B.Homogeneity(1);    

%% Adding current image RG statistical properties to fixed _h_ structure
h.RG.Contrast(end+1) =      stats.RG.Contrast(1);
h.RG.Correlation(end+1) =   stats.RG.Correlation(1);
h.RG.Energy(end+1) =        stats.RG.Energy(1);
h.RG.Homogeneity(end+1) =   stats.RG.Homogeneity(1);    

%% Adding current image RB statistical properties to fixed _h_ structure
h.RB.Contrast(end+1) =      stats.RB.Contrast(1);
h.RB.Correlation(end+1) =   stats.RB.Correlation(1);
h.RB.Energy(end+1) =        stats.RB.Energy(1);
h.RB.Homogeneity(end+1) =   stats.RB.Homogeneity(1);

%% Adding current image GB statistical properties to fixed _h_ structure
h.GB.Contrast(end+1) =      stats.GB.Contrast(1);
h.GB.Correlation(end+1) =   stats.GB.Correlation(1);
h.GB.Energy(end+1) =        stats.GB.Energy(1);
h.GB.Homogeneity(end+1) =   stats.GB.Homogeneity(1); 
end