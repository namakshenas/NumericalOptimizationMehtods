% Secant Method


% myFunction --> function is taken by user
% a --> Starting Point


%sample#1: x^4/4 + x^2 - 100*x -cos(x)



clc;clear
format short g

syms x;
myFunction = input('Enter Function in terms of x: ');
a = input('Enter the Stating Point of the interval :');   
b = input('Enter the End Point of the interval :'); 
maxerr = input('Enter Maximum Error: ');

f = inline(myFunction);     
diffFunction = diff(f(x)); %calculate the first derivitive of function
df = inline(diffFunction);



iter=1; %calculating number of iterations
c = b-df(b)*(b-a)/(df(b)-df(a));%calculating secant formula to obtain the next point
disp('--------------------------------------------');
disp('     iteration         Xn           f(Xn)');
disp('-------------------------------------------');
disp([iter c f(c)]); %display results
while abs(c-b) > maxerr %terminatin criterion
    a = b; %replacing x(n) in x(n-1)
    b = c; %replacing x(n+1) in x(n)
    c = b-df(b)*(b-a)/(df(b)-df(a)); %calculating secant formula to obtain the next point
    disp([iter c f(c)]); %display results
    iter=iter+1;
    if(iter == 100) %maximum number of iterations
        break;
    end
end
disp('-------------Solution---------------');
display(['Xn = ' num2str(c)]);





