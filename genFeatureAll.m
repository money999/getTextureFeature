

fname = {'D55','D56','D65','D68','D76','D78','D94','D95'};
vname = {'Contrast','Correlation','Energy','Entropy','Homogeneity'};
% clear
% for i = 1:length(fname)
%     folderPath = ['C:\ʵ������\8ͼ0�Ƚ�����4����\' fname{i}];
%     dirOutput=dir(fullfile(folderPath,'*.bmp'));
%     fileNames={dirOutput.name};
%     
%     for j = 1:length(fileNames)
%         imPath =  [folderPath '\' fileNames{j}];
%         feature.(fname{i})(j) = genGray(imPath);
%         %feature(i,j) = genGray(imPath);
%     end
% end

% save('C:\ʵ������\8ͼ0�Ƚ�����4����','feature');


%%%��featureֻ��ȡ��0�ȵĳ���%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% for i = 1:length(fname)
% stru = getfield(feature,
% fname{i});%��ȡ�ṹ��ָ���ֶε�ֵ,�����ˣ����д��feature.(fname{i});
% 
% tmp = cat(1,stru.Contrast);
% newStru.Contrast = tmp(:,1);%��һ�еľ���0�ȵ�
% 
% tmp = cat(1,stru.Correlation);
% newStru.Correlation = tmp(:,1);%��һ�еľ���0�ȵ�
% 
% tmp = cat(1,stru.Energy);
% newStru.Energy = tmp(:,1);%��һ�еľ���0�ȵ�
% 
% tmp = cat(1,stru.Entropy);
% newStru.Entropy = tmp(:,1);%��һ�еľ���0�ȵ�
% 
% tmp = cat(1,stru.Homogeneity);
% newStru.Homogeneity = tmp(:,1);%��һ�еľ���0�ȵ�
% 
% newFeature.(fname{i})=newStru;
% 
% end

%%%�ҵ�newFeatureÿ�����Ե����ֵ%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i = 1:length(vname)
    vmax.(vname{i}) = -100;
    vmin.(vname{i}) = 100;
end

for i = 1:length(fname)
    stru = getfield(newFeature, fname{i});
    for j = 1:length(vname)
        tmax = max(stru.(vname{j}));
        tmin = min(stru.(vname{j}));
        if tmax > vmax.(vname{j})
            vmax.(vname{j}) = tmax;
        end
        if tmin < vmin.(vname{j})
            vmin.(vname{j}) = tmin;
        end
    end
end




















