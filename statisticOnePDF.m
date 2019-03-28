function [fail,tbl]=statisticOnePDF(path,fail)
%-------------------------------------------------------------------------%
%Description:
%       statistic the word frequency in one pdf
%Input:
%       path:       The path of the pdf file.
%
%Output:
%       tbl:        m*3 cell, records frequcy of each word.
%
%       fail:       number, record the failed reading counts.
%Usage:
%       tbl=statisticOnePDF(path)
%Author:
%       SUN Peng
%Institution:
%       The University of Hong Kong
%Last update:
%       Mar-26-2019
%-------------------------------------------------------------------------%
tbl={'SunPeng',0,0};

try
    text = pdfRead(path);
catch
    text={[]};
    ['can not open',path(2:end)]
    fail=fail+1;
    return
end


try
    for i=1:length(text)
        words=wordSplit(text{i});
        tbl_t=tabulate(words);
        tbl=mergeTwoFrequency(tbl,tbl_t);
        tbl=cellSort(tbl,2);
    end
catch
    ['read no text in',path(2:end)]
    fail=fail+1;
    return
end

%delete repulicte words
