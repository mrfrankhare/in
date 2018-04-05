fid = fopen('C:\Users\mr.Frankhare\Desktop\lab\1.txt');
L1 = fgetl(fid); [X] =str2num(L1);
L2 = fgetl(fid); [U] =str2num(L2);
L3 = fgetl(fid); [N] =str2num(L3);
L4 = fgetl(fid); [Y] =str2num(L4);
L5 = fgetl(fid); [T] =str2num(L5);

sizex = length(X);
sizeu = length(U);
sizen = length(N);
sizey = length(Y);

%A = randn(sizex,sizex);
A = [[-0.03 0.1 0.016 0.2 0.26 0.02 ]
[ 0.3 0.03 -0.3 0.3 0.06 0.3]
[-0.3 -0.3 -0.2 0.3 0.1 0.16]
[ 0.02 -0.03 0.3 0.06 -0.16 -0.26]
[ 0.3 -0.33 0.23 0.3 -0.3 -0.1 ]
[ 0.3 0.3 0.26 0.16 0.13 0.06]];
%иначе система неустойчива
B = randn(sizex,sizeu);
E = randn(sizex,sizen);
C = randn(sizey,sizex);
D = randn(sizey,sizeu);
F = randn(sizey,sizen);

X= X'; U= U'; N= N'; Y= Y'; %t=0;
Xtransf = zeros(sizex,T);
Ytransf = zeros(sizey,T);
for t = 1:T
    
    X = A*X + B*U + E*N; 
    Y = C*X + D*U + F*N;
   
      Xtransf(:,t) = X;
      Ytransf(:,t) = Y;
end
dlmwrite('C:\Users\mr.Frankhare\Desktop\lab\2.txt', Y);
fclose(fid);

flag1=0;
I=eig(A); %собственный вектор
t=0;
for t=1:sizex
    if abs(I(t))>1
       flag1=1;
    elseif (abs(I(t))==1) && (flag1~=1) 
        disp('so-so');
        flag1=2;
    end
end
if flag1==1
    disp('very,very bad');
end

if flag1==2
    disp('so-so');
end

if flag1==0
    disp('It is okay,bro');
end

figure(1);
plot(Ytransf');
grid on;
title('input');

overshoot = (max(Ytransf) - Ytransf(T))/Ytransf(T);
disp('overshoot');
disp(overshoot*100);

time = 0;
for t=1:T
    if abs(Ytransf(t)-Ytransf(T))/abs(Ytransf(T)) > 0.05+Ytransf(T)
        time=t;
    end    
end
disp('step time');
disp(time);

e = Xtransf(t)-Ytransf(T);    

disp('static error');
disp(e);