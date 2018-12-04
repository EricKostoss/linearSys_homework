clear all
syms s m c k I R TF H TF FTF FTFill w mgntd phase
%m d2x/dt2 = f - [torqueforce] - c dx/dt - k x;  I d2[theta]/dt2 = R [torqueForce];  [torqueForce] = I/R2 d2x/dt2
% m = 30kg; I = 70kg m m; R = 1m; k = 360400N/m; c = 400N/(m/s); sine input
TF=(1/(s^2+(c/(m+I/R^2))*s+(k/(m+I/R^2))))
H=tf([1],[1 4 3604])
TF=subs(TF,m,30);
TF=subs(TF,I,70);
TF=subs(TF,R,1);
TF=subs(TF,c,400);
TF=subs(TF,k,360400)
FTF=subs(TF,s,w*1i)
n=2.3025:.005:6.9077;x=exp(n);
FTFill=subs(FTF,w,x)
mgntd=20*log(abs(FTFill));phase=(180/pi)*angle(FTFill);
figure(1);semilogx(x,mgntd);grid on
figure(2);semilogx(x,phase);grid on
figure(3);bode(H);grid on
%call SIMULINK
simOut=sim('frequencyResp','AbsTol','1e-7','SaveState','on','StateSaveName','twentyX','SaveOutput','on','OutputSaveName','twentyY')
plot(simOut.twentyX)%2 branches in, the second one.