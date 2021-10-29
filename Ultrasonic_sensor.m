clear
a = arduino('COM4','Uno',"Libraries","Ultrasonic");
sensor = ultrasonic(a,'D12','D13');
for i= 1:5
dist1 = readDistance(sensor);
dist1=dist1*100; % in cm
pause(0.5)
%disp(dist1)
h=msgbox(sprintf('The distance is %0.3f cm',dist1));
pause(2)
delete(h) 
end