%steepest_decsent



% myFunction --> function is taken by user
% a --> Starting Point


%sample#1:(x1^3-x2)^2+2*(x2-1)^2
%sample#2:(x1-2)^4+(x1-2*x2)^2


clc;clear
format short g
syms x1 x2 L

myFunction = input('Enter Function in terms of x1 & x2: ');
a1 = input('Enter Starting Point for X1: ');
a2 = input('Enter Starting Point for X2: ');
maxerr = input('Enter Maximum Error: ');


a=[a1 a2]; %initial point


f = inline(myFunction,'x1','x2');

diffFunctionx1 = diff(myFunction,x1); % differentiate over x1
diffFunctionx2 = diff(myFunction,x2); % differentiate over x2
df = inline([diffFunctionx1,diffFunctionx2],'x1','x2');

disp('-------------------------------------------------------');
disp('         Iteration     X1(n)      X2(n)       f(Xn)');
disp('-------------------------------------------------------');

iter=1;
b=a;
while(f(b(1),b(2))>maxerr)%termination criterion
    d=-df(b(1),b(2)); %calculate the direction of search by the first dervitive
    newF = f(b(1)+L*d(1),b(2)+L*d(2)); %sub-problem to find L(lambda)
    Lp = vpasolve(diff(newF,L),L); %calculate the root of sub-problem to find L(lambda)
    for i=1:length(Lp) %extract the real-positive part of solved sub-problem
        if isreal(double(Lp(i)))&& double(Lp(i))>0
            LLp = double(Lp(i)); %LLp is the real-positive Lambda
        end
    end
    b=b+LLp*d; %find the next point based on LLp(lambda) and d(direction) and b(previous point)
    disp([iter b f(b(1),b(2))]); %display results
    iter = iter+1;
    if iter ==100
        break
    end
end


