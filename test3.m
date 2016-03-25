I=imread('D94.gif');
[M,N]=size(I);
L=16; % L为量化的级数

%%MTALBA自带函数求解
P_0=graycomatrix(I, 'NumLevels',L,'Offset',[0 1]);    %0°  水平方向
% P_45=graycomatrix(I, 'NumLevels',L,'Offset',[-1 1]);
% P_90=graycomatrix(I, 'NumLevels',L,'Offset',[-1 0]);
% P_135=graycomatrix(I, 'NumLevels',L,'Offset',[-1 -1]);


a= graycoprops(P_0);
% b= graycoprops(P_45);
% c= graycoprops(P_90);
% d= graycoprops(P_135);


% H = zeros(1,4);
% I = H;
% Ux = H;      Uy = H;
% deltaX= H;  deltaY = H;
% C =H;
% for n = 1:4
%     E(n) = sum(sum(P(:,:,n).^2)); %%能量
%     for i = 1:16
%         for j = 1:16
%             if P(i,j,n)~=0
%                 H(n) = -P(i,j,n)*log(P(i,j,n))+H(n); %%熵
%             end
%             I(n) = (i-j)^2*P(i,j,n)+I(n);  %%惯性矩
%            
%             Ux(n) = i*P(i,j,n)+Ux(n); %相关性中μx
%             Uy(n) = j*P(i,j,n)+Uy(n); %相关性中μy
%         end
%     end
% end
% for n = 1:4
%     for i = 1:16
%         for j = 1:16
%             deltaX(n) = (i-Ux(n))^2*P(i,j,n)+deltaX(n); %相关性中σx
%             deltaY(n) = (j-Uy(n))^2*P(i,j,n)+deltaY(n); %相关性中σy
%             C(n) = i*j*P(i,j,n)+C(n);             
%         end
%     end
%     C(n) = (C(n)-Ux(n)*Uy(n))/deltaX(n)/deltaY(n); %相关性   
% end
% 
% %--------------------------------------------------------------------------
% %求能量、熵、惯性矩、相关的均值和标准差作为最终8维纹理特征
% %--------------------------------------------------------------------------
% a1 = mean(E)   
% b1 = sqrt(cov(E))
% 
% a2 = mean(H) 
% b2 = sqrt(cov(H))
% 
% a3 = mean(I)  
% b3 = sqrt(cov(I))
% 
% a4 = mean(C)
% b4 = sqrt(cov(C))
% 
% sprintf('0,45,90,135方向上的能量依次为： %f, %f, %f, %f',E(1),E(2),E(3),E(4))  % 输出数据;
% sprintf('0,45,90,135方向上的熵依次为： %f, %f, %f, %f',H(1),H(2),H(3),H(4))  % 输出数据;
% sprintf('0,45,90,135方向上的惯性矩依次为： %f, %f, %f, %f',I(1),I(2),I(3),I(4))  % 输出数据;
% sprintf('0,45,90,135方向上的相关性依次为： %f, %f, %f, %f',C(1),C(2),C(3),C(4))  % 输出数据;
