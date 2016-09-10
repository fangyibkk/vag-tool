close all;
% dir_prefix = '~/Documents/KneeProj/data/ma/signal/after_ma/';
dir_prefix = '~/Documents/KneeProj/data/ma/signal/after_dfa/';
figure()

%%for indexing a subplot
j = 1;


%%resurface
% filenames = { ...
%     'subject1-1.txt',...
%     'subject7-R1.txt',...
%     'subject9-L1.txt',...
%     'subject9-R1.txt',...
%     'subject10-L1.txt',...
%     'subject10-R1.txt'};

%%nonresurface
% filenames = { ...
%     'subject3-R1.txt',...
%     'subject4-R1.txt',...
%     'subject6-L1.txt',...
%     'subject6-R1.txt',...
%     'subject7-L1.txt',...
%     'subject8-R1.txt'};

%%subject6
filenames = { ...
    'subject6-L1.txt',...
    'subject6-L3-FreeFall.txt',...
    'subject6-R1.txt',...
    'subject6-R3-FreeFall.txt',...
    'subject6-R4-Lay-Assist.txt',...
    'subject6-R5-Lay-Self.txt'};

for i = 1:length(filenames)
    
        fileID = fopen([ dir_prefix filenames{i} ]);
        kneeCell = textscan(fileID,'%f');
        knee = kneeCell{1};
        fclose(fileID);

        plot_title = strrep(filenames{i}, '.txt', '');
        plot_title = strrep(plot_title, 'subject', 'S');
        
        subplot(['32' num2str(j)])
        j = j+1;
        
        stft_routine( plot_title, knee )
        % time_routine( plot_title, knee );
        
end

%% STFT

out_dir_prefix = './figures/';
% save_six_figure_with_colorbar([ out_dir_prefix 'stft-hp-resurface' ])
% save_six_figure_with_colorbar([ out_dir_prefix 'stft-dfa-resurface' ])
% save_six_figure_with_colorbar([ out_dir_prefix 'stft-hp-nonresurface' ])
% save_six_figure_with_colorbar([ out_dir_prefix 'stft-dfa-nonresurface' ])
% save_six_figure_with_colorbar([ out_dir_prefix 'stft-hp-subject6-all' ])
save_six_figure_with_colorbar([ out_dir_prefix 'stft-dfa-subject6-all' ])


%% time 

% save_figure([ out_dir_prefix 'time-hp-resurface' ])
% save_figure([ out_dir_prefix 'time-dfa-resurface' ])
% save_figure([ out_dir_prefix 'time-hp-nonresurface' ])
% save_figure([ out_dir_prefix 'time-dfa-nonresurface' ])
% save_figure([ out_dir_prefix 'time-hp-subject6-all' ])
% save_figure([ out_dir_prefix 'time-dfa-subject6-all' ])
