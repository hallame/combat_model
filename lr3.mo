model lr3

Real y11(start=61000);
Real y21(start=45000);
parameter Real a = 0.22;
parameter Real b = 0.82;
parameter Real c = 0.45;
parameter Real d = 0.64;

Real y12(start=61000);
Real y22(start=45000);
parameter Real a2 = 0.28;
parameter Real b2 = 0.83;
parameter Real c2 = 0.31;
parameter Real d2 = 0.75;

equation
  der(y11) = -a*y11 - b*y21 + 2*sin(4*time);
  der(y21) = -c*y11 - d*y21 + 2*cos(4*time);
equation
  der(y12) = -a2*y12 - b2*y22 + 1.5*sin(time);
  der(y22) = -c2*y12*y22 - d2*y22 + 1.5*cos(time);
  
end lr3;
