function [ioGroup] = incrementGroupComponents(ioGroup, iStats)
%% INCREMENTDISEASEDCOMPONENTS
% Increment array of *ioGroup* structure.
%
% * Syntax
%
%   [IOGROUP] = INCREMENTGROUPCOMPONENTS(IOGROUP, STATS)
%
% * Intput
%
% -- ioGroup - structure for specific group plant leaves.
%
% -- iStats - structure for plant leaf which must be add to 
%             end of *ioGroup*.
%
% * Output
%
% -- ioGroup - return incremented structure for specific group of
%              plant leaves.
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

%% Adding current image R statistical properties to fixed _ioGroup_ structure
ioGroup.R.Contrast(end+1) =      iStats.R.Contrast(1);
ioGroup.R.Correlation(end+1) =   iStats.R.Correlation(1);
ioGroup.R.Energy(end+1) =        iStats.R.Energy(1);
ioGroup.R.Homogeneity(end+1) =   iStats.R.Homogeneity(1);

%% Adding current image G statistical properties to fixed _ioGroup_ structure
ioGroup.G.Contrast(end+1) =      iStats.G.Contrast(1);
ioGroup.G.Correlation(end+1) =   iStats.G.Correlation(1);
ioGroup.G.Energy(end+1) =        iStats.G.Energy(1);
ioGroup.G.Homogeneity(end+1) =   iStats.G.Homogeneity(1);    

%% Adding current image B statistical properties to fixed _ioGroup_ structure
ioGroup.B.Contrast(end+1) =      iStats.B.Contrast(1);
ioGroup.B.Correlation(end+1) =   iStats.B.Correlation(1);
ioGroup.B.Energy(end+1) =        iStats.B.Energy(1);
ioGroup.B.Homogeneity(end+1) =   iStats.B.Homogeneity(1);    

%% Adding current image RG statistical properties to fixed _ioGroup_ structure
ioGroup.RG.Contrast(end+1) =     iStats.RG.Contrast(1);
ioGroup.RG.Correlation(end+1) =  iStats.RG.Correlation(1);
ioGroup.RG.Energy(end+1) =       iStats.RG.Energy(1);
ioGroup.RG.Homogeneity(end+1) =  iStats.RG.Homogeneity(1);    

%% Adding current image RB statistical properties to fixed _ioGroup_ structure
ioGroup.RB.Contrast(end+1) =     iStats.RB.Contrast(1);
ioGroup.RB.Correlation(end+1) =  iStats.RB.Correlation(1);
ioGroup.RB.Energy(end+1) =       iStats.RB.Energy(1);
ioGroup.RB.Homogeneity(end+1) =  iStats.RB.Homogeneity(1);

%% Adding current image GB statistical properties to fixed _ioGroup_ structure
ioGroup.GB.Contrast(end+1) =     iStats.GB.Contrast(1);
ioGroup.GB.Correlation(end+1) =  iStats.GB.Correlation(1);
ioGroup.GB.Energy(end+1) =       iStats.GB.Energy(1);
ioGroup.GB.Homogeneity(end+1) =  iStats.GB.Homogeneity(1);
end