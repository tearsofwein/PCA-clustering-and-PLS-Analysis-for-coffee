clc
clear
clf
%=============data=============
    X=[0.002899 0.139 0.00268 0.00598 0.173 0.00178 0.089 0.000413 0.000292 0.0023 1.466
    0.001393 0.158 0.00122 0.00561 0.161 0.00168 0.094 0.000414 0.000091 0.00214 1.448
    0.001933 0.134 0.00141 0.00462 0.174 0.00134 0.097 0.000559 0.000531 0.00334 1.493
    0.002997 0.173 0.00198 0.00734 0.165 0.00131 0.087 0.00044 0.000501 0.00338 1.541
    0.000544 0.14 0.00293 0.00466 0.173 0.00112 0.09 0.000575 0.000917 0.00301 1.442
    0.003182 0.179 0.00133 0.00506 0.146 0.00146 0.108 0.000693 0.000271 0.00199 1.438
    0.00369 0.129 0.0019 0.00527 0.178 0.00118 0.109 0.000598 0.000379 0.00117 1.379
    0.000494 0.175 0.00133 0.00541 0.162 0.00152 0.113 0.000666 0.000494 0.00169 1.417
    0.00179 0.137 0.00361 0.0052 0.182 0.00129 0.109 0.001193 0.001008 0.00233 1.358
    0.00071 0.158 0.00123 0.00517 0.171 0.00171 0.104 0.000548 0.000203 0.00066 1.455
    0.000508 0.124 0.00284 0.00403 0.173 0.00119 0.088 0.000589 0.000589 0.00106 1.273
    0.001297 0.181 0.00121 0.00637 0.167 0.00156 0.117 0.000769 0.000527 0.00147 1.499
    0.000506 0.138 0.00296 0.00509 0.193 0.00126 0.101 0.000506 0.000527 0.0017 1.407
    0.000897 0.132 0.00132 0.00408 0.187 0.00122 0.103 0.000515 0.000474 0.0016 1.378
    0.000729 0.185 0.00154 0.00609 0.166 0.0016 0.135 0.0008 0.000385 0.00121 1.389
    0.000567 0.144 0.00446 0.00494 0.194 0.00135 0.103 0.00077 0.000659 0.00177 1.364
    0.000579 0.196 0.00133 0.0063 0.178 0.0017 0.123 0.000853 0.000457 0.0011 1.408
    0.001514 0.161 0.00131 0.00625 0.182 0.00172 0.122 0.000568 0.000159 0.00159 1.401
    ];

%=============the principal component analysis=============
%+++++++++standardisition of data
    [p,n]=size(X);
for j=1:n                  %mean
     mju(j)=mean(X(:,j));
        sigma(j)=sqrt(cov(X(:,j)));      %standard deviation
end
disp('mean of data')
disp(mju)
disp('standard deviation')
disp(sigma)

for i=1:p
    for j=1:n
         Y(i,j)=(X(i,j)-mju(j))/sigma(j);
    end
end
 sigmaY=cov(Y);     
%+++++++++Latent root AND Eigenvector of Covariance
[T,lambda]=eig(sigmaY);
disp('Latent Root:');
disp(lambda);
disp('Eigenvector:');
disp(T);
%+++++++++The Contribution Rate of Variance and The Accumulative
%Contribution Rate of Variance
a=zeros(1,n);
for i=1:n
    a(i)=lambda(i,i);
end
aa=sum(a);
aaa=a/aa;
b=zeros(1,n);
b=aaa;
for i=2:n
    b(i)=b(i-1)+aaa(i);
end

disp('The Contribution Rate of Variance:');
disp(aaa);
disp(' The Accumulative Contribution Rate of Variance:');
disp(b);
   
%+++++++++Obtaination of scores of PCA (Principal component analysis) 
strdata=(X-ones(p,1)*mju)./(ones(p,1)*sigma);
disp('the standard data:')
disp(strdata)
score=strdata*T;
disp('the scores of the principle component:')
disp(score)
%+++++++++Figure of scores of PCA (Principal component analysis) 
%^^^^^^^Figure of PC1 AND PC2
subplot(2,1,1)
M=[score(:,n),score(:,n-1)];
disp('scores of PC1 AND PC2')
disp(M)
for i=1:p
  if i==1|i==3|i==5|i==7|i==9|i==11|i==13|i==14|i==16
      plot(M(i,1),M(i,2),'o')
      xlabel('PC1')
      ylabel('PC2')
      grid on
      hold on
  else plot(M(i,1),M(i,2),'x')
       grid on
       hold on
  end
end
title('PCA scores plot for the PC1 AND PC2')
%^^^^^^^Figure of PC1 PC2 AND PC3
subplot(2,1,2)
N=[score(:,n),score(:,n-1),score(:,n-2)];
disp('scores of PC1 PC2 AND PC3')
disp(N)
for i=1:p
    if i==1|i==3|i==5|i==7|i==9|i==11|i==13|i==14|i==16
       plot3(N(i,1),N(i,2),N(i,3),'o')
       xlabel('PC1')
       ylabel('PC2')
       zlabel('PC3')
       grid on
       hold on
    else plot3(N(i,1),N(i,2),N(i,3),'x')
       grid on
       hold on
    end
end
title('PCA scores plot for the PC1 PC2 AND PC3')
