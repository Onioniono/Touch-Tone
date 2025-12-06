function digits = dtmfDecode(x, fs)
    % Decode a touch-tone (DTMF) signal into its corresponding digits

    % x is a signal containing a 7 digit phone number
    % fs is sampling rate

    % Moving-average filter on the Magnitude
    winDur = 0.01;
    winLen = max(1, round(winDur*fs));
    avg = conv(abs(x), ones(1,winLen)/winLen, 'same');
    avg = avg / max(avg + eps); % normalize to [0,1]

    % Threshold to detect tone vs silence
    thr = 0.2;
    isTone = avg > thr;

    % Find rising/falling edges
    d = diff([0 isTone 0]);         % Edge Padding
    toneStarts = find(d == 1);      % Rising Edge
    toneEnds = find(d == -1) - 1;   % Falling Edge
    
    % 1x7 vector w/ temp "???????"
    digits = repmat('?', 1, 7);

    % Decode each segment
    for k = 1:7
        seg = x(toneStarts(k):toneEnds(k));
        digits(k) = decodeSingleDigit(seg);
    end
end

function digit = decodeSingleDigit(x)
    digitMap = ['1','2','3'; '4','5','6'; '7','8','9'; '?','0','?'];
    idxRow = [175 194 214 236];
    idxCol = [303 335 370];

    N = 2048;
    X = fft(x, N);
    E_row = abs(X(idxRow)).^2;    % energy at row freqs
    E_col = abs(X(idxCol)).^2;    % energy at col freqs

    [~, maxRow] = max(E_row);
    [~, maxCol] = max(E_col);

    digit = digitMap(maxRow, maxCol);
end