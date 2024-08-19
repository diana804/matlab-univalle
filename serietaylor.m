function [t,orden]=serietaylor(f,origen,rango,error)
fx=str2sym(f)
v=symvar(fx)
orden=0
maximo=max(rango)
t=taylor(fx,v,origen,'Order',orden)
while abs(subs(fx,maximo)-subs(t,maximo))>error
    orden=orden+1;
    t=taylor(fx,v,origen,'Order',orden)
end