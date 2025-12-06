Fs = 8192;
N = 2048;
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

% Approximate indeces for known frequencies
function [idx_row, idx_col] = dtmfIndices(N)
    % N is length of samples for fft

    % Row & Columns of Frequencies
    row = [0.5346 0.5906 0.6535 0.7217];
    column = [0.9273 1.0247 1.1328];
    % 0-based indices for row/column tones
    k_row = round(row*N/(2*pi));
    k_column = round(column*N/(2*pi));
    % 1-based indices for row/column tones
    idx_row = k_row    + 1;         % k = [175 194 214 236]
    idx_col = k_column + 1;      % k = [303 335 370]
end

% Find row & column frequencies by max energy in signal
function [E_row, E_col] = dtmfEnergy(x, N, idx_row, idx_col)
    X = fft(x, N);
    E_row = abs(X(idx_row)).^2;
    E_col = abs(X(idx_col)).^2;
end