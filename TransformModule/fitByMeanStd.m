function [ioF, ioEedges, ioNums] = fitByMeanStd(ioF, ...
                                        ioEedges, ...
                                        ioNums, ...
                                        iTypeApproximation, ...
                                        iCoefStd)
%% FITBYMEANSTD
% Fit curve by mean based on ioEdges and ioNums using fitted ioF with
% specific type of approximation and STD coefficient value.
% 
% * Syntax
%
% [IOF, IOEDGES, IONUMS] = FITBYMEANSTD(IOF,
%                                       IOEDGES, 
%                                       IONUMS,
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
% -- iTypeApproximation - type of approximation.
%
% -- iCoefStd - deviation coefficient of distribution density function.
%
% * Output
%
% -- ioF - new fitted curve based on ioEdges and ioNums values.
%
% -- ioEdges - updated vector of calculated midpoints of 
%              histogram column intervals for vector of bin edges.
%
% -- ioNums - updated vector of bin counts.
% 
% * Examples: 
% 
% Provide sample usage code here.
% 
% * See also: 
%
% ALIGNGRAPHFUNC, INCREMENTCURVE
%
% * Authors: Dmitrii Leliuhin
% * Email: dleliuhin@mail.ru 
% * Date: 19/07/2018 04:32:20
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

% Assign calculated mean value of ioEedges to fitmean variable.
fitMean = mean(ioEedges);
% Assign calculated std value of ioEedges to fitstd variable.
fitStd = std(ioEedges);

% Adding intermediate points for min to max of ioEedges accurate to 0.001.
xx = min(ioEedges):0.001:max(ioEedges);
% Fit xx value range and assign to yy.
yy = ioF(xx);

% Find mean index of the fuction according to vector yy, find value with
% specific index and assign it to fitmean.
fitMean = min(xx(yy == max(yy)));
% Assign calculated std value of xx to fitstd variable.
fitStd = std(xx);
% Assign updated vector xx to ioEedges.
ioEedges = xx;

% Check the values in ioEedges not beyond conditions and 
% delete them from vector. Assign old vector to new upturned.
ioEedges = ioEedges(ioEedges ...
                    >= (fitMean - iCoefStd * fitStd & ioEedges) ...
                    <= (fitMean + iCoefStd * fitStd) ...
                    )';
% Fitting vector ioEedges and assigning result to ioNum.          
ioNums = ioF(ioEedges);

% Alignment of function plotting points.
[ioEedges, ioNums] = alignGraphFunc(ioEedges, ioNums);
% Assign new curve based on fitting ioEedges and 
% ioNums by specific iTypeApproximation to ioF.
ioF = fit(ioEedges, ioNums, iTypeApproximation);

% Adding missing elements to vectors ioEedges and ioNums and 
% fit them by ioF, specific iTypeApproximation,
% length determing iCoefStd, fitMean and fitStd.
[ioF, ioEedges, ioNums] = incrementCurve(ioF, ...
                                         ioEedges, ...
                                         ioNums, ...
                                         fitMean, ...
                                         fitStd, ...
                                         iTypeApproximation, ...
                                         iCoefStd);

% Assign new curve based on fitting ioEedges and 
% ioNums by specific iTypeApproximation to ioF.
ioF = fit(ioEedges, ioNums, iTypeApproximation);

end