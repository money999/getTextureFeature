

function feature = genGray(path)
I=imread(path);
L=16; % L为量化的级数
glcm = graycomatrix(I, 'NumLevels',L,'Offset',[0 1;-1 1;-1 0;-1 -1]);
feature = graycoprops_my(glcm);
