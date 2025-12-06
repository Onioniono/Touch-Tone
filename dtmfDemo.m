function dtmfDemo()
    % dtmfDemo: Small demo for generating & analyzing a DTMF phone signal
    Fs = 8192;          % sample rate
    N  = 2048;          % FFT length
    n  = 0:999;         % sample indices for each digit

    playAllDigits(n);    % OPTIONAL: Listen to every Digit
    pause(1);
    
    number = [2 0 1 3 2 2 2];         % Example phone number
    phone = dtmfPhoneSignal(number);  % Generate phone signal from digits
    fprintf("\nPlaying Phone Number\n");
    sound(phone, Fs);                 % OPTIONAL: Listen to Phone Number
    pause(2);

    firstDigit = phone(1:1000);                 % Take first digit of example
    [E_row, E_col] = dtmfEnergy(firstDigit, N); % Generage Energy Values
    printRowEnergies(E_row);                    % Print every row energy
    printColEnergies(E_col);                    % Print every column energy
end

function playAllDigits(n)
    Fs = 8192;

    digits = dtmfDigits(n);

    for k = 1:10
        fprintf("Playing digit %d...\n", k-1);
        sound(digits{k}, Fs);
        pause(0.2);
    end
end

function printRowEnergies(E_row)
    for i = 1:numel(E_row)
        fprintf("\nEnergy at E_row(%d) is %f", i, E_row(i));
    end
    fprintf("\n");
end

function printColEnergies(E_col)
    for i = 1:numel(E_col)
        fprintf("\nEnergy at E_col(%d) is %f", i, E_col(i));
    end
    fprintf("\n");
end