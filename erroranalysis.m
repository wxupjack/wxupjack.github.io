[num,txt] =xlsread('erlangbfulltable.xlsx')
table = zeros(102,27);
table(1,:) = num(1,:);%pb
table(:,1) = num(:,1);%channel
for i=2:102
    for j=2:27
        table(i,j) = inverlangb(table(i,1),table(1,j));
    end
end
delta = abs(table-num)./num;
surf(table(1,:),table(:,1),delta);