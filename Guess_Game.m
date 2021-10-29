clear
a = arduino('com4', 'uno');
r = randi([1,10]);
numb = 0;
n = 0;
Numb=[];
while numb ~= r
    prompt = {'Guess the number between 1 and 10: '};
     numb1=inputdlg(prompt)
     numb=str2double(numb1)
 %   numb = uinput('Guess the number between 1 and 20: ');
    if ~ismember(numb,Numb)
        n = n+1;
        Numb=[Numb,numb];
    end
    if numb < r
        writePWMVoltage(a, 'D6', 5)% R
        writePWMVoltage(a, 'D5', 0)% G
        writePWMVoltage(a, 'D3', 0)% B
        uiwait(msgbox('Your guess is below actual number'));
    elseif numb > r
   %     fprintf('Your guess (%i) is above the actual number \n', numb)
        writePWMVoltage(a, 'D6', 0)% R
        writePWMVoltage(a, 'D5', 0)% G
        writePWMVoltage(a, 'D3', 5)% B
        uiwait(msgbox('Your guess is above actual number'));
    else
        %fprintf('Congratulations, you guessed the right number %d!\n', r)
        writePWMVoltage(a, 'D6', 0)% R
        writePWMVoltage(a, 'D5', 5)% G
        writePWMVoltage(a, 'D3', 0)% B
        uiwait(msgbox('BINGO'));
    end
end