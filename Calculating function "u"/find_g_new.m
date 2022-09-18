
function g = find_g_new (x, a, T,N0,beta,tau,alpha,l)
    if N0==0
        g=(1/beta)*find_Ah(x,T,a,l);
    end  
    if N0==1
        g=(1/beta)*find_Ah(x,T,a,l) +(1/(beta^2))*find_B(x,T,a,tau,alpha,l);
    end
    if N0==2
        g=(1/beta)*find_Ah(x,T,a,l) +(1/(beta^2))*find_B(x,T,a,tau,alpha,l)+(1/(beta^3))*find_B2(x,T,a,tau,alpha,l);
    end
    if N0==3
        g=(1/beta)*find_Ah(x,T,a,l) +(1/(beta^2))*find_B(x,T,a,tau,alpha,l)+(1/(beta^3))*find_B2(x,T,a,tau,alpha,l)+(1/(beta^4))*find_B3(x,T,a,tau,alpha,l);
    end
    if N0==4
        g=(1/beta)*find_Ah(x,T,a,l) +(1/(beta^2))*find_B(x,T,a,tau,alpha,l)+(1/(beta^3))*find_B2(x,T,a,tau,alpha,l)+(1/(beta^4))*find_B3(x,T,a,tau,alpha,l);
	g=g+(1/(beta^5))*find_B4(x,T,a,tau,alpha,l);
    end
    if N0==5
        g=(1/beta)*find_Ah(x,T,a,l) +(1/(beta^2))*find_B(x,T,a,tau,alpha,l)+(1/(beta^3))*find_B2(x,T,a,tau,alpha,l)+(1/(beta^4))*find_B3(x,T,a,tau,alpha,l);
	g=g+(1/(beta^5))*find_B4(x,T,a,tau,alpha,l)+(1/(beta^6))*find_B5(x,T,a,tau,alpha,l);
    end
    if N0==6
        g=(1/beta)*find_Ah(x,T,a,l) +(1/(beta^2))*find_B(x,T,a,tau,alpha,l)+(1/(beta^3))*find_B2(x,T,a,tau,alpha,l)+(1/(beta^4))*find_B3(x,T,a,tau,alpha,l);
	g=g+(1/(beta^5))*find_B4(x,T,a,tau,alpha,l)+(1/(beta^6))*find_B5(x,T,a,tau,alpha,l)+(1/(beta^7))*find_B6(x,T,a,tau,alpha,l);
    end
    if N0==7
        g=(1/beta)*find_Ah(x,T,a,l) +(1/(beta^2))*find_B(x,T,a,tau,alpha,l)+(1/(beta^3))*find_B2(x,T,a,tau,alpha,l)+(1/(beta^4))*find_B3(x,T,a,tau,alpha,l);
        g=g+(1/(beta^5))*find_B4(x,T,a,tau,alpha,l)+(1/(beta^6))*find_B5(x,T,a,tau,alpha,l)+(1/(beta^7))*find_B6(x,T,a,tau,alpha,l)+(1/(beta^8))*find_B7(x,T,a,tau,alpha,l);
    end
end

