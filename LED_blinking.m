clear;
a = arduino('com4', 'uno');     

% start the loop to blink led for 10 seconds

for i = 1:10

    writeDigitalPin(a, 'D10', 1);

    pause(0.5);

    writeDigitalPin(a, 'D10', 0);

    pause(0.5);

end