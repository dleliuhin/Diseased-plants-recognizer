function [ioPlotGaussValues] = getGaussPlot(ioPlotGaussValues, ...
                                            iLeaves, ...
                                            iComponentName, ...
                                            iTypeApproximation, ...
                                            iBinsValue, ...
                                            iCoefStd)
%% GETGAUSSPLOT 
% Plot comparative graphs of Gauss approximated histograms in one plot form  
% for healthy plants and all types of diseases for each component property.
% 
% * Syntax 
% 
%	[IOPLOTGAUSSVALUES] = GETGAUSSPLOT(IOPLOTGAUSSVALUES,
%                                      ILEAVES,
%                                      ICOMPONENTNAME,
%                                      ITYPEAPPROXIMATION,
%                                      IBINSVALUE,
%                                      ICOEFSTD)
% 
% * Input 
% 
% -- ioPlotGaussValues - input structure of filled values for plotting
%                        graphics including component properties.
%                        Every property contains edges (x) and nums (y) 
%                        plotted values.
% 
% -- iLeaves - input structure with healthy and
%              diseased parts of a plants.
% 
% -- iComponentName - name of the component (R, G, B, RG, RB, GB) which
%                     must be plotted.
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
%                        graphics including component properties.
%                        Every property contains edges (x) and nums (y) 
%                        plotted values.
% 
% * Examples: 
% 
% Provide sample usage code here
% 
% * See also: 
% 
% GETGAUSSSUBPLOT
% 
% * Author: Dmitrii Leliuhin 
% * Email: dleliuhin@mail.ru 
% * Date: 25/10/2018 10:05:51 
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

figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
ioPlotGaussValues = getGaussSubPlot(ioPlotGaussValues, ...
                                    iLeaves, ...
                                    iComponentName, ...
                                    'Contrast', ...
                                    iTypeApproximation, ...
                                    iBinsValue, ...
                                    iCoefStd);

subplot(2,2,2);
ioPlotGaussValues = getGaussSubPlot(ioPlotGaussValues, ...
                                    iLeaves, ...
                                    iComponentName, ...
                                    'Correlation', ...
                                    iTypeApproximation, ...
                                    iBinsValue, ...
                                    iCoefStd);
                             
subplot(2,2,3);
ioPlotGaussValues = getGaussSubPlot(ioPlotGaussValues, ...
                                 iLeaves, ...
                                 iComponentName, ...
                                 'Energy', ...
                                 iTypeApproximation, ...
                                 iBinsValue, ...
                                 iCoefStd);

subplot(2,2,4);
ioPlotGaussValues = getGaussSubPlot(ioPlotGaussValues, ...
                                 iLeaves, ...
                                 iComponentName, ...
                                 'Homogeneity', ...
                                 iTypeApproximation, ...
                                 iBinsValue, ...
                                 iCoefStd);

set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf, strcat('Result/graphGaussResults/', iComponentName, '.jpg'));
saveas(gcf, strcat('Result/graphGaussResults/', iComponentName, '.fig'));

end
