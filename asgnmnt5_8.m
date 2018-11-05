clear all
syms s Vs Vr Ii Iii L Ci Cii R
Iii=solve(Vr==R*Iii,Iii)
Ii=solve(Vs==((L*s*Ii)+((1/(Ci*s))*(Ii-Iii))),Ii)
Vr=solve(Vs==((L*s*Ii)+((1/(Cii*s))*Iii)+Vr),Vr)
TF=simplify(Vr)