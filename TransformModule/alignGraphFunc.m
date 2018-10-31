function [ioEdges, ioNums] = alignGraphFunc(ioEdges, ioNums)
%% ALIGNGRAPHFUNC
% Align values of graphical function plotting points.
% 
% * Syntax
%
% [IOEDGES, IONUMS] = ALIGNGRAPHFUNC(IOEDGES, IONUMS)
%
% * Input
%
% -- ioEdges - calculated midpoints of histogram column intervals for
%              vector of bin edges.
%
% -- ioNums - vector of bin counts.
%
% * Output
%
% -- ioEdges - aligned vector of calculated midpoints of 
%              histogram column intervals for vector of bin edges.
%
% -- ioNums - aligned vector of bin counts.
% 
% * Examples: 
% 
% Provide sample usage code here.
% 
% * See also: 
%
% No relations.
%           
% * Authors: Dmitrii Leliuhin
% * Email: dleliuhin@mail.ru 
% * Date: 03/10/2018 20:16:10
% * Version: 1.0 $ 
% * Requirements: PCWIN64, MatLab R2016a  
% 
% * Warning: 
% 
% # No Warnings.
% 
% * TODO: 
% 
% # TO DO list.
% 

%% Code 

% Minimum number of points to fit gauss approximaton.
minPointValue = 3;
% Find index of max value in vector ioNums.
maxNumIndex = floor(mean(find(ioNums == max(ioNums))));
% Assign length of ioNums to numLength.
numLength = length(ioNums);

if ((numLength - maxNumIndex) >= maxNumIndex)
    
    % Vertical concatenation reverse the vector arg1 and arg2.
    ioNums = vertcat(wrev(ioNums(maxNumIndex + 1:end)), ...
                    ioNums(maxNumIndex:end));
    ioEdges = vertcat(ioEdges(maxNumIndex:end));
    bufEdges = wrev(ioEdges(1) - abs(ioEdges(2:end) - ioEdges(1)));
    ioEdges = vertcat(bufEdges, ioEdges);
    
    % Check min unique ioNum vector length.
    % If less then minPointValue then increment ioNum.
    if (length(unique(ioNums)) < minPointValue)
        for i=1:minPointValue
            ioNums = vertcat(ioNums, ioNums(maxNumIndex));
            ioEdges = vertcat(ioEdges, ioEdges(maxNumIndex));
        end
    end

else
    % Vertical concatenation arg1 and reverse the vector arg2.
    ioNums = vertcat(ioNums(1:maxNumIndex), ...
                    wrev(ioNums(1:maxNumIndex-1)));
    ioEdges = vertcat(ioEdges(1:maxNumIndex));
    bufEdges = ioEdges(end) + abs(ioEdges(end) - ioEdges(1:end - 1));
    ioEdges = vertcat(ioEdges, wrev(bufEdges));

    % Check min unique ioNums vector length.
    % If less then minPointValue then increment ioNum.
    if (length(unique(ioNums)) < minPointValue )
        for i=1:minPointValue
            ioNums = vertcat(ioNums(maxNumIndex),ioNums);
            ioEdges = vertcat(ioEdges(maxNumIndex),ioEdges);
        end
    end
end

end
