clear all
close all
syms x y m1 c1 m2 c2
eq1=y-m1*x-c1;
eq2=y-m2*x-c2;
S=solve(eq1==0,eq2==0);
X=S.x; % general solution of intersection point of two straight lines
Y=S.y; % general solution of intersection point of two straight lines
c1=0;
distx=1; %distance between two lines along X
beta=0; %angle of slope
heighty=1;
c2=-m2*distx+heighty;
syms c 
%m=-5;c=0.5;
G=9.81; %this is weight considering mass =1 
figure()
for z=1
F(z)=2*z*G/10; % applied force 0.1W, 0.2W

m=tand(atan2d(F(z)*sind(0)-G,F(z)*cosd(0))); %slope of resultant of F and G
yy=0.1;
syms xx
c=yy-m*xx; %yy and xx denote points of intersection of F and G
if m==inf || m==-inf
    eqq3=xx-X;
else
eqq3=-m*X+Y-c;  % equation of resultant of F and G
end

eqq3=subs(eqq3);
eqq3=vpa(eqq3,3);
mu1=0.4;mu2=0.41; % Keeping slightly different, otherwise we get Nan

S1=linspace(beta+90+sign(F(z))*atand(mu1),beta+90.05,30); %possible slope of contact force 1
M1=tand(S1);
S2=linspace(beta+90+sign(F(z))*atand(mu2),beta+90.1,30); %possible slope of contact force 2
M2=tand(S2);
XSOL=[];
XXSOL=[];
YYSOL=[];

for i=1:length(M1)
    for j=1:length(M2)
  m1=M1(i); m2=M2(j);
 
  xxsol(i,j)=subs(X);
  yysol(i,j)=subs(Y); %intersection points of contact force lines
   xxsol(i,j)=subs(xxsol(i,j));
   yysol(i,j)=subs(yysol(i,j));
  eqq3m(i,j)=subs(eqq3);
  eqq3m(i,j)=vpa(eqq3m(i,j));
  
 % if sign((S1(i)-atand(-m))/(S2(j)-atand(m)))==-1
%  if sign(F(z))==-1  % ensures the positive span condition
%      
%      ssx=sign((S1(i)-(atand(m)))/(S2(j)-(atand(m))));
%  else
%      ssx=sign((S1(i)-(180-atand(-m)))/(S2(j)-(180-atand(-m))));
%  end

  %ssx1 =  sign((S1(i)-(atand(m)))/(S2(j)-(atand(m))));

  ssx2 =  sign((S1(i)-(180-atand(-m)))/(S2(j)-(180-atand(-m))));

  %ssx = min (ssx1,ssx2); % should be -1 ,  % ensures the positive span condition

 if ssx2==-1
  
  S=solve(eqq3m(i,j),xx); % solution of contact forces with the resultant of F and G

  xsol(i,j)=S;

else
  xsol(i,j)=0;
  
 end

    end

     XSOL(length(M1)*(i-1)+1:length(M1)*(i-1)+30)=xsol(i,:);

     XXSOL(length(M1)*(i-1)+1:length(M1)*(i-1)+30)=xxsol(i,:);

     YYSOL(length(M1)*(i-1)+1:length(M1)*(i-1)+30)=yysol(i,:);
end

XSOLF(:,z)= XSOL;
XXSOLF(:,z)= XXSOL;
YYSOLF(:,z)= YYSOL;

plot(sort(XSOLF(:,z)))
hold on
end
%plot(XSOLF)
%figure

% SS=solve(eqq3==0,m1,m2)
% M1=vpa(SS.m1)
% M2=vpa(SS.m2)
% ALP1=atan(M1)*57.3
% ALP2=atan(M2)*57.3