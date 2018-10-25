function [ioPlotValues] = plotGauss(ioPlotValues, ...
                                    iLeaves, ...
                                    iColor, ...
                                    iLeavesCode, ...
                                    iComponentName, ...
                                    iPropertyName, ...
                                    iTypeApproximation, ...
                                    iBinsValue, ...
                                    iCoefStd)
%% PLOTGAUSS 
% Plot graph of Gauss approximated histogram for plants group type.
% 
% * Syntax 
% 
%	[IOPLOTVALUES] = PLOTGAUSS(IOPLOTVALUES,
%                              ILEAVES,
%                              ICOLOR,
%                              ILEAVESCODE, 
%                              ICOMPONENTNAME, 
%                              IPROPERTYNAME,
%                              ITYPEAPPROXIMATION,
%                              IBINSVALUE,
%                              ICOEFSTD)
% 
% * Input 
% 
% -- ioPlotValues - input structure of filled values for plotting
%                   graphic including component properties for specific
%                   plant diseasion group number.
% 
% -- iLeaves - input structure with healthy and
%              diseased parts of a plants.
% 
% -- iColor - color of the plotted line and points.
% 
% -- iLeavesCode - code of plantic diseases group.
% 
% -- iComponentName - name of the component (R, G, B, RG, RB, GB) which
%                     must be plotted.
% 
% -- iPropertyName - name of the component property. Can be:
%                    Contrast, Correlation, Energy, Homogeneity.
% 
% -- iTypeApproximation - type of approximation.
% 
% -- iBinsValue - number of histogram columns.
% 
% -- iCoefStd - deviation coefficient of distribution density function.
%
% * Output 
% 
% -- ioPlotValues - output structure of filled values of plotted
%                   graphic including component properties for specific
%                   plant diseasion group number.
% 
% * Examples: 
% 
% Provide sample usage code here
% 
% * See also: 
% 
% FINDINTERBINS, FITBYMEANSTD
% 
% * Author: Dmitrii Leliuhin 
% * Email: dleliuhin@mail.ru 
% * Date: 25/10/2018 02:06:17 
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

% Finding the count in each bin, as well as the bin edges.
[nums, edges] = histcounts(iLeaves. ...
                           (iLeavesCode). ...
                            (iComponentName). ...
                             (iPropertyName), ...
                           iBinsValue, ...
                           'Normalization', ...
                           'probability');

% Adding and calculating the midpoints of histogram column intervals for
% vector of bin edges.
edges = findInterBins(edges);
% Median filtering and upturning the vector of bin counts.
nums = medfilt1(nums'); 
% Upturning the vector of bin edges.
edges = edges';
% Creating the fit to the data in bin edges and bin counts with the model 
% specified by iTypeApproximation.
f = fit(edges, nums, iTypeApproximation);
% Fitting curve for conversion to a distribution similar as 
% the Gaussian distribution.
[f, edges, nums] = fitByMeanStd(f, ...
                                edges, ...
                                nums, ...
                                iTypeApproximation, ...
                                iCoefStd);
plot(f, strcat(iColor, '-'), edges, nums, strcat(iColor, '.'));

title(strcat('Gaussian_', iComponentName, '.', iPropertyName), ...
      'fontsize', 10);
xlabel('x');
ylabel('f(x)', 'rotation', 1);
text(mean(edges), max(nums), iLeavesCode, 'fontsize', 13);

% Add bin edges and counts to ioPlotValues structure.
ioPlotValues.(iLeavesCode).(iComponentName).(iPropertyName).nums = nums;
ioPlotValues.(iLeavesCode).(iComponentName).(iPropertyName).edges = edges;

end
