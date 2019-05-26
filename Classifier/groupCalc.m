function [oGroup] = groupCalc(iGroup)
%% GROUPCALC 
% Summary of this function goes here. 
% 
% * Syntax 
% 
% [OUTPUTARGS] = GROUPCALC(INPUTARGS)
% 
% * Input 
% 
% -- INPUTARGS -  
% 
% * Output 
% 
% -- OUTPUTARGS -  
% 
% * Examples: 
% 
% Provide sample usage code here
% 
% * See also: 
% 
% List related files here 
% 
% * Author: Dmitrii Leliuhin 
% * Email: dleliuhin@mail.ru 
% * Date: 11/05/2019 16:46:29 
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
oGroup.R.Contrast =      mean(iGroup.R.Contrast);
oGroup.R.Correlation =   mean(iGroup.R.Correlation);
oGroup.R.Energy =        mean(iGroup.R.Energy);
oGroup.R.Homogeneity =   mean(iGroup.R.Homogeneity);

%% Adding current image G statistical properties to fixed _ioGroup_ structure
oGroup.G.Contrast =      mean(iGroup.G.Contrast);
oGroup.G.Correlation =   mean(iGroup.G.Correlation);
oGroup.G.Energy =        mean(iGroup.G.Energy);
oGroup.G.Homogeneity =   mean(iGroup.G.Homogeneity);

%% Adding current image B statistical properties to fixed _ioGroup_ structure
oGroup.B.Contrast =      mean(iGroup.B.Contrast);
oGroup.B.Correlation =   mean(iGroup.B.Correlation);
oGroup.B.Energy =        mean(iGroup.B.Energy);
oGroup.B.Homogeneity =   mean(iGroup.B.Homogeneity);

%% Adding current image RG statistical properties to fixed _ioGroup_ structure
oGroup.RG.Contrast =     mean(iGroup.RG.Contrast);
oGroup.RG.Correlation =  mean(iGroup.RG.Correlation);
oGroup.RG.Energy =       mean(iGroup.RG.Energy);
oGroup.RG.Homogeneity =  mean(iGroup.RG.Homogeneity);

%% Adding current image RB statistical properties to fixed _ioGroup_ structure
oGroup.RB.Contrast =     mean(iGroup.RB.Contrast);
oGroup.RB.Correlation =  mean(iGroup.RB.Correlation);
oGroup.RB.Energy =       mean(iGroup.RB.Energy);
oGroup.RB.Homogeneity =  mean(iGroup.RB.Homogeneity);

%% Adding current image GB statistical properties to fixed _ioGroup_ structure
oGroup.GB.Contrast =     mean(iGroup.GB.Contrast);
oGroup.GB.Correlation =  mean(iGroup.GB.Correlation);
oGroup.GB.Energy =       mean(iGroup.GB.Energy);
oGroup.GB.Homogeneity =  mean(iGroup.GB.Homogeneity);

end
