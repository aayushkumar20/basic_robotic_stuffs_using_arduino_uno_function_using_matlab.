clear
a = arduino('COM4','Uno',"Libraries","Ultrasonic");
sensor = ultrasonic(a,'D12','D13');
for i= 1:10
    dist1 = readDistance(sensor);
    dist1=dist1*100; % in cm
    if dist1>=15
        writeDigitalPin(a, 'D9', 1);
        writeDigitalPin(a, 'D10', 0);
    else
        writeDigitalPin(a, 'D9', 0);
        writeDigitalPin(a, 'D10', 1);
    end
    %disp(dist1)
    h=msgbox(sprintf('The distance is %0.3f cm',dist1));
    pause(2)
    delete(h)
end
clear 