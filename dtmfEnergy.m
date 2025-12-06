% Find row & column frequencies by max energy in signal
function [E_row, E_col] = dtmfEnergy(x, N)
    X = fft(x, N);
    [idx_row, idx_col] = dtmfIndices(N);
    E_row = abs(X(idx_row)).^2;
    E_col = abs(X(idx_col)).^2;
end