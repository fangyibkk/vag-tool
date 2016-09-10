function knee = getTxt( filepath ) 
    disp([ 'read filepath: ' filepath ])
    fileID = fopen( filepath );
    dataCell = textscan(fileID,'%f');
    fclose(fileID);
    knee = dataCell{1};
end
