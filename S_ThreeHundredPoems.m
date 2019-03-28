%S_ThreeHundredPoems
%-------------------------------------------------------------------------%
%Description:
%       Statistic the words frequency of all papers 
%
%Author:
%       SUN Peng
%Institution:
%       The University of Hong Kong
%Last update:
%       Mar-26-2019
%-------------------------------------------------------------------------%
javaaddpath('./pdfRead/iText-4.2.0-com.itextpdf.jar');

fail=0;

fileFolder   = './papers/';
outputFolder = './frequency/';

dirInput=dir(fullfile(fileFolder,'*.pdf'));

fileList={dirInput.name};

tbl={'SunPeng',0,0};

h=waitbar(0,'please wait');

for i=1:length(fileList)
    fileName=[fileFolder,fileList{i}];
    [fail,tbl_t]=statisticOnePDF(fileName,fail);
    outputName=[outputFolder,fileList{i}(1:end-4)];
    save(outputName,'tbl_t');
    tbl=mergeTwoFrequency(tbl_t,tbl);
    message=['please wait ',num2str(i),' / ',num2str(length(fileList))];
    waitbar((i/length(fileList)),h,message);
end
    tbl=cellSort(tbl,2);
    outputName=[outputFolder,'FinalFrequency'];
    save(outputName,'tbl');
    writeCell2Txt(tbl,[outputName,'.txt']);
    delete(h);
    
   

    