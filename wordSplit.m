function words=wordSplit(text)
%-------------------------------------------------------------------------%
%Description:
%       To segment a text into words, disregarding the punctuation, line
%       feeds and spaces.
%Input:
%       text:       1*n char array. 
%
%Output:
%       words:      1*k cell contains k words in the text, each element
%                   records one word.
%Usage:
%       words=wordSplit(text)
%Author:
%       SUN Peng
%Institution:
%       The University of Hong Kong
%Last update:
%       Mar-27-2019
%-------------------------------------------------------------------------%

%Upper to Lower
idx=isstrprop(text,'Upper');
text(idx)=lower(text(idx));

%remove non-letter character except the space
idx_alpha=isstrprop(text,'alpha');
idx_space=(isstrprop(text,'wspace') & ~isstrprop(text,'cntrl'));
idx=~(idx_alpha | idx_space);
text(idx)=[];

% % remove punctuation
% punctIdx=isstrprop(text,'punct');
% text(punctIdx)=[];
% 
% % remove digit
% punctIdx=isstrprop(text,'digit');
% text(punctIdx)=[];

% % remove contral characters
% punctIdx=isstrprop(text,'cntrl');
% text(punctIdx)=[];

% segment text
words=split(text,' ');

% remove extra spaces
words(cellfun(@isempty,words))=[];

words(cellfun(@length,words)>14)=[];
words=words';




