dataDir = '../'; 

namefile = 'featuresName.csv'; 

% open file 
fileId = fopen(fullfile(dataDir, namefile), 'r'); 
line = fgetl(fileId); 

nCols = 12949; 
featList = textscan(line, repmat('%s', 1, nCols), 'Delimiter', ','); 

featIndice = sort(missColloc); 

% feats(:) = featList{1, featIndice}; 

feats = cell(1, size(featIndice, 2)); 

for i = 1: length(feats)
    
    feats{i} = char(featList{1, featIndice(i)}); 
end

allIndice = 1: 12949; 
importfeatIndice = sort(setdiff(allIndice, featIndice)); 

importFeats = cell(1, size(importfeatIndice, 2)); 

for i = 1: length(importFeats)
    
    importFeats{i} = char(featList{1, importfeatIndice(i)}); 
end

% speciDelloc = [158: 167, 306: 315, 534: 543, 784: 793, 1047: 1056];
% xlswrite('importfeatures.csv', importFeats(setdiff(1: length(importFeats), speciDelloc))'); 

xlswrite('importfeatures.xlsx', importFeats(:)); 
xlswrite('desertedfeatures.xlsx', [feats(:); importFeats(speciDelloc)']); 

fclose(fileId); 