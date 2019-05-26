function [ioH] = incrementHealthyComponents(ioH, iStats)
%% INCREMENTHEALTHYCOMPONENTS
% Increment array of *ioH* structure.
%
% * Syntax
%
%   [IOH] = INCREMENTHEALTHYCOMPONENTS(IOH, ISTATS)
%
% * Intput
%
% -- ioH - structure for healthy plant leaves.
%
% -- iStats - structure for plant leaf which must be add to end of *ioH*.
%
% * Output
%
% -- ioH - return incremented structure for healthy plant leaves.
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
ioH.R.Contrast(end+1) =       iStats.R.Contrast(1);
ioH.R.Correlation(end+1) =    iStats.R.Correlation(1);
ioH.R.Energy(end+1) =         iStats.R.Energy(1);
ioH.R.Homogeneity(end+1) =    iStats.R.Homogeneity(1); 

%% Adding current image G statistical properties to fixed _h_ structure
ioH.G.Contrast(end+1) =       iStats.G.Contrast(1);
ioH.G.Correlation(end+1) =    iStats.G.Correlation(1);
ioH.G.Energy(end+1) =         iStats.G.Energy(1);
ioH.G.Homogeneity(end+1) =    iStats.G.Homogeneity(1);    

%% Adding current image B statistical properties to fixed _h_ structure
ioH.B.Contrast(end+1) =       iStats.B.Contrast(1);
ioH.B.Correlation(end+1) =    iStats.B.Correlation(1);
ioH.B.Energy(end+1) =         iStats.B.Energy(1);
ioH.B.Homogeneity(end+1) =    iStats.B.Homogeneity(1);    

%% Adding current image RG statistical properties to fixed _h_ structure
ioH.RG.Contrast(end+1) =      iStats.RG.Contrast(1);
ioH.RG.Correlation(end+1) =   iStats.RG.Correlation(1);
ioH.RG.Energy(end+1) =        iStats.RG.Energy(1);
ioH.RG.Homogeneity(end+1) =   iStats.RG.Homogeneity(1);    

%% Adding current image RB statistical properties to fixed _h_ structure
ioH.RB.Contrast(end+1) =      iStats.RB.Contrast(1);
ioH.RB.Correlation(end+1) =   iStats.RB.Correlation(1);
ioH.RB.Energy(end+1) =        iStats.RB.Energy(1);
ioH.RB.Homogeneity(end+1) =   iStats.RB.Homogeneity(1);

%% Adding current image GB statistical properties to fixed _h_ structure
ioH.GB.Contrast(end+1) =      iStats.GB.Contrast(1);
ioH.GB.Correlation(end+1) =   iStats.GB.Correlation(1);
ioH.GB.Energy(end+1) =        iStats.GB.Energy(1);
ioH.GB.Homogeneity(end+1) =   iStats.GB.Homogeneity(1); 

end