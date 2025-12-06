function [E_row, E_col] = dtmfEnergy(x, N)
    % Find row & column frequencies by max energy in signal
    X = fft(x, N);
    [idx_row, idx_col] = dtmfIndeces(N);
    E_row = abs(X(idx_row)).^2;
    E_col = abs(X(idx_col)).^2;
end