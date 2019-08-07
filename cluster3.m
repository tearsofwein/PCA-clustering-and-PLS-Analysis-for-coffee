clc
clear
clf
%=============data=============
X=[0.139 0.00118 0.00268 
0.158   0.00168 0.00122
0.134   0.00134 0.00141
0.173   0.00131 0.00198
0.14    0.00112 0.00293
0.179   0.00146 0.00133
0.129   0.00118 0.0019
0.175   0.00152 0.00133
0.137   0.00129 0.00361
0.158   0.00171 0.00123
0.124   0.00119 0.00284
0.181   0.00156 0.00121
0.138   0.00126 0.00296
0.132   0.00122 0.00132
0.185   0.0016  0.00154
0.144   0.00135 0.00446
0.196   0.0017  0.00133
0.161   0.00172 0.00131
];

%=============the analysis according to the cluster method=============
X2=zscore(X);
disp('The standard data:')
disp(X2)
Y2=pdist(X2);
Q=squareform(Y2);
disp('The euclidean distance among the samples:')
disp(Q)
Z2=linkage(Y2,'ward');
disp('The caculation of dendrogram according to ward distance:')
disp(Z2)
C2=cophenet(Z2,Y2);
disp('The cophenetic correlation coefficient for the hierarchical cluster tree represented by Z2:')
disp(C2)
T=cluster(Z2,2);
H=dendrogram(Z2);
ylabel('Linkage Distance')
title('Dendrogram of coffee samples by using P,Mn and Cu variables')
