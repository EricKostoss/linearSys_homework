clear all
syms s Vs Vc Ii Iii L Ri Cii Rii Riii Ci
Iii=solve(Vc==(1/(Ci*s))*Iii,Iii)
Ii=solve(Vs==((L*s*Ii)+(Ri*Ii)+(Riii*Iii)+Vc),Ii)
Vc=solve(Vs==((L*s*Ii)+(Ri*Ii)+((1/(Cii*s))*(Ii-Iii))+(Rii*(Ii-Iii))),Vc)
TF=simplify(Vc)
TF=subs(TF,L,.068)
TF=subs(TF,Ci,.01)
TF=subs(TF,Cii,.01)
TF=subs(TF,Ri,4.7)
TF=subs(TF,Rii,10)
TF=subs(TF,Riii,12)
TF=simplify(TF)