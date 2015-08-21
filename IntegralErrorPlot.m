function IntegralErrorPlot()
a = 0;
b = pi;

Iactual = 0.5 * (exp(pi) + 1); 

index =1;
for n = 2:10
    
N(index) = n;
I_Trapezoid(index) = Trapezoid(a, b, 2^n);
I_Simpson(index)  = Simpson(a, b, 2^n);

Error_Trapezoid(index) = abs((Iactual - I_Trapezoid(index) )/ Iactual) ; 
Error_Simpson(index) = abs((Iactual - I_Simpson(index) )/ Iactual ); 

index = index+1;
end


semilogy(N, Error_Trapezoid, 'r')
hold on;
semilogy(N, Error_Simpson, 'g')

legend('Trapezoid Error', 'Simpson Error')
xlabel('N')
ylabel('Relative Error of the Integral')

end

function f = Integrand(x)
    f = exp(x) .* sin(x);
end



function I = Trapezoid(a, b, N)

dh = (b-a)/N; 
x = a:dh:b; 
f = Integrand(x);


% Modfy the scale_vector for the trapezoid rule
% and modify the integral formula for I
scale_vector(1:N+1) = 1;
y=scale_vector(1:N+1)/2;

I = dh.* sum(f.*y);

end


function I = Simpson(a, b, N)
dh = (b-a)/N; 
x = a:dh:b; 
f = Integrand(x);


% Modify the scale_vector for the trapezoid rule
% and modify the integral formular for I
scale_vector(1:N+1) = 1;
I = dh.* sum(f.*scale_vector)/3;

end
