Fs = 8192;
n = 0:999;

% Digits 0 - 9 as signals of two sinusoids
function digits = dtmfDigits(n)
    % n is the length of samples

    d0 = sin(0.7217*n) + sin(1.0247*n);
    d1 = sin(0.5346*n) + sin(0.9273*n);
    d2 = sin(0.5346*n) + sin(1.0247*n);
    d3 = sin(0.5346*n) + sin(1.1328*n);
    d4 = sin(0.5906*n) + sin(0.9273*n);
    d5 = sin(0.5906*n) + sin(1.0247*n);
    d6 = sin(0.5906*n) + sin(1.1328*n);
    d7 = sin(0.6535*n) + sin(0.9273*n);
    d8 = sin(0.6535*n) + sin(1.0247*n);
    d9 = sin(0.6535*n) + sin(1.1328*n);
    
    digits = {d0,d1,d2,d3,d4,d5,d6,d7,d8,d9};
end

% Create a phone number signal
function phone = createPhoneSignal(digits, number)
    % Digits is from function dtmfDigits()
    % Number is an array with length of digits

    space = zeros(1,100);   % Empty Space of 100 Samples
    phone = [];             % Create array for phone number
    for k = 1:numel(number) % Loop to create phone number
        phone = [phone digits{number(k)+1} space];
    end
end