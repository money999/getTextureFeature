function reimg = imRec2cir(path)

img=imread(path);
d=size(img);
img=double(img);
xstep=2/(d(1)-1); % ȡ����
ystep=2/(d(2)-1);
[x,y]=meshgrid(-1:xstep:1,-1:ystep:1); % ������
circle= x.^2 + y.^2;
inside=find(circle<=1); % ��ȡ����circle<=1����
reimg  = zeros(d);
reimg(inside) = img(inside);

% figure(1);
% imshow(reimg,[]);
% figure(2);
% imshow(img,[]);