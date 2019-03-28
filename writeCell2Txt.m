function writeCell2Txt(cell,path)
%-------------------------------------------------------------------------%
%Description:
%       write a cell to a txt file
%Input:
%       cell:           m*n cell, each row stands for a record.
%
%       path:           the path of the output file
%
%Output:
%
%Usage:
%       writeCell2Txt(cell,path)
%Author:
%       SUN Peng
%Institution:
%       The University of Hong Kong
%Last update:
%       Mar-26-2019
%-------------------------------------------------------------------------%

fid=fopen(path,'w');

for i=1:size(cell,1);
    fprintf(fid,'%24s   %6d   %4f \r\n ',cell{i,:});
end

fclose(fid);