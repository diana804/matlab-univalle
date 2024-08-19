function TAYLOR(fun,x,a,n)

fs=str2sym(fun)
vs=symvar(fs)
R=double(subs(fs,vs,x))

for i=0:n
    s(i+1)=subs(diff(fs,vs,i)/factorial(i),vs,a)*(x-a)^i 
    sigma(i+1)=sum(double(s))
end