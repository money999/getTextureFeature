I=imread('D94.gif');
[M,N]=size(I);
L=16; % LΪ�����ļ���

%%�Լ���д������ȡ
I=fix(double(I)/(256/L)); % �Ҷȼ�����������ΪL
Gray=I;
P=zeros(L,L,4);   %%���ɵĻҶȹ�������
for m=1:L
    for n=1:L
        for i=1:M
            for j=1:N
                if j<N && Gray(i,j)==m-1 && Gray(i,j+1)==n-1           % 0�� [0,1]
                    P(m,n,1)=P(m,n,1)+1;
                end
                if i>1&&j<N && Gray(i,j)==m-1 && Gray(i-1,j+1)==n-1      % 45�� [-1,1]
                    P(m,n,2)=P(m,n,2)+1;
                end
                if i>1&& Gray(i,j)==m-1 && Gray(i-1,j)==n-1                 % 90�� [-1,0]
                    P(m,n,3)=P(m,n,3)+1;
                end
                if i>1&& j>1&& Gray(i,j)==m-1 && Gray(i-1,j-1)==n-1            %135��[-1,-1]
                    P(m,n,4)=P(m,n,4)+1;
                end
            end
        end
    end
end
%%����������任Ϊ�Գƾ���
for n = 1:4
    P(:,:,n)=P(:,:,n)+P(:,:,n)';
end
%%---------------------------------------------------------
% �Թ��������һ��
%%---------------------------------------------------------
for n = 1:4
    P(:,:,n) = P(:,:,n)/sum(sum(P(:,:,n)));  %%ע������sum, sum(A)��ʾ�Ծ���Aÿ����ͣ�
end                                           %%  sum(sum(A)����ʾ�Ծ�������Ԫ�����

%--------------------------------------------------------------------------
%4.�Թ�����������������ء����Ծء����4���������
%--------------------------------------------------------------------------
H = zeros(1,4);
I = H;
Ux = H;      Uy = H;
deltaX= H;  deltaY = H;
C =H;
for n = 1:4
    E(n) = sum(sum(P(:,:,n).^2)); %%����
    for i = 1:L
        for j = 1:L
            if P(i,j,n)~=0
                H(n) = -P(i,j,n)*log(P(i,j,n))+H(n); %%��
            end
            I(n) = (i-j)^2*P(i,j,n)+I(n);  %%���Ծ�  ��Ҳ�ƶԱȶȣ�
           
            Ux(n) = i*P(i,j,n)+Ux(n); %������Ц�x
            Uy(n) = j*P(i,j,n)+Uy(n); %������Ц�y
        end
    end
end
for n = 1:4
    for i = 1:L
        for j = 1:L
            deltaX(n) = (i-Ux(n))^2*P(i,j,n)+deltaX(n); %������Ц�x
            deltaY(n) = (j-Uy(n))^2*P(i,j,n)+deltaY(n); %������Ц�y
            C(n) = i*j*P(i,j,n)+C(n);            
        end
    end
    C(n) = (C(n)-Ux(n)*Uy(n))/deltaX(n)/deltaY(n); %�����   
end