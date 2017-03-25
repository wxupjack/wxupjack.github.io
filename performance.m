m = 500;

% recursion algorithm
for E = 1:1:1100;
    tic;
    y1 = erlangb(m,E);
    time1(E) = toc;
end
E = 1:1:1100;
plot(E,time1);
hold on;

% direct calculation
for E = 1:1:1100;
    tic;
    y2 = direct_erlangb(m,E);
    time2(E) = toc;
end
E = 1:1:1100;
plot(E,time2);