% bisection method (nesf kardan)
% Please not that a , b should be chosen so that f(a)*f(b)<0
%sample#1: x^4/4 + x^2 - 100*x -cos(x)

clc;clear    
syms x;      
myFunction = input('Enter Function in terms of x:');      
a = input('Enter the Stating Point of the interval :');   
b = input('Enter the End Point of the interval :');            
maxerr = input ('Enter Maximum Error:');   %maximum error
 

f = inline(myFunction);     
diffFunction = diff(f(x)); %calculate the first derivitive of function
df = inline(diffFunction);
 
iter=1; %number of iterations
xr=(a+b)/2;
disp('--------------------------------------------');
disp('     iteration         Xn           f(Xn)');
disp('-------------------------------------------');
disp([iter xr f(xr)])%display results
while(df(xr)>maxerr) %termination criterion   
    xr=(a+b)/2; %calcutate the middle of the interval       
    if(df(xr)>0) %if the first derivitive at new point >0 then place it at the end of interval
        b=xr;   
    end
    if (df(xr)<0) %if the first derivitive at new point <0 then place it at the start of interval
        a=xr;      
    end
    iter=iter+1;
    disp([iter xr f(xr)]) %display results
end
    disp('-------------Solution---------------');
    disp('xr=')
    disp(xr)

            
        
            
