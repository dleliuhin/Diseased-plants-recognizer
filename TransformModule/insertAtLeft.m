function [oVector] = insertAtLeft(iVector, iValue, iIndex)
%% INSERTATLEFT
% Increase the left branch of the function by adding iValue with 
% specific iIndex.
% 
% * Syntax
%
% [OVECTOR] = INSERTATLEFT(IVECTOR, IVALUE, IINDEX)
%
% * Input
%
% -- iVector - vector in which need to insert iValue at left of the vector 
%              with specific iIndex.
%
% -- iValue - value which need to insert at iVector.
%
% -- iIndex - the index of the vector by which need to insert iValue.
%
% * Output
%
% -- oVector - vector with inserted iValue at left of the vector by 
%              specific iIndex.
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
% * Date: 19/07/2018 03:48:40
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

if isempty(iIndex)
    oVector = vertcat(iValue, iVector);
else
    oVector = vertcat(iVector(1:iIndex - 1), iValue, iVector(iIndex:end));
end
    
end