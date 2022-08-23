## Robot Movement and Control 

Robotic vehicles are machines that move autonomously or are remotely controlled. In this model, we will be considering a robotic vehicle 2D space. To understand how they operate and essentially optimize their performance, it is important to know the path they have taken over a certain interval of time. The problem is that automatic vehicles will only save their location or send it to the central computer at discrete time intervals. This means that we do not know the exact path they are taking. Although these intervals may be short, we can use them to model the motion of the vehicle. 

We begin by using a set of data points sent by the robotic vehicle, measuring the movement of the robot every second in a one minute interval. Assigning variables for each column of the matrix gives us the time, x position, and y position of the robot. Since both x and y are with respect to time, we plot them together to visualize the approximate linear path of the robot. 

Vectors are then allocated and created for the x and y components of the velocity using the definition of a derivative. Plugging these vectors in the approximation of the robot’s speed at t seconds gives us the linear piecewise approximation for velocity.

A similar process is used to model the acceleration of the robot, using the approximation of acceleration formula. 

Once we have gotten a general sense of the movement and direction of the robot, we will use polynomial curve fitting techniques to model the data. After testing several values for the degree of the polynomial, the order of 10 was selected, This order fit the data well and accurately modeled the path of the robot. Using the MATLAB function polyfit, we found the coefficients of the polynomial that fit the data best in the least squares sense. We then evaluated the polynomials at different time instances and plotted x and y along with its fitted curve.

The velocity and acceleration of the robot are then obtained through the first and second derivatives of the fitted curve model. 

From Figures 4 and 5, we can see that the polynomial fitting provides much smoother location estimates of the robot’s movement compared to the original data and piecewise fitting results.

In a control system, we need to determine the velocity and acceleration at different time instances of the robotic vehicle. In this model, the robot is moving in a circular path of 2.4m diameter. It starts and ends at the origin (0,0). Each turn takes 60 seconds which gives the angular speed of =2/60 .

The velocity and acceleration of the robot in x and y directions also depends on the center of the circle and the direction of the movement. We are given the radius of the robot circle movement r=1.2m and choose the initial angle ₀=/6 with Cartesian coordinates 

x₀=rcos ₀ and y₀=rsin ₀.

The circular movement of the robot can be modeled by 

x(t)-x₀=rcos(ct+p₀)and y(t)-y₀=rsin(ct+p₀),

where c is a parameter that represents the direction of movement and p₀ is the initial angle of the origin with reference to the center of the circle. When c=1, the movement of the vehicle will be clockwise and when c=-1, the movement will be counterclockwise. For this model, we will be considering the clockwise movement of the robot. It can be verified that the initial anglep₀ is given by +₀. The velocity of the robot’s path in the x and y directions are given the respective derivatives with respect to t.

vx(t)=-crsin(ct+p₀)and vy(t)=crcos(ct+p₀).

The acceleration of the robot is given by the second order derivative of x and y with respect to t. 

ax(t)=-rcos(ct+p₀)and ax(t)=-rsin(ct+p₀).

Using all of this information, we can now control the circular path of the robot and determine the velocity and acceleration over time. 

In conclusion, we found the linear piecewise approximation of the measurement data which allowed us to extract the velocity and acceleration of the path of the robot. Then, by using this data obtained, we incorporated polynomial curve fitting techniques to model a smooth path for the robot that can be used for research and optimizing the performance of robotic vehicles. Finally, we modeled the circular motion of a robotic vehicle and provided the velocity and speed input to robotic control systems.  
