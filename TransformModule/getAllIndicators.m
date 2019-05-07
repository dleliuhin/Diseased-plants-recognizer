function [ioGroup] = getAllIndicators(ioGroup, iPlotValues)
%% GETALLINDICATORS 
% Summary of this function goes here. 
% 
% * Syntax 
% 
% [OUTPUTARGS] = GETALLINDICATORS(INPUTARGS)
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
% * Date: 07/05/2019 18:07:02 
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

ioGroup.means =       getMeanIndicator(ioGroup.means, iPlotValues);

ioGroup.stds =        getStdIndicator(ioGroup.stds, iPlotValues);

ioGroup.medianes =    getMedianeIndicator(ioGroup.medianes, iPlotValues);

ioGroup.modes =       getModeIndicator(ioGroup.modes, iPlotValues);

ioGroup.ranges =      getRangeIndicator(ioGroup.ranges, iPlotValues);

ioGroup.minRanges =   getMinRangeIndicator(ioGroup.minRanges, iPlotValues);

ioGroup.maxRanges =   getMaxRangeIndicator(ioGroup.maxRanges, iPlotValues);

end
