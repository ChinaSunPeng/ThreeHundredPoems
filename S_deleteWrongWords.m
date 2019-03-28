%S_deleteWrongWords

h = actxserver('word.application');
h.Document.Add;
for i=size(lbt,1)
    isCorrect = h.CheckSpelling(tbl{i,1});
    idx(i)=isCorrect;
end
idx=logical(idx);
idx=~idx;
tbl(idx,:)=[];
h.Quit