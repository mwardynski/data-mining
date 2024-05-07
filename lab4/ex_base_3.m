
ma5 = movmean(Dane, 5);
ma10 = movmean(Dane, 10);
ma15 = movmean(Dane, 15);

ma5_r = Dane - ma5;
ma10_r = Dane - ma10;
ma15_r = Dane - ma15;

figure;

subplot(2, 1, 1);
hold on;
plot(Dane, 'b');
plot(ma5, 'r')
plot(ma10, 'y')
plot(ma15, 'g')
title('Dane');
legend('Dane', 'MA5', 'MA10', 'MA15');
hold off;

subplot(2, 1, 2);
hold on;
plot(ma5_r, 'r')
plot(ma10_r, 'y')
plot(ma15_r, 'g')
title('Residua srednich kroczacych');
legend('Rezidua MA5', 'Rezidua MA10', 'Rezidua MA15');
hold off;