rng(42); Fs = 1000; t = 0:1/Fs:1-1/Fs;

lp = lowpass(randn(size(t))-mean(randn(size(t))), 50, Fs);
bp = bandpass(randn(size(t))-mean(randn(size(t))), [175, 225], Fs);

subplot(4, 1, 1); plot(t, lp); title('Lowpass'); grid on;
subplot(4, 1, 2); plot(t, bp); title('Bandpass'); grid on;

[psd, f] = pwelch(lp, [], [], [], 1); subplot(4, 1, 3); plot(f, psd);
[psd, f] = pwelch(bp, [], [], [], 1); subplot(4, 1, 4); plot(f, psd);
