%Parameters and Assumptions
g=9.81; %Gravity m/s
P_kPa=98.9; %kPa
P_Pa=P_kPa*1000; %Pa&Nm
T_F= 72; %°F
R_air=287; %Nm/kgK
%Fahrenheit to Celcius 
T_C=(T_F-32)*(5/9); %°C
%Celcius to Kelvin
T_K=T_C+273.15; %K
%Density of Air (Ideal Gas Law)
rho_air=P_Pa/(R_air*T_K);

%Dimpled Ball%
d_gb_cm=5; %cm
d_gb=d_gb_cm/100; %m
s=d_gb*pi/4; %m^2
w_gb_g=70; %g
w_gb=w_gb_g/1000; %kg
%Angle of golf ball
h_cm=10; %cm
h_m=h_cm.*100; %m
x_cm=[1 2 3 4 5]; %cm
x_m=x_cm.*100; %m
y_cm=[.2 .4 .6 .8 1 ]; %cm
y_m=y_cm.*100; %m
theta=(x_m./(h_m+y_m));
%---------------------------------------------------------------------------%
%Dynamic pressure from the commercial pressure transducer reading
DP_TR=[4.44 6.06 6.92 7.27 7.46];
DP_T=((DP_TR-4)./16).*1250;
%Airspeed from the commercial pressure transducer reading
v=sqrt(DP_T.*2./rho_air);
%Coefficient of Drag
cd=(2.*w_gb.*tan(theta))./(rho_air.*(v.^2).*s);
%Drag
D=.5.*rho_air.*(v.^2).*s.*cd;
%Plot of dimmensional drag and velocity 
f = fit(D,v,'exp1');
plot(f,D,v,"o")
title('Experimental and Theoretical Dynamic Pressures Versus Velocities');
ylabel('Velocity (m/s)');
xlabel('Dimmensional Drag (N)');
xlim([0 .04])
ylim([0 25])

%{
%Smooth Ball%
%d_gb_cm_s=; %cm
%d_gb_s=d_gb_cm_s*100; %m
%s_s=d_gb_s*pi/4; %m^2
%w_gb_g_s=; %g
%w_gb_s=w_gb_g_s*1000; %kg
%Angle of golf ball
%h_cm_s=[ ]; %cm
%h_m_s=h_cm_s.*100; %m
%x_cm_s=[ ]; %cm
%x_m_s=x_cm_s.*100; %m
%y_cm_s=[ ]; %cm
%y_m_s=y_cm_s.*100; %m
%theta_s=(x_m_s/(h_m_s+y_m_s));
%---------------------------------------------------------------------------%
%Dynamic pressure from the commercial pressure transducer reading
DP_TR_s=[];
DP_T_s=((DP_TR_s-4)./16).*1250;
%Airspeed from the commercial pressure transducer reading
v_s=sqrt(DP_T_s.*2./rho_air);
%Coefficient of Drag
cd_s=(2.*w_gb_s.*tan(theta_s))./(rho_air.*(v_s.^2).*s_s);
%Drag
D_s=.5.*rho_air.*(v_s.^2).*s_s.*cd_s;
%Plot of dimmensional drag and velocity 
figure 2;
plot(D_s,v_s,'o')
title('Experimental and Theoretical Dynamic Pressures Versus Velocities');
ylabel('Velocity (m/s)');
xlabel('Dimmensional Drag (N)');
%}
