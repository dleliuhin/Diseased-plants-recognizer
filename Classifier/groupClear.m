function [ioGroup] = groupClear(ioGroup)
%% GROUPCLEAR 
% Summary of this function goes here. 
% 
% * Syntax 
% 
% [OUTPUTARGS] = GROUPCLEAR(INPUTARGS)
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
% * Date: 11/05/2019 16:46:43 
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

ioGroup.R.Contrast =      [];
ioGroup.R.Correlation =   [];
ioGroup.R.Energy =        [];
ioGroup.R.Homogeneity =   [];

ioGroup.G.Contrast =      [];
ioGroup.G.Correlation =   [];
ioGroup.G.Energy =        [];
ioGroup.G.Homogeneity =   [];

ioGroup.B.Contrast =      [];
ioGroup.B.Correlation =   [];
ioGroup.B.Energy =        [];
ioGroup.B.Homogeneity =   [];

ioGroup.RG.Contrast =     [];
ioGroup.RG.Correlation =  [];
ioGroup.RG.Energy =       [];
ioGroup.RG.Homogeneity =  [];

ioGroup.RB.Contrast =     [];
ioGroup.RB.Correlation =  [];
ioGroup.RB.Energy =       [];
ioGroup.RB.Homogeneity =  [];

ioGroup.GB.Contrast =     [];
ioGroup.GB.Correlation =  [];
ioGroup.GB.Energy =       [];
ioGroup.GB.Homogeneity =  [];

end
