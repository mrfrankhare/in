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

A = randn(sizex,sizex);
B = randn(sizex,sizeu);
E = randn(sizex,sizen);
C = randn(sizey,sizex);
D = randn(sizey,sizeu);
F = randn(sizey,sizen);

X= X'; U= U'; N= N'; Y= Y'; t=0;
while t < T
    X = A*X + B*U + E*N; 
    Y = C*X + D*U + F*N;
    t=t+1;
   
end
dlmwrite('C:\Users\mr.Frankhare\Desktop\lab\2.txt', Y);
fclose(fid);

flag1=0;
I=eig(A); %собственный вектор
i=0;
for i=1:sizex
    if abs(I(i))>1
       flag1=1;
    elseif (abs(I(i))==1) && (flag1~=1) 
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


