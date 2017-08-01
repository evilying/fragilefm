dataDir = '../'; 

% namefile = 'data.xlsx'; 
% matcase = xlsread(fullfile(dataDir, namefile)); 

matcase = data(:, [1, 8: end]); 

nthreshold = floor(size(matcase, 1) * 0.3); 

nanColloc = find(all(isnan(matcase))); 

missloc = find(matcase < 0); 
matcase(missloc) = -999; 
nanloc = find(isnan(matcase));
matcase(nanloc) = -999; 

missColloc = find(sum(matcase < 0) > nthreshold); 

% matcase(:, nanColloc) = []; 
matcase(:, missColloc) = []; 

matcase = double(matcase); 
% speciDelloc = [158: 167, 306: 315, 534: 543, 784: 793, 1047: 1056];
% matcase = matcase(:, setdiff(1: size(matcase, 2), speciDelloc)); 

ncase = size(matcase, 1); 
nfeatures = size(matcase, 2); 

% % fill the empty
% for ifeat = 1: nfeatures
%     
%     colsample = matcase(:, ifeat); 
%     if (sum(any(colsample < 0, 2)) == 0)
%         
%         continue; 
%     end
%     colNegInd = find(any(colsample < 0, 2)); 
%     colPosInd = setdiff(1: ncase, colNegInd); 
%     value = mean(colsample(colPosInd)); 
%     matcase(colNegInd, ifeat) = repmat(value, 1, length(colNegInd)); 
% end

xlswrite(fullfile(dataDir, 'clean-v6.xlsx'), matcase); 