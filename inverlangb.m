%inverse erlangB function
function E = inverlangb(m, pb)
E = 0.0;
testPb = 0.0;
while testPb < 0.9 * pb
    E = E + 0.1;
    testPb = erlangb(m,E);
end
while testPb < 0.99 * pb
    E = E + 0.01;
    testPb = erlangb(m,E);
end
while testPb < 0.999 * pb
    E = E + 0.001;
    testPb = erlangb(m,E);    
end
