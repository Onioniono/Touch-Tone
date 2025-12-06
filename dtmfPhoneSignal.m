function phone = dtmfPhoneSignal(number)
    % Create a phone number signal

    % Tones is from function dtmfDigits()
    % Number is an array with length of digits
    
    n = 0:999;
    tones = dtmfDigits(n);
    
    space = zeros(1,100);   % Empty Space of 100 Samples
    phone = [];             % Create array for phone number
    for k = 1:numel(number) % Loop to create phone number
        phone = [phone tones{number(k)+1} space];
    end
end