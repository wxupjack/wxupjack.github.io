function pb = direct_erlangb(m, E)
denominator = 0;
if m ==0
    pb = 1;
else
%calculate denominator first
for i=0:m
	denominator = denominator + E .^ i ./ factorial(i);
end
pb = E .^ m ./ factorial(m) ./ denominator;
end;