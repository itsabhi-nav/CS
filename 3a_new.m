clc; clear; close all;

tfinal = 0.01; t = 0:0.00001:tfinal;
xanalog = cos(2*pi*400*t) + cos(2*pi*700*t);

% Analog signal
subplot(4,1,1); plot(t, xanalog, 'r-');
xlabel('Time'); ylabel('Amplitude'); title('Analog Signal');

% Sampling frequencies and titles
fs_list = [1400, 700, 2000];
titles = {'Critical Sampling (fs=2fm)', 'Under Sampling (fs<2fm)', 'Over Sampling (fs>2fm)'};

for i = 1:3
    fs = fs_list(i);
    tsamp = 0:1/fs:tfinal;
    xsampled = cos(2*pi*400*tsamp) + cos(2*pi*700*tsamp);
    
    subplot(4,1,i+1); plot(tsamp, xsampled, 'b*-');
    xlabel('Time'); ylabel('Amplitude'); title(titles{i});
end
