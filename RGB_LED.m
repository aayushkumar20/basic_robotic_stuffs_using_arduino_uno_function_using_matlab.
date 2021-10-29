
% RGB LED control
clear
a = arduino('com4', 'uno');

writePWMVoltage(a, 'D6', 0)% R
writePWMVoltage(a, 'D5', 0)% G
writePWMVoltage(a, 'D3', 5)% B

