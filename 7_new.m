clc; close all;

t = -5:0.01:5; f = 2; w = 2 * pi * f;
ts = -5:1/(w * 250 / pi):5;
y = @(t) sin(w * t);
q = sign(y(ts));

z = sum(q' .* sinc(w * (t - ts')), 1) * (max(y(t)) / max(sum(q' .* sinc(w * (t - ts')), 1)));

subplot(311), plot(t, y(t), 'linewidth', 2), title('Original signal')
subplot(312), plot(ts, q), title('SDQ signal')
subplot(313), plot(t, z, 'linewidth', 2), title('Reconstructed signal')

figure, plot(t, y(t), 'linewidth', 2), hold on, plot(t, z, 'linewidth', 2), title('Original vs Reconstructed')

figure, plot(abs(z - y(t)), 'linewidth', 0.5), title('Error')

figure
subplot(311), plot(abs(fftshift(fft(y(t)))) / length(t)), title('Spectrum of original')
subplot(312), plot(abs(fftshift(fft(q))) / length(ts)), title('Spectrum of SDQ')
subplot(313), plot(abs(fftshift(fft(z))) / length(t)), title('Spectrum of recovered')

