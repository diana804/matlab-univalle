function M=Tailor(fun,x,a,n)

fs=str2sym(fun)
vs=symvar(fs)
R=double(subs(fs,vs,x))

for i=0:n
    s(i+1)=subs(diff(fs,vs,i)/factorial(i),vs,a)*(x-a)^i
    sigma(i+1)=sum(double(s));
    Tp(i+1)=poly2sym(fliplr(s(1:i+1)),vs)

    et(i+1)=abs((R-sigma(i+1))/R)*100
    if i>=1;
        ea(i+1)=abs((sigma(i+1)-sigma(i))/sigma(i+1))*100
    end
end
%Tabla de resultados
aprox=sigma(end);etf=et(end);eaf=ea(end)
Encabezado={'Iteracion','valor aproximado','Error relativo porcentual','Error aproximado procentual'}
T=num2cell([(1:n+1)',sigma',et',ea']);M=[Encabezado;T]

%Graficas
fplot(fs,'LineWidth',2);grid on;hold on
plot(x,R,'ro','MarkerfaceColor','r');hold on
plot(a,subs(fs,vs,a),'bo','MarkerFaceColor','b')
for i=2:n+1
    hold on
    fplot (Tp(i))
end
txt1=strcat(strseq('T_p_',1:n+1),{'(x)'})
legend([cellstr(fun);{['f(',num2str(x),')']};{'a'};txt1],'Location','Best')