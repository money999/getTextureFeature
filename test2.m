I=imread('D94.gif');
[M,N]=size(I);
L=16; % L为量化的级数

%%自己编写函数求取
I=fix(double(I)/(256/L)); % 灰度级量化，量化为L
Gray=I;
P=zeros(L,L,4);   %%生成的灰度共生矩阵
for m=1:L
    for n=1:L
        for i=1:M
            for j=1:N
                if j<N && Gray(i,j)==m-1 && Gray(i,j+1)==n-1           % 0° [0,1]
                    P(m,n,1)=P(m,n,1)+1;
                end
                if i>1&&j<N && Gray(i,j)==m-1 && Gray(i-1,j+1)==n-1      % 45° [-1,1]
                    P(m,n,2)=P(m,n,2)+1;
                end
                if i>1&& Gray(i,j)==m-1 && Gray(i-1,j)==n-1                 % 90° [-1,0]
                    P(m,n,3)=P(m,n,3)+1;
                end
                if i>1&& j>1&& Gray(i,j)==m-1 && Gray(i-1,j-1)==n-1            %135°[-1,-1]
                    P(m,n,4)=P(m,n,4)+1;
                end
            end
        end
    end
end
%%将共生矩阵变换为对称矩阵
for n = 1:4
    P(:,:,n)=P(:,:,n)+P(:,:,n)';
end
%%---------------------------------------------------------
% 对共生矩阵归一化
%%---------------------------------------------------------
for n = 1:4
    P(:,:,n) = P(:,:,n)/sum(sum(P(:,:,n)));  %%注意两个sum, sum(A)表示对矩阵A每列求和，
end                                           %%  sum(sum(A)）表示对矩阵所有元素求和

%--------------------------------------------------------------------------
%4.对共生矩阵计算能量、熵、惯性矩、相关4个纹理参数
%--------------------------------------------------------------------------
H = zeros(1,4);
I = H;
Ux = H;      Uy = H;
deltaX= H;  deltaY = H;
C =H;
for n = 1:4
    E(n) = sum(sum(P(:,:,n).^2)); %%能量
    for i = 1:L
        for j = 1:L
            if P(i,j,n)~=0
                H(n) = -P(i,j,n)*log(P(i,j,n))+H(n); %%熵
            end
            I(n) = (i-j)^2*P(i,j,n)+I(n);  %%惯性矩  （也称对比度）
           
            Ux(n) = i*P(i,j,n)+Ux(n); %相关性中μx
            Uy(n) = j*P(i,j,n)+Uy(n); %相关性中μy
        end
    end
end
for n = 1:4
    for i = 1:L
        for j = 1:L
            deltaX(n) = (i-Ux(n))^2*P(i,j,n)+deltaX(n); %相关性中σx
            deltaY(n) = (j-Uy(n))^2*P(i,j,n)+deltaY(n); %相关性中σy
            C(n) = i*j*P(i,j,n)+C(n);            
        end
    end
    C(n) = (C(n)-Ux(n)*Uy(n))/deltaX(n)/deltaY(n); %相关性   
end