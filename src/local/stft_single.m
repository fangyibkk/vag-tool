close all;

dir_prefix = '/Users/fangyibkk/Documents/KneeProj/data/ma/';

in_dir = [ dir_prefix 'signal/after_ma/' ];
% in_dir = [ dir_prefix 'signal/after_dfa/' ];

out_dir = [ dir_prefix 'pdf/signal/after_hp/' ];
% out_dir = [ dir_prefix 'pdf/signal/after_dfa/' ];
% out_dir = [ dir_prefix 'pdf/stft/after_hp/' ];
% out_dir = [ dir_prefix 'pdf/stft/after_dfa/' ];

filenames = dir([ in_dir '*.txt']);
n_file = length(filenames);

for i = 1:n_file
    
    filename = filenames(i).name;
    disp([ '======' filename '======' ])
    figure(i)

    disp([ 'process on filename: ' filename ])
    fileID = fopen([ in_dir filename ]);
    kneeCell = textscan(fileID,'%f');
    knee = kneeCell{1};
    fclose(fileID);

    subject_name = strrep( filename, '.txt', '');
    
    plot_title = [ 'High pass filtered signal of ' subject_name ];
    % plot_title = [ 'Reconstructed signal of ' subject_name ];
    % plot_title = [ 'STFT: high pass filtered signal of ' subject_name];
    % plot_title = [ 'STFT: reconstructed signal of ' subject_name];

    time_routine( plot_title, knee )
    % stft_routine( plot_title, knee )
    
    
    % Save single plot
    % colorbar()

    save_figure([ out_dir 'time-hp-' subject_name ]);
    % save_figure([ out_dir 'time-dfa-' subject_name ]);
    % save_figure([ out_dir 'stft-hp-' subject_name ]);
    % save_figure([ out_dir 'stft-dfa-' subject_name ]);

    close all;

end
