function [idx_row, idx_col] = dtmfIndeces(N)
    % Approximate indeces for known frequencies

    % N is length of samples for fft
    % Tested N was 2048

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