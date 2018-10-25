function [ioPlotGaussValues] = graphGaussSubModule(ioPlotGaussValues, ...
                                                   iLeaves, ...
                                                   iTypeApproximation, ...
                                                   iBinsValue, ...
                                                   iCoefStd)
%% GRAPHGAUSSSUBMODULE
% Plot comparative graphs in the form of Gauss approximated histograms for 
% healthy plants and all types of diseases for each component.
%
% * Syntax
%
%   [IOPLOTGAUSSVALUES] = GRAPHGAUSSSUBMODULE(IOPLOTGAUSSVALUES,
%                                             ILEAVES,
%                                             ITYPEAPPROXIMATION,
%                                             IBINSVALUE,
%                                             ICOEFSTD)
%
% * Input
%
% -- ioPlotGaussValues - input structure of values for plotting graphics
%                        including R, G, B, RG, RB, GB components.
%                        Every component contains Contrast, Correlation, 
%                        Energy, Homogeneity properties.
%                        Every property contains edges (x) and 
%                        nums (y) plotted values.
%
% -- iLeaves - input structure with healthy and
%              diseased parts of a plants.
%
% -- iTypeApproximation - type of approximation.
%
%  -- iBinsValue - number of histogram columns.
%
%  -- iCoefStd - deviation coefficient of distribution density function.
%
% * Output
%
% -- ioPlotGaussValues - output structure of filled values of plotted
%                        graphics including R, G, B, RG, RB, GB components.
%                        Every component contains Contrast, Correlation, 
%                        Energy, Homogeneity properties.
%                        Every property contains edges (x) and nums (y) 
%                        plotted values.
% 
% * Examples:
%
% Provide sample usage code here.
% 
% * See also: 
%   
% GETGAUSSSUBPLOT
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

%% Gaussians for R component

ioPlotGaussValues = getGaussPlot(ioPlotGaussValues, ...
                                 iLeaves, ...
                                 'R', ...
                                 iTypeApproximation, ...
                                 iBinsValue, ...
                                 iCoefStd);

%% Gaussians for G component

ioPlotGaussValues = getGaussPlot(ioPlotGaussValues, ...
                                 iLeaves, ...
                                 'G', ...
                                 iTypeApproximation, ...
                                 iBinsValue, ...
                                 iCoefStd);

%% Gaussians for B component

ioPlotGaussValues = getGaussPlot(ioPlotGaussValues, ...
                                 iLeaves, ...
                                 'B', ...
                                 iTypeApproximation, ...
                                 iBinsValue, ...
                                 iCoefStd);

%% Gaussians for RG component

ioPlotGaussValues = getGaussPlot(ioPlotGaussValues, ...
                                 iLeaves, ...
                                 'RG', ...
                                 iTypeApproximation, ...
                                 iBinsValue, ...
                                 iCoefStd);

%% Gaussians for RB component

ioPlotGaussValues = getGaussPlot(ioPlotGaussValues, ...
                                 iLeaves, ...
                                 'RB', ...
                                 iTypeApproximation, ...
                                 iBinsValue, ...
                                 iCoefStd);

%% Gaussians for GB component

ioPlotGaussValues = getGaussPlot(ioPlotGaussValues, ...
                                 iLeaves, ...
                                 'GB', ...
                                 iTypeApproximation, ...
                                 iBinsValue, ...
                                 iCoefStd);

end