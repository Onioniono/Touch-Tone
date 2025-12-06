function digits = dtmfDigits(n)
    % Digits 0 - 9 as signals of two sinusoids

    % n is the length of samples
    % Tested Fs (Sampled Frequency) was 8192
    
    % Matrix = ['1','2','3'; ...
    %           '4','5','6'; ...
    %           '7','8','9'; ...
    %           '?','0','?'];

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