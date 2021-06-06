% Tangia Zhou
% Robot Movement and Control

clear; % Clear the workspace 
close all; % Close all figures

% Piecewise Linear Approximation

load robpos.mat; % Load in the mat file

rob_N= height(robpos); % Total number of points
rob_t= robpos(:,1); % First column
rob_x= robpos(:,2); % x location of the robot (vector)
rob_y= robpos(:,3); % y location of the robot

% Plotting the robot location and the piecewise approximation of the robot
figure;
plot(rob_x,rob_y,'-o')
xlabel('x(t)');
ylabel('y(t)')
title('Piecewise Linear Approximation of the Robot Location');

% Creating a vector rob_N-1 with all zeros
rob_vx=zeros(rob_N-1,1);
rob_vy=zeros(rob_N-1,1);
rob_v= zeros(rob_N-1,1);
rob_t1=rob_t(1:(rob_N-1));

% Calculating the elements
for i=1:rob_N-1
    rob_vx(i)=(rob_x(i+1)-rob_x(i))/(rob_t(i+1)-rob_t(i));
    rob_vy(i)=(rob_y(i+1)-rob_y(i))/(rob_t(i+1)-rob_t(i));
    rob_v(i)=sqrt(rob_vx(i)^2+rob_vy(i)^2);
end

% Plotting velocity
figure;
plot(rob_t1,rob_v,'-o')
xlabel('Time');
ylabel('Velocity')
title('Velocity of the Robot at Different Times');

% Calculating acceleration
rob_a=zeros(rob_N-2,1);
rob_t2=rob_t(1:(rob_N-2));

for i=1:rob_N-2
    rob_a(i)=(rob_v(i+1)-rob_v(i))/(rob_t(i+1)-rob_t(i));
end

% Plotting Acceleration
figure;
plot(rob_t2,rob_a,'-o')
xlabel('Time');
ylabel('Acceleration')
title('Acceleration of the Robot at Different Times');

% Polynomial Curve Fitting 

N=20; % Order of the polynomial

p_x=polyfit(rob_t,rob_x,N); % Approximating x components
p_y=polyfit(rob_t,rob_y,N); % Approximating y components

t=linspace(0,60,501); % from 0 to 60 seconds with 501 elements

approx_x= polyval(p_x,t); % approximation of interpolated values of x
approx_y= polyval(p_y,t); % approximation "" y

figure;
plot(approx_x,approx_y,rob_x,rob_y,rob_x,rob_y,'ro') % comparison

xlabel('x(t)');
ylabel('y(t)');
title('Curve Fit for Position');

% Velocity fit
p_vx=p_x(1:N).*(N:-1:1); % coefficients of x'
p_vy=p_y(1:N).*(N:-1:1); % coefficients of y'

approx_vx=polyval(p_vx,t);
approx_vy=polyval(p_vy,t);
approx_v=sqrt(approx_vx.^2+approx_vy.^2);

figure;
subplot(2,1,1);
plot(t,approx_v,rob_t1,rob_v,'-ro')
xlabel('Time');
ylabel('Velocity')
title('Curve Fit for Velocity');

% Acceleration fit
p_ax=p_vx(1:(N-1)).*((N-1):-1:1);
p_ay=p_vy(1:(N-1)).*((N-1):-1:1);

approx_ax=polyval(p_ax,t);
approx_ay=polyval(p_ay,t);
approx_a=sqrt(approx_ax.^2+approx_ay.^2);

subplot(2,1,2);
plot(t,approx_a,rob_t2,rob_a,'-ro')
xlabel('Time');
ylabel('Acceleration')
title('Curve Fit for Acceleration');

% Path Control

% c=1 clockwise, c=-1 counterclockwise
c=1;
 
% Define coordinates of the center of the circular path
r=1.2;
theta=pi/6; % Angle is assumed
x0=r*cos(theta); % Center of the path
y0=r*sin(theta);

% p0 is the initial angle of the circle
% The robot starts and ends at the origin
p0=pi+theta;

% Angular speed comes from 2pi/60 seconds
w=pi/30;

t=linspace(0,60,500); % Points to plot 

x_v=w*r*sin(-c*w*t+p0); % Velocity
y_v=-w*r*cos(-c*w*t+p0);

x_a=w^2*r*cos(-c*w*t+p0); % Acceleration
y_a=w^2*r*sin(-c*w*t+p0);

figure;
subplot(2,1,1)
plot(t,x_v,t,y_v,'r')
xlabel('Time');
ylabel('Velocity')
title('Robot Velocity in x and y Directions');
legend('velocity in x','velocity in y','Location','NorthEast')

subplot(2,1,2)
plot(t,x_a,t,y_a,'r')
xlabel('Time');
ylabel('Acceleration')
title('Robot Acceleration in x and y Directions');
legend('acceleration in x','acceleration in y','Location','NorthEast')
