beta=zeros(11,1);%Ϊѭ���ڵı������ȿ����ڴ棬��������ٶ�


%��һ���������������½���
theta(:,1)=zeros(5,1);%Ϊ��ѡ���ʼֵ�����ǰѳ�ʼ��ȫ����Ϊ0
[cost(1),g(:,1),hess]=costfunction(initialtheta);  %������ۺ������ݶȡ���ɭ��
d(:,1)=-g(:,1);
lambda(1)=-(g(:,1)'*d(:,1))/(d(:,1)'*hess*d(:,1));
theta(:,2)=initialtheta+lambda(1)*d(:,1);   

%�ڶ�����ʼ����FR�����ݶȷ�������
[cost(2),g(:,2),hess]=costfunction(theta(:,2));
beta(1)=(norm(g(:,2)))^2/(norm(g(:,1)))^2;
d(:,2)=-g(:,2)+beta(1)*d(:,1);
lambda(2)=-(g(:,2)'*d(:,2))/(d(:,2)'*hess*d(:,2));
theta(:,3)=theta(:,2)+lambda(2)*d(:,2);

%��һ�ε����󾫶��Բ��ϸ��ٽ��й̶���������Ϊ47�ε�FR���裬����������
for i=3:50
    [cost(i),g(:,i),hess]=costfunction(theta(:,i));
    beta(i-1)=(norm(g(:,i)))^2/(norm(g(:,i-1)))^2;
    d(:,i)=-g(:,i)+beta(i-1)*d(:,i-1); 
    lambda(i)=-(g(:,i)'*d(:,i))/(d(:,i)'*hess*d(:,i));
    theta(:,i+1)=theta(:,i)+lambda(i)*d(:,i);
end