close all;

dir_prefix = '/Users/fangyibkk/Documents/KneeProj/data/ma/';

in_dir_hp = [ dir_prefix 'signal/after_hp/' ];
in_dir_dfa = [ dir_prefix 'signal/after_dfa/' ];

out_dir_hp = [ dir_prefix 'pdf/signal/after_hp/' ];
out_dir_dfa = [ dir_prefix 'pdf/signal/after_dfa/' ];

filenames = dir([ in_dir_hp '*.txt']);
n_file = length(filenames);

for i = 1:n_file
    
    filename = filenames(i).name;
    disp([ '======' filename '======' ])

    %% open file and get signal
    disp([ 'process on filename: ' filename ])
    fileID = fopen([ in_dir_hp filename ]);
    kneeCell = textscan(fileID,'%f');
    knee = kneeCell{1};
    fclose(fileID);

    subject_name = strrep( filename, '.txt', '');
    
    %% High pass plot section
    figure( 100+i ) 
    plot_title = [ 'High pass filtered signal of ' subject_name ];

    time_routine_without_ylim( plot_title, knee )

    hpYTick = get( gca, 'YTick' );
    hpYLim = get( gca, 'YLim' );

    save_figure([ out_dir_hp 'time-hp-' subject_name ]);
    close all;
    
    %% open file and get signal
    disp([ 'process on filename: ' filename ])
    fileID = fopen([ in_dir_dfa filename ]);
    kneeCell = textscan(fileID,'%f');
    knee = kneeCell{1};
    fclose(fileID);

    subject_name = strrep( filename, '.txt', '');
    %% Reconstructed plot section
    figure( 200+i )

    plot_title = [ 'Reconstructed signal of ' subject_name ];
    time_routine_without_ylim( plot_title, knee )
    set( gca, 'YTick', hpYTick );
    set( gca, 'YLim', hpYLim );
    
    save_figure([ out_dir_dfa 'time-dfa-' subject_name ]);
    close all;

end
