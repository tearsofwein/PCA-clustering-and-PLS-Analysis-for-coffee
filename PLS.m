clc
clear
clf


%=============data=============
X=[0.136 0.00248 0.00158
0.138 0.00236 0.00167
0.14 0.00229 0.00171
0.142 0.00221 0.00168
0.143 0.0022 0.00171
0.147 0.00212 0.00176
0.148 0.00206 0.00175
0.152 0.00206 0.00176
0.155 0.00198 0.00178
0.158 0.00197 0.0018
0.159 0.00192 0.00183
0.161 0.00185 0.00186
0.162 0.00184 0.00192
0.179 0.00142 0.00203
];

Y=[0
5
10
15
20
25
30
35
40
45
50
55
60
100
];

    
    
%+++++++++Analysis according to method of Partial least squares
[S,T] = plsregress(Y,X);


symS P1 P2 P3 PY X1 X2 X3
P1=num2str(S(1));       %get the Estimated function
P2=num2str(S(2));
P3=num2str(S(3));
PY=P1*X1+P2*X2+P3*X3
disp('Estimated function')
disp(PY)

SY=X*S;            %get the Estimated procent
disp('Estimated procent')
disp(SY)


[p3,n3]=size(SY);          %maeke figure of points of model-predicted versus actua% robusta in arabica/robusta mixtures
for i=1:p3
    plot(Y,SY,'x')
end


grid on 
hold on

q=polyfit(Y,SY,1);                 %make the line of  model-predicted versus actua% robusta in arabica/robusta mixtures
SSY=polyval(q,Y);
plot(Y,SSY)

axis([-5,110,-5,110])
xlabel('Actual robusta percentage')
ylabel('Estimated Robusta percentage')
title('model-predicted versus actua% robusta in arabica/robusta mixtures')