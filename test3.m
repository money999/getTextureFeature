I=imread('D94.gif');
[M,N]=size(I);
L=16; % LΪ�����ļ���

%%MTALBA�Դ��������
P_0=graycomatrix(I, 'NumLevels',L,'Offset',[0 1]);    %0��  ˮƽ����
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
%     E(n) = sum(sum(P(:,:,n).^2)); %%����
%     for i = 1:16
%         for j = 1:16
%             if P(i,j,n)~=0
%                 H(n) = -P(i,j,n)*log(P(i,j,n))+H(n); %%��
%             end
%             I(n) = (i-j)^2*P(i,j,n)+I(n);  %%���Ծ�
%            
%             Ux(n) = i*P(i,j,n)+Ux(n); %������Ц�x
%             Uy(n) = j*P(i,j,n)+Uy(n); %������Ц�y
%         end
%     end
% end
% for n = 1:4
%     for i = 1:16
%         for j = 1:16
%             deltaX(n) = (i-Ux(n))^2*P(i,j,n)+deltaX(n); %������Ц�x
%             deltaY(n) = (j-Uy(n))^2*P(i,j,n)+deltaY(n); %������Ц�y
%             C(n) = i*j*P(i,j,n)+C(n);             
%         end
%     end
%     C(n) = (C(n)-Ux(n)*Uy(n))/deltaX(n)/deltaY(n); %�����   
% end
% 
% %--------------------------------------------------------------------------
% %���������ء����Ծء���صľ�ֵ�ͱ�׼����Ϊ����8ά��������
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
% sprintf('0,45,90,135�����ϵ���������Ϊ�� %f, %f, %f, %f',E(1),E(2),E(3),E(4))  % �������;
% sprintf('0,45,90,135�����ϵ�������Ϊ�� %f, %f, %f, %f',H(1),H(2),H(3),H(4))  % �������;
% sprintf('0,45,90,135�����ϵĹ��Ծ�����Ϊ�� %f, %f, %f, %f',I(1),I(2),I(3),I(4))  % �������;
% sprintf('0,45,90,135�����ϵ����������Ϊ�� %f, %f, %f, %f',C(1),C(2),C(3),C(4))  % �������;
