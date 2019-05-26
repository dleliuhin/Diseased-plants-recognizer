function oEdges = findInterBins(iEdges)
%% FINDINTERBINS
% Calculate the midpoints of histogram column intervals and 
% add them to output array.
% 
% * Syntax
%
% [OEDGES] = FINDINTERBINS(IEDGES)
%
% * Input:
%
% -- iEdges - vector of histogram column intervals .
%
% * Output:
%
% -- oEdges - vector of calculated midpoints of histogram column intervals.
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
% * Date: 17/07/2018 15:32:18
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

% Calculate length of input array iEdges.
edgesLength = length(iEdges) - 1;
% Create oEdges 1-by-edgesLength array of zeros
oEdges = zeros(1, edgesLength);

for i = 1:edgesLength
    oEdges(i) = (iEdges(i) + iEdges(i+1)) / 2;
end

end