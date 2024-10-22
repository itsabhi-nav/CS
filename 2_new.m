% Rolling N Dice
central_limit_theorem(2, 10000);
function central_limit_theorem(N, num_trials)
    histogram(sum(randi([1, 6], num_trials, N), 2), 'Normalization', 'probability', 'BinWidth', 1, 'EdgeColor', 'w');
    title(sprintf('Central Limit Theorem for Rolling %d Dice %d times', N, num_trials));
    xlabel('Sum of Dice Rolls'); ylabel('Probability');
end

% Tossing N Coins
central_limit_theorem_coins(100, 10000);
function central_limit_theorem_coins(N, num_tosses)
    histogram(sum(randi([0, 1], num_tosses, N), 2), 'Normalization', 'probability', 'BinWidth', 1, 'EdgeColor', 'w');
    title(sprintf('Central Limit Theorem for Tossing %d Coins %d times', N, num_tosses));
    xlabel('Heads'); ylabel('Probability');
end
