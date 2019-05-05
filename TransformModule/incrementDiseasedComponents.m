function [ioNh1] = incrementDiseasedComponents(ioNh1, iStats)
%% INCREMENTDISEASEDCOMPONENTS
% Increment array of *ioNh11* structure.
%
% * Syntax
%
%   [IONH1] = INCREMENTHEALTHYCOMPONENTS(IONH1, STATS)
%
% * Intput
%
% -- ioNh1 - structure for 1st group diseased plant leaves.
%
% -- iStats - structure for plant leaf which must be add to end of *ioNh1*.
%
% * Output
%
% -- ioNh1 - return incremented structure for diseased plant leaves.
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

%% Adding current image R statistical properties to fixed _ioNh1_ structure
ioNh1.R.Contrast(end+1) =      iStats.R.Contrast(1);
ioNh1.R.Correlation(end+1) =   iStats.R.Correlation(1);
ioNh1.R.Energy(end+1) =        iStats.R.Energy(1);
ioNh1.R.Homogeneity(end+1) =   iStats.R.Homogeneity(1);

%% Adding current image G statistical properties to fixed _ioNh1_ structure
ioNh1.G.Contrast(end+1) =      iStats.G.Contrast(1);
ioNh1.G.Correlation(end+1) =   iStats.G.Correlation(1);
ioNh1.G.Energy(end+1) =        iStats.G.Energy(1);
ioNh1.G.Homogeneity(end+1) =   iStats.G.Homogeneity(1);    

%% Adding current image B statistical properties to fixed _ioNh1_ structure
ioNh1.B.Contrast(end+1) =      iStats.B.Contrast(1);
ioNh1.B.Correlation(end+1) =   iStats.B.Correlation(1);
ioNh1.B.Energy(end+1) =        iStats.B.Energy(1);
ioNh1.B.Homogeneity(end+1) =   iStats.B.Homogeneity(1);    

%% Adding current image RG statistical properties to fixed _ioNh1_ structure
ioNh1.RG.Contrast(end+1) =     iStats.RG.Contrast(1);
ioNh1.RG.Correlation(end+1) =  iStats.RG.Correlation(1);
ioNh1.RG.Energy(end+1) =       iStats.RG.Energy(1);
ioNh1.RG.Homogeneity(end+1) =  iStats.RG.Homogeneity(1);    

%% Adding current image RB statistical properties to fixed _ioNh1_ structure
ioNh1.RB.Contrast(end+1) =     iStats.RB.Contrast(1);
ioNh1.RB.Correlation(end+1) =  iStats.RB.Correlation(1);
ioNh1.RB.Energy(end+1) =       iStats.RB.Energy(1);
ioNh1.RB.Homogeneity(end+1) =  iStats.RB.Homogeneity(1);

%% Adding current image GB statistical properties to fixed _ioNh1_ structure
ioNh1.GB.Contrast(end+1) =     iStats.GB.Contrast(1);
ioNh1.GB.Correlation(end+1) =  iStats.GB.Correlation(1);
ioNh1.GB.Energy(end+1) =       iStats.GB.Energy(1);
ioNh1.GB.Homogeneity(end+1) =  iStats.GB.Homogeneity(1);
end