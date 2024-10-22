rng(42); 
s1 = randn(1, 1000); 
s2 = randn(1, 1000);

% Autocorrelation
figure; plot(xcorr(s1, s2)); title('Autocorrelation'); grid on;

% Power Spectral Density
figure; pwelch(s1, [], [], [], 1); title('PSD of Signal 1'); grid on;
figure; pwelch(s2, [], [], [], 1); title('PSD of Signal 2'); grid on;
