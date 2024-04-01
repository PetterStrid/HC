% import

% trees = readtable("TAB_C_0320.xlsx");
% 
% trees2 = table2array(trees(2:end,3:end)); 

trees = xlsread('TAB_C_0320.xlsx');

%%

trees2 = trees(:,2:end);

for n = 1:size(trees2,2)
    
    start(n) = find(isnan(trees2(:,n)) == 0, 1)
    
end

[i,j] = sort(start) 

treesSorted = trees2(:,j)
%% wrong Resolution
for n = 1:size(treesSorted,2)
    if nanmean(treesSorted(:,n))>2
        treesSorted(:,n) = treesSorted(:,n)/20;
    end          
end


%% plot
yrs = trees(:,1);

% figure
% meanGrowth = nanmean(treesSorted);
% bar(meanGrowth)



yLag = 0;
figure(1)
for n = 1: size(trees2,2)
    
    plot(yrs, treesSorted(:,n)+yLag,'color',[0.2 0.6 0.9])
    yLag = yLag + 1;
    
    hold on 
    
    
end
xlim([1000 2050])
grid on 

%%

figure(2)
n = 69
plot(yrs, treesSorted(:,n))

grid on