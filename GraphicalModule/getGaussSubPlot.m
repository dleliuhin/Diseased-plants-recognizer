function [ioPlotValues] = getGaussSubPlot(ioPlotValues, ...
                                          iLeaves, ...
                                          iComponentName, ...
                                          iPropertyName, ...
                                          iTypeApproximation, ...
                                          iBinsValue, ...
                                          iCoefStd)
%% GETGAUSSSUBPLOT
% Plot comparative graphs of Gauss approximated histograms in one plot form  
% for healthy plants and all types of diseases.
%
% * Syntax
%
%   [IOPLOTVALUES] = GETGAUSSSUBPLOT(IOPLOTVALUES, 
%                                    ILEAVES,
%                                    ICOMPONENTNAME,
%                                    IPROPERTYNAME,
%                                    ITYPEAPPROXIMATION,
%                                    IBINSVALUE,
%                                    ICOEFSTD)
%
% * Input
%
% -- ioPlotValues - input structure of filled values for plotting
%                   graphics including component properties for each
%                   plant diseasion group number.
%
% -- iLeaves - input structure with healthy and
%              diseased parts of a plants.
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
%                   graphics including component properties for each
%                   plant diseasion group number.
% 
% * Examples:
%
% Provide sample usage code here.
% 
% * See also: 
%   
% PLOTGAUSS
%
% * Author: *Dmitrii Leliuhin* 
% * Email: dleliuhin@mail.ru
% * Date: 17/07/2018 15:31:42
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

hold on;

ioPlotValues = plotGauss(ioPlotValues, ...
                         iLeaves, ...
                         'b', ...
                         'h', ...
                         iComponentName, ...
                         iPropertyName, ...
                         iTypeApproximation, ...
                         iBinsValue, ...
                         iCoefStd);

ioPlotValues = plotGauss(ioPlotValues, ...
                         iLeaves, ...
                         'r', ...
                         'nh1', ...
                         iComponentName, ...
                         iPropertyName, ...
                         iTypeApproximation, ...
                         iBinsValue, ...
                         iCoefStd);

hold off;

end