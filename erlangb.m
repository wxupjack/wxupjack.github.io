%implemention of erlangB function
function pb = erlangb(m, E)

if m==0
    pb = 1;
else
    pb = E ./ (m ./ erlangb(m-1 , E) + E);
end