function [ioIndicator] = getModeIndicator(ioIndicator, iPlotValuesIndicator)
%% GETMODEINDICATOR 
% Assign mode of iPlotValuesIndicator to ioIndicator.
% 
% * Syntax 
% 
%	[IOINDICATOR] = GETMODEINDICATOR(IOINDICATOR, IPLOTVALUESINDICATOR)
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
% -- ioIndicator - structure which equal the mode of iPlotValuesIndicator.
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
% * Date: 12/10/2018 00:58:35 
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

ioIndicator.R.Contrast =      mode(iPlotValuesIndicator.R.Contrast.edges);
ioIndicator.R.Correlation =   mode(iPlotValuesIndicator.R.Correlation.edges);
ioIndicator.R.Energy =        mode(iPlotValuesIndicator.R.Energy.edges);
ioIndicator.R.Homogeneity =   mode(iPlotValuesIndicator.R.Homogeneity.edges);

ioIndicator.G.Contrast =      mode(iPlotValuesIndicator.G.Contrast.edges);
ioIndicator.G.Correlation =   mode(iPlotValuesIndicator.G.Correlation.edges);
ioIndicator.G.Energy =        mode(iPlotValuesIndicator.G.Energy.edges);
ioIndicator.G.Homogeneity =   mode(iPlotValuesIndicator.G.Homogeneity.edges);

ioIndicator.B.Contrast =      mode(iPlotValuesIndicator.B.Contrast.edges);
ioIndicator.B.Correlation =   mode(iPlotValuesIndicator.B.Correlation.edges);
ioIndicator.B.Energy =        mode(iPlotValuesIndicator.B.Energy.edges);
ioIndicator.B.Homogeneity =   mode(iPlotValuesIndicator.B.Homogeneity.edges);

ioIndicator.RG.Contrast =     mode(iPlotValuesIndicator.RG.Contrast.edges);
ioIndicator.RG.Correlation =  mode(iPlotValuesIndicator.RG.Correlation.edges);
ioIndicator.RG.Energy =       mode(iPlotValuesIndicator.RG.Energy.edges);
ioIndicator.RG.Homogeneity =  mode(iPlotValuesIndicator.RG.Homogeneity.edges);

ioIndicator.RB.Contrast =     mode(iPlotValuesIndicator.RB.Contrast.edges);
ioIndicator.RB.Correlation =  mode(iPlotValuesIndicator.RB.Correlation.edges);
ioIndicator.RB.Energy =       mode(iPlotValuesIndicator.RB.Energy.edges);
ioIndicator.RB.Homogeneity =  mode(iPlotValuesIndicator.RB.Homogeneity.edges);

ioIndicator.GB.Contrast =     mode(iPlotValuesIndicator.GB.Contrast.edges);
ioIndicator.GB.Correlation =  mode(iPlotValuesIndicator.GB.Correlation.edges);
ioIndicator.GB.Energy =       mode(iPlotValuesIndicator.GB.Energy.edges);
ioIndicator.GB.Homogeneity =  mode(iPlotValuesIndicator.GB.Homogeneity.edges);

end
