function [ioIndicator] = getMeanIndicator(ioIndicator, iPlotValuesIndicator)
%% GETMEANINDICATOR 
% Assign mean of iPlotValuesIndicator to ioIndicator.
% 
% * Syntax 
% 
%	[IOINDICATOR] = GETMEANINDICATOR(IOINDICATOR, IPLOTVALUESINDICATOR)
% 
% * Input 
% 
% -- ioIndicator - structure which need to set up a 
%                  new value - iPlotValuesIndicator.
%
% -- iPlotValuesIndicator - structure of values for plotting graphics
%                           including R, G, B, RG, RB, GB components.
%                           Every component contains Contrast, 
%                           Correlation, Energy, Homogeneity properties.
% 
% * Output 
% 
% -- ioIndicator - structure which equal the mean of iPlotValuesIndicator.
% 
% * Examples: 
% 
% Provide sample usage code here
% 
% * See also: 
% 
% No relations.
% 
% * Author: Dmitrii Leliuhin 
% * Email: dleliuhin@mail.ru 
% * Date: 12/10/2018 00:57:22 
% * Version: 1.0 $ 
% * Requirements: PCWIN64, MatLab R2016a 
% 
% * Warning: 
% 
% # No Warnings. 
% 
% * TODO: 
% 
% # TODO list. 
% 

%% Code 

ioIndicator.R.Contrast =      mean(iPlotValuesIndicator.R.Contrast.edges);
ioIndicator.R.Correlation =   mean(iPlotValuesIndicator.R.Correlation.edges);
ioIndicator.R.Energy =        mean(iPlotValuesIndicator.R.Energy.edges);
ioIndicator.R.Homogeneity =   mean(iPlotValuesIndicator.R.Homogeneity.edges);

ioIndicator.G.Contrast =      mean(iPlotValuesIndicator.G.Contrast.edges);
ioIndicator.G.Correlation =   mean(iPlotValuesIndicator.G.Correlation.edges);
ioIndicator.G.Energy =        mean(iPlotValuesIndicator.G.Energy.edges);
ioIndicator.G.Homogeneity =   mean(iPlotValuesIndicator.G.Homogeneity.edges);

ioIndicator.B.Contrast =      mean(iPlotValuesIndicator.B.Contrast.edges);
ioIndicator.B.Correlation =   mean(iPlotValuesIndicator.B.Correlation.edges);
ioIndicator.B.Energy =        mean(iPlotValuesIndicator.B.Energy.edges);
ioIndicator.B.Homogeneity =   mean(iPlotValuesIndicator.B.Homogeneity.edges);

ioIndicator.RG.Contrast =     mean(iPlotValuesIndicator.RG.Contrast.edges);
ioIndicator.RG.Correlation =  mean(iPlotValuesIndicator.RG.Correlation.edges);
ioIndicator.RG.Energy =       mean(iPlotValuesIndicator.RG.Energy.edges);
ioIndicator.RG.Homogeneity =  mean(iPlotValuesIndicator.RG.Homogeneity.edges);

ioIndicator.RB.Contrast =     mean(iPlotValuesIndicator.RB.Contrast.edges);
ioIndicator.RB.Correlation =  mean(iPlotValuesIndicator.RB.Correlation.edges);
ioIndicator.RB.Energy =       mean(iPlotValuesIndicator.RB.Energy.edges);
ioIndicator.RB.Homogeneity =  mean(iPlotValuesIndicator.RB.Homogeneity.edges);

ioIndicator.GB.Contrast =     mean(iPlotValuesIndicator.GB.Contrast.edges);
ioIndicator.GB.Correlation =  mean(iPlotValuesIndicator.GB.Correlation.edges);
ioIndicator.GB.Energy =       mean(iPlotValuesIndicator.GB.Energy.edges);
ioIndicator.GB.Homogeneity =  mean(iPlotValuesIndicator.GB.Homogeneity.edges);

end
