function [ioF, ioEdges, ioNums] = incrementCurve(ioF, ...
                                          ioEdges, ...
                                          ioNums, ...
                                          iFitMean, ...
                                          iFitStd, ...
                                          iTypeApproximation, ...
                                          iCoefStd)
%% INCREMENTCURVE
% Increase fitted curve by fitMean based on ioEdges and ioNums using 
% fitted ioF with specific iTypeApproximation and coefStd.
% 
% * Syntax
%
% [IOF, IOEDGES, IONUMS] = INCREMENTCURVE(IOF,
%                                       IOEDGES, 
%                                       IONUMS,
%                                       IFITMEAN,
%                                       IFITSTD,
%                                       ITYPEAPPROXIMATION,
%                                       ICOEFSTD)
% * Input
%
% -- ioF - previous fitted curve on the basis of which will fit new
%          ioEdges and ioNum values.
%
% -- ioEdges - calculated midpoints of histogram column intervals for
%              vector of bin edges.
%
% -- ioNums - vector of bin counts.
%
% -- iFitMean - calculated mean value of ioEedges.
%
% -- iFitStd - calculated std value of ioEedges.
%
% -- iTypeApproximation - type of approximation.
%
% -- iCoefStd - deviation coefficient of distribution density function.
%
% * Output
%
% -- ioF - updated fitted curve based on ioEdges and ioNums values.
%
% -- ioEdges - incremented vector of calculated midpoints of 
%              histogram column intervals for vector of bin edges.
%
% -- ioNum - incremented vector of bin counts.
% 
% * Examples: 
% 
% Provide sample usage code here.
% 
% * See also: 
%
% INSERTATLEFT, INSERTATRIGHT
%
% * Authors: Dmitrii Leliuhin
% * Email: dleliuhin@mail.ru 
% * Date: 19/07/2018 04:16:29
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

% Vector of allowed standard deviations.
i = - iCoefStd : iCoefStd;

% Cicle for each i without zero value.
for i = i(i~=0)
    
    % Buferred standard deviation.
    bufStd = iFitMean + i * iFitStd;
    
    if (i < 0)
        % Condition under which increase the left branch of the function.
        indexes = find(bufStd > ioEdges);
        ioEdges = insertAtLeft(ioEdges, bufStd, min(indexes));
        indexes = find(bufStd == ioEdges, 1 );
        
        % Checking if vector is ioNums zero completely.
        % If true then increase the left branch of the function.
        if all(ioNums == 0)
            ioNums = insertAtLeft(ioNums, 0, 1);
        else
            ioNums = insertAtLeft(ioNums, ...
                                  ioF(ioEdges(indexes)), ...
                                  min(indexes));
        end
        
    elseif (i > 0)
        % Condition under which increase the right branch of the function.
        indexes = find(bufStd < ioEdges);
        ioEdges = insertAtRight(ioEdges, bufStd, max(indexes));
        indexes = find(bufStd == ioEdges, 1, 'last' );
        
        % Checking if vector is ioNums zero completely.
        % If true then increase the right branch of the function.
        if all(ioNums == 0)
            ioNums = insertAtRight(ioNums, 0, 1);
        else
            ioNums = insertAtRight(ioNums, ...
                                   ioF(ioEdges(indexes)), ...
                                   max(indexes));
        end
        
    end
    
    % Check min ioNums vector length.
    % If less then minPointValue then increment ioNums and ioEdges.
    if (length(ioEdges) < minPointValue)
        while (length(ioEdges) < minPointValue)
            ioEdges = vertcat(ioEdges(1), ioEdges);
            ioNums =  vertcat(ioNums(1), ioNums);
        end
    end
    
    % Assign new curve based on fitting ioEedges and 
    % ioNums by specific iTypeApproximation to ioF.
    ioF = fit(ioEdges, ioNums, iTypeApproximation, ...
              'Lower', [0 0 0], 'Upper', [1 1 1]);
    
    % Clear used variables for new iteration
    bufStd = []; indexes = [];
end

end