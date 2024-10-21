tfinal = 0.01; t = 0:0.00001:tfinal;
xanalog = cos(2*pi*400*t) + cos(2*pi*700*t);

% Sampling cases
fs_list = [1400, 700, 2000]; % Critical, Under, Over Sampling frequencies
titles = {'Critical Sampling (fs=2fm)', 'Under Sampling (fs<2fm)', 'Over Sampling (fs>2fm)'};
samples = [13, 6, 19]; % Number of samples for each case

figure(1);
for i = 1:3
    fs = fs_list(i);
    tsamp = 0:1/fs:samples(i)/fs;
    xsampled = cos(2*pi*400*tsamp) + cos(2*pi*700*tsamp);
    
    % DFT
    xsampled_DFT = abs(fft(xsampled));
    xsampled_length = 0:length(xsampled_DFT)-1;
    
    % Plot DFT
    subplot(3,2,2*i-1); stem(100*xsampled_length, xsampled_DFT);
    xlabel('Frequency'); ylabel('Magnitude'); title(titles{i});
    
    % Reconstructed signal
    xreconstructed = ifft(fft(xsampled));
    subplot(3,2,2*i); plot(tsamp, xreconstructed, 'b*-');
    xlabel('Time'); ylabel('Amplitude'); title(titles{i});
end
