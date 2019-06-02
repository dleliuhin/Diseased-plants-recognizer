function [decis] = calcTestResults(iMarks, iGroup)
%% CALCTESTRESULTS 
% Summary of this function goes here. 
% 
% * Syntax 
% 
% [DECIS] = CALCTESTRESULTS(IMARKS, IGROUP)
% 
% * Input 
% 
% -- iMarks - filed structure of statistic "averages" and indicators
%             including mean, std, median, mode, range, minRange, maxRange
%             according to plot values.
%             Every indicator contains R, G, B, RG, RB, GB components.
%             Every component contains Contrast, Correlation, Energy,
%             Homogeneity properties.
% 
% -- iGroup - filled structure for specific group of plant leaves 
%             by mean values.
% 
% * Output 
% 
% -- decis -  
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
% * Date: 15/05/2019 02:52:54 
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

fn = fieldnames(iGroup);
fn_group = fieldnames(iMarks);

decis = initializeTables();

for i = 1:length(fn)
    fn_stats = fieldnames(getfield(iGroup, fn{i}));
    
    for j = 1:length(fn_stats)
        test_val = iGroup.(fn{i}).(fn_stats{j});
        
        for k = 1:length(fn_group)            
            if  (~isempty(iMarks.(fn_group{k}).('minRanges').(fn{i}).(fn_stats{j})) && ...
                    ~isempty(test_val) && ...
                    ~isempty(iMarks.(fn_group{k}).('maxRanges').(fn{i}).(fn_stats{j})))
                
%                 if (~isnan(iMarks.(fn_group{k}).('minRanges').(fn{i}).(fn_stats{j})) && ...
%                 ~isnan(test_val) && ...
%                 ~isnan(iMarks.(fn_group{k}).('maxRanges').(fn{i}).(fn_stats{j})))
                
                if ((iMarks.(fn_group{k}).('minRanges').(fn{i}).(fn_stats{j}) < test_val) && ...
                        (test_val < iMarks.(fn_group{k}).('maxRanges').(fn{i}).(fn_stats{j})))
                    
                    decis.(fn_group{k}).in(end + 1) = 1;
                    %                     end
                else
                    decis.(fn_group{k}).in(end + 1) = 0;
                end
                
                decis.(fn_group{k}).d(end + 1) = abs(iMarks. ...
                    (fn_group{k}). ...
                    ('means'). ...
                    (fn{i}). ...
                    (fn_stats{j}) - ...
                    test_val);

            else
                decis.(fn_group{k}).in(end + 1) = 0;
                decis.(fn_group{k}).d(end + 1) = 1;
            end
            
        end
        
    end
end

fn_dec = fieldnames(decis);

for i = 1:length(decis.(fn_dec{i}).in)
    
    cur_row = initializeDecisSubTable();
    
    for j = 1:length(fn_dec)
        in_s = decis.(fn_dec{j}).in;
        d_s = decis.(fn_dec{j}).d; 
        
        cur_row.in(end + 1) = in_s(i);
        
        if (in_s(i) == 1)
            cur_row.d(end + 1) = d_s(i);
        else
            cur_row.d(end + 1) = 1;
        end
    end
    
    [min_val, min_idx] = min(cur_row.d);
    
    for j = 1:length(fn_dec)
        if (j ~= min_idx)
            decis.(fn_dec{j}).r(end + 1) = 0;
        else
            decis.(fn_dec{j}).r(end + 1) = 1;
        end
    end
    
    clear cur_row;
end

end
