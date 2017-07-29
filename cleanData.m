clear; 

dataDir = '../'; 

namefile = 'data.xlsx'; 
matcase = xlsread(fullfile(dataDir, namefile)); 

nthreshold = floor(size(matcase, 1) * 0.3); 

nanColloc = find(all(isnan(matcase))); 
matcase(:, nanColloc) = []; 

missColloc = sum(matcase < 0) > nthreshold; 
matcase(:, missColloc) = []; 

missloc = find(matcase < 0); 
matcase(missloc) = -999; 
nanloc = find(isnan(matcase));
matcase(nanloc) = -999; 

matcase = double(matcase); 

xlswrite(fullfile(dataDir, 'clean.xlsx'), matcase); 