function [ioGroupTable] = incrementGroupTable(ioGroupTable, iTableColumns)
%% INCREMENTGROUPTABLE 
% Summary of this function goes here. 
% 
% * Syntax 
% 
%	[OUTPUTARGS] = INCREMENTGROUPTABLE(INPUTARGS)
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
% * Date: 17/11/2018 00:56:12 
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

ioGroupTable.imageNames = [ioGroupTable.imageNames iTableColumns.imageNames];
ioGroupTable.Attribute = (iTableColumns.Attribute)';
ioGroupTable.Component = (iTableColumns.Component)';
ioGroupTable.Healthy = (iTableColumns.Healthy)';
ioGroupTable.delta1 = (iTableColumns.delta1)';
ioGroupTable.Test = (iTableColumns.Test)';
ioGroupTable.delta2 = (iTableColumns.delta2)';
ioGroupTable.Ill = (iTableColumns.Ill)';
ioGroupTable.Result = (iTableColumns.Result)';

end
