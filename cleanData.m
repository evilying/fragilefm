clear; 

dataDir = '../'; 

namefile = 'data.xlsx'; 
matcase = xlsread(fullfile(dataDir, namefile)); 

nanColloc = find(all(isnan(matcase))); 
matcase(:, nanColloc) = []; 

missColloc = find(all(matcase < 0)); 
matcase(:, missColloc) = []; 

missloc = find(matcase < 0); 
matcase(missloc) = -999; 
nanloc = find(isnan(matcase));
matcase(nanloc) = -999; 

matcase = double(matcase); 

xlswrite(fullfile(dataDir, 'clean.xlsx'), matcase); 