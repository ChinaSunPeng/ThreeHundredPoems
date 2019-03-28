function orderlyCell=cellSort(cell,dim)
%-------------------------------------------------------------------------%
%Description:
%       sort a cell according to dim.
%Input:
%       cell:           m*n cell, each row stands for a record.
%
%       dim:            the base column for sorting.
%
%Output:
%       orderlyCell:    m*n cell with order.   
%
%Usage:
%       orderlyCell=cellSort(cell,dim)
%Author:
%       SUN Peng
%Institution:
%       The University of Hong Kong
%Last update:
%       Mar-26-2019
%-------------------------------------------------------------------------%

temp=cell(:,dim);

[num,idx]=sort(cell2mat(temp),'descend');

orderlyCell=cell(idx,:);