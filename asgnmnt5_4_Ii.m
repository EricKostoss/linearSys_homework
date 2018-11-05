clear all
syms s Vs Vr Ii Iii L Ri Cii Rii Riii Ci
Ii=solve(Vr==Ri*Ii,Ii)
Iii=solve(Vs==((L*s*Ii)+Vr+(Riii*Iii)+((1/(Ci*s))*Iii)),Iii)
Vr=solve(Vs==((L*s*Ii)+Vr+((1/(Cii*s))*(Ii-Iii))+(Rii*(Ii-Iii))),Vr)
TF=simplify(Vr)
TF=subs(TF,L,.068)
TF=subs(TF,Ci,.01)
TF=subs(TF,Cii,.01)
TF=subs(TF,Ri,4.7)
TF=subs(TF,Rii,10)
TF=subs(TF,Riii,12)
TF=simplify(TF)