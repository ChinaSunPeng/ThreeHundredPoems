function tbl=mergeTwoFrequency(tbl1,tbl2)
%-------------------------------------------------------------------------%
%Description:
%       Merge the results of two tabulate funtions into one table.
%Input:
%       tbl1:       n*3 cell, records the classification, the frequency and
%                   the probability of the words. 
%       
%       tbl2:       m*3 cell, same as tbl1.
%Output:
%       tbl:        k*3 cell
%Usage:
%       tbl=mergeTwoFrequency(tbl1,tbl2)
%Author:
%       SUN Peng
%Institution:
%       The University of Hong Kong
%Last update:
%       Mar-27-2019
%-------------------------------------------------------------------------%

%calculate total word counts
count1=tbl1(:,2);
count2=tbl2(:,2);

wordCounts=sum(cell2mat(count1))+sum(cell2mat(count2));

%choose a long list as the reference list
if size(tbl1,1)>size(tbl2,1)
    tbl_r=tbl1;
    tbl_s=tbl2;
else
    tbl_r=tbl2;
    tbl_s=tbl1;
end

k=size(tbl_r,1); %initialize index to the size of reference list

%merge two tbl
for i=1:size(tbl_s,1)
    s=tbl_s{i,1};
    j=find(strcmp(tbl_r,s)); % find the index s in tbl_r
    if isempty(j)
       k=k+1;
       tbl_r(k,1:3)=tbl_s(i,1:3);
    else
       tbl_r{j,2}=tbl_r{j,2}+tbl_s{i,2};
    end
end

tbl=tbl_r;
prolity=cell2mat(tbl(:,2));
prolity=prolity/wordCounts*100;
prolity=mat2cell(prolity,ones(length(prolity),1));
tbl(:,3)=prolity;
       




