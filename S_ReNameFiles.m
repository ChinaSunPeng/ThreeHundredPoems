%S_RenNameFiles

fileFolder   = './papers/';

dirInput=dir(fullfile(fileFolder,'*.pdf'));

fileList={dirInput.name};

%rename files
for i=1:length(fileList)
oldName=[fileFolder,fileList{i}];
newName=[fileFolder,'Paper',num2str(i),'.pdf'];
command = ['mv',' "',oldName,'" "',newName,'"'];
system(command);
end