close all; clear all; clc;

dir_prefix = '/Users/fangyibkk/Documents/KneeProj/data/ma/';
in_dir_prefix = [ dir_prefix 'signal/after_dfa/' ];
out_dir_prefix = [ dir_prefix 'pdf/after_dfa/' ];
% some hack for excluding ., .., and .DS_Store

fontsize = 20;
filenames = dir([ in_dir_prefix '*.txt']);
n_file = length(filenames);
for i = 1:n_file
    
    filename = filenames(i).name;
    current_subject = strrep( filename, '.dfa.txt', '' );
    disp([ '======' current_subject '======' ])

    fileID = fopen([ in_dir_prefix filename ]);
    kneeCell = textscan(fileID,'%f');
    knee = kneeCell{1};
    fclose(fileID);
    
    plot( [1:length(knee)]./12800, knee);
    title([ 'Signal after EEMD/DFA ' current_subject ],'FontSize',fontsize); 
    xlabel('time(s)', 'FontSize', fontsize); 
    ylabel(['accelration (m/s^2)'],'FontSize',fontsize);
     
    set(gcf,'Units','Inches');
    pos = get(gcf,'Position');
    set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
    print(gcf,[ out_dir_prefix 'signal-after-DFA-' current_subject '.pdf'],'-dpdf','-r300')
    close all;
    
end 
    
