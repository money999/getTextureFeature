
%��������ĳ���ļ���������bmpͼƬ�Ĺ�����������ֵ
clear
folderPath = 'C:\picture\rot_re';
dirOutput=dir(fullfile(folderPath,'*.bmp'));
fileNames={dirOutput.name};


res = [];
for i = 1:length(fileNames)
    imPath =  [folderPath '\' fileNames{i}];
    feature(i) = genGray(imPath);
    res = [res; feature(i).Entropy];
    %featur(i).enSum = sum(feature(i).Entropy);
end
