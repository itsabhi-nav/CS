% Define input parameters
N = 10; a = floor(2 * rand(1, N));  % Random binary input
A = 5; Tb = 1; fs = 100;            % Modulation parameters

% Initialize signals
U = []; U_rz = []; P = []; P_rz = []; B = []; B_rz = []; M = [];

% Generate modulation signals
for k = 1:N
    % Common pulse shapes
    p_rz = [ones(1, fs/2), zeros(1, fs/2)];
    manch = [ones(1, fs/2), -1 * ones(1, fs/2)];
    
    % Unipolar NRZ & RZ
    U = [U A * a(k) * ones(1, fs)];
    U_rz = [U_rz A * a(k) * p_rz];
    
    % Polar NRZ & RZ
    polar = ((-1)^(a(k) + 1)) * A;
    P = [P polar * ones(1, fs)];
    P_rz = [P_rz polar * p_rz];
    
    % Bipolar NRZ & RZ-AMI
    bipolar = (-1)^k * A * (a(k) == 1);
    B = [B bipolar + A * (a(k) == 0) * ones(1, fs)];
    B_rz = [B_rz bipolar * p_rz + A * (a(k) == 0) * ones(1, fs)];
    
    % Manchester code
    M = [M polar * manch];
end

% Time vector
T = linspace(0, N * Tb, length(U));

% Plotting
figure(1)
subplot(4, 1, 1); plot(T, U, 'LineWidth', 2); title('Unipolar NRZ'); grid on; axis([0 N*Tb -6 6])
subplot(4, 1, 2); plot(T, U_rz, 'LineWidth', 2); title('Unipolar RZ'); grid on; axis([0 N*Tb -6 6])
subplot(4, 1, 3); plot(T, P, 'LineWidth', 2); title('Polar NRZ'); grid on; axis([0 N*Tb -6 6])
subplot(4, 1, 4); plot(T, P_rz, 'LineWidth', 2); title('Polar RZ'); grid on; axis([0 N*Tb -6 6])

figure(2)
subplot(3, 1, 1); plot(T, B, 'LineWidth', 2); title('Bipolar NRZ'); grid on; axis([0 N*Tb -6 6])
subplot(3, 1, 2); plot(T, B_rz, 'LineWidth', 2); title('Bipolar RZ / RZ-AMI'); grid on; axis([0 N*Tb -6 6])
subplot(3, 1, 3); plot(T, M, 'LineWidth', 2); title('Manchester code'); grid on; axis([0 N*Tb -6 6])
