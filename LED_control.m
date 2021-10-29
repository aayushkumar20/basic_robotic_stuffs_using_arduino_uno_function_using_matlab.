% LED control
clear
a = arduino('com4', 'uno');
writeDigitalPin(a, 'D11', 1);
writeDigitalPin(a, 'D10', 1);
pause(2)
writeDigitalPin(a, 'D11', 0);
writeDigitalPin(a, 'D10', 0);
clear



