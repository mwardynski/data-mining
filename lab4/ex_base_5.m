% Porównanie wyników z punktów 3 I 4:
% 
% Punkt 3 – średnie kroczące mają zdefiniowane okno czasowe, które wpływa na 
% wartość średniej w wybranym punkcie. Generalnie, czym większe okno czasowe, 
% tym średnia bardziej wygładzona i mniej wrażliwa na lokalne wahania wykresu funkcji. 
% Analogicznie, średnia krocząca o wąskim oknie czasowym podąża wiernie za 
% funkcją wejściową i tylko w małym stopniu odbiega od wartości 
% funkcji – wygładzenie też jest odpowiednio mniejsze.
%
% Opisaną zależność widać na wykresach dołączonych w zadaniu 3, 
% a szczególnie na wizualizacji rezyduów. Widać tam, że MA15 odbiega 
% od wartości danych wejściowych w największym stopniu, a MA5 
% najmniej – najlepiej można to dostrzec w okresach, gdzie dane wejściowe 
% charakteryzowały się największą zmiennością. 
%
% Jednocześnie, w głównej części wykresu widać, że MA15 jest najbardziej 
% wypłaszczona ze wszystkich przedstawionych linii.
% Średnie kroczące dają nam dużą elastyczność i poprzez odpowiedni dobór okna 
% czasowego pozwalają aproksymować przebieg danych krótko-, 
% jak i długoterminowych. W zadaniu używamy przedziałów raczej krótkoterminowych.


% Punkt 4 – aproksymacja wielomianem, a zwłaszcza ta wykonana na potrzeby 
% tego zadania i obejmująca cały przebieg danych wejściowych, czyli całkiem 
% szeroki horyzont czasowy (i zdecydowanie szerszy od średnich kroczących 
% użytych w poprzednim punkcie) daje najbardziej płaski przebieg funkcji 
% aproksymującej.
%
% Widzimy na wykresie rezyduów znaczące odstępstwa od wartości danych wejściowych 
% na przedziale czasowym, gdzie dane wejściowe prezentowały dużą zmienność.
% Aproksymacja taka świetnie nadaję się do analizy długoterminowych trendów, 
% z których lokalny hałas został usunięty.


% Jeszcze wspomnę, że podobny efekt do tego z punktu 4, można również uzyskać
% stosując średnie kroczące o znacznie większym oknie czasowym. 
% Używanie średnich kroczących ma też tą przewagę, że nie musimy z góry 
% określać ilości maksimów i minimów lokalnych w postaci stopnia wielomianu, 
% natomiast wyzwanie polega na prawidłowym doborze okna czasowego.
