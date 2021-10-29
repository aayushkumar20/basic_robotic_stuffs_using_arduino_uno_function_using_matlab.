clear;
a = arduino('COM4', 'Uno', 'Libraries', {'Ultrasonic', 'Servo'});
sensor = ultrasonic(a, 'D12', 'D13');
servo_motor = servo(a, 'D3');
i = 1;
table = zeros(180,2);
for theta = 0 : 1/180 : 1
    writePosition(servo_motor, theta);
    dist1 = readDistance(sensor)*170;
    pause(.04);
    dist2 = readDistance(sensor)*170;
    dist = (dist1+dist2)/2;
    table(i,1) = (i-1);
    table(i,2) = round(dist * 100,2);
    i = i + 1;
    writeDigitalPin(a, 'D6', 1);
    writeDigitalPin(a, 'D5', 0);
end
j = 1;
for theta = 1 : -1/180 : 0
    writePosition(servo_motor, theta);
    dist1 = readDistance(sensor)*170;
    pause(.04);
    dist2 = readDistance(sensor)*170;
    dist = (dist1+dist2)/2;
    table(i-j,2) = (table(i-j,2) + round(dist * 100,2))/2;
    j = j + 1;
    writeDigitalPin(a, 'D6', 0);
    writeDigitalPin(a, 'D5', 1);
end
polarplot (table(:,1)*pi/180, table (:,2));
title('Map of the Environment');
thetalim([0 180]);
grid on;