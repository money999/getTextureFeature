

fname = {'D55','D56','D65','D68','D76','D78','D94','D95'};
vname = {'Contrast','Correlation','Energy','Entropy','Homogeneity'};
% clear
% for i = 1:length(fname)
%     folderPath = ['C:\实验数据\8图0度仅共生4特征\' fname{i}];
%     dirOutput=dir(fullfile(folderPath,'*.bmp'));
%     fileNames={dirOutput.name};
%     
%     for j = 1:length(fileNames)
%         imPath =  [folderPath '\' fileNames{j}];
%         feature.(fname{i})(j) = genGray(imPath);
%         %feature(i,j) = genGray(imPath);
%     end
% end

% save('C:\实验数据\8图0度仅共生4特征','feature');


%%%把feature只提取出0度的出来%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% for i = 1:length(fname)
% stru = getfield(feature,
% fname{i});%获取结构中指定字段的值,过期了，最好写成feature.(fname{i});
% 
% tmp = cat(1,stru.Contrast);
% newStru.Contrast = tmp(:,1);%第一列的就是0度的
% 
% tmp = cat(1,stru.Correlation);
% newStru.Correlation = tmp(:,1);%第一列的就是0度的
% 
% tmp = cat(1,stru.Energy);
% newStru.Energy = tmp(:,1);%第一列的就是0度的
% 
% tmp = cat(1,stru.Entropy);
% newStru.Entropy = tmp(:,1);%第一列的就是0度的
% 
% tmp = cat(1,stru.Homogeneity);
% newStru.Homogeneity = tmp(:,1);%第一列的就是0度的
% 
% newFeature.(fname{i})=newStru;
% 
% end

%%%找到newFeature每个属性的最大值%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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




















