function [oAverValue] = getStdAverValue(iMarks)
%% GETSTDAVERVALUE 
% Summary of this function goes here. 
% 
% * Syntax 
% 
% [OUTPUTARGS] = GETSTDAVERVALUE(INPUTARGS)
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
% * Date: 08/05/2019 00:34:17 
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

all_stds = [];

fn = fieldnames(iMarks);

for i = 1:numel(fn)
    fn_group = fieldnames(getfield(iMarks, fn{i}));
    
    fn_group_std = fieldnames(getfield(iMarks, fn{i}, 'stds'));
        
    for j = 1:numel(fn_group_std)
        fn_group_comp = getfield(iMarks, fn{i}, 'stds', fn_group_std{j});
        
        all_stds(end+1) = fn_group_comp.Contrast;
        all_stds(end+1) = fn_group_comp.Correlation;
        all_stds(end+1) = fn_group_comp.Homogeneity;
        all_stds(end+1) = fn_group_comp.Energy;
    end
end

oAverValue = ceil(max(all_stds) .* 10);

end
