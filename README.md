# robot-movement
Mathematical approximations to model the path of a robot

Robotic vehicles are machines that move autonomously or are remotely controlled. In this model, we will be considering a robotic vehicle 2D space. To understand how they operate and essentially optimize their performance, it is important to know the path they have taken over a certain interval of time. The problem is that automatic vehicles will only save their location or send it to the central computer at discrete time intervals. This means that we do not know the exact path they are taking. Although these intervals may be short, we can use them to model the motion of the vehicle. 

We begin by using a set of data points sent by the robotic vehicle, measuring the movement of the robot every second in a one minute interval. Assigning variables for each column of the matrix gives us the time, x position, and y position of the robot. Since both x and y are with respect to time, we plot them together to visualize the approximate linear path of the robot. 

Vectors are then allocated and created for the x and y components of the velocity using the definition of a derivative. Plugging these vectors in the approximation of the robot’s speed at t seconds gives us the linear piecewise approximation for velocity.
