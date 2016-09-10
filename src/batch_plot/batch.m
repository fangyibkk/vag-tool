function [] = batch( stft_or_time, processing_type, alpha_criterion, data_type_category )
% batch( stft_or_time, processing_type, alpha_criterion, data_type_category )
% arguments
%  (1) stft_or_time = 'stft' OR 'time'
%  (2) processing_type = 'sr' OR 'hp' OR 'raw'
%  (3) alpha_criterion = 'discard_lt_0.5' OR 'discard_gt_0.5';
%  (4) data_type_category = 'resurface' OR 'non-resurface' OR
% 'subject-6' OR 'has-sound';

    close all;

    if strcmp( processing_type, 'raw')
        dir_prefix = ['~/Documents/knee-project/data/' ]
        in_dir_prefix = [ dir_prefix 'txt_data/'];
    else 
        dir_prefix = ['~/Documents/knee-project/data/' processing_type '/'];
        sig_dir_prefix = [ dir_prefix 'signal/' ];
        % in_dir_prefix = [ dir_prefix 'after_' processing_type '/' ];
        in_dir_prefix = [ sig_dir_prefix 'after_dfa/' alpha_criterion '/'];
    end
    figure()

    %% for indexing a subplot
    j = 1;

    filenames = get_filename_list(data_type_category);

    for i = 1:length(filenames)

        knee = getTxt([ in_dir_prefix filenames{i} ]);
        
        %% add spike
        if ~strcmp( processing_type, 'raw' )
            knee = add_spike( [ sig_dir_prefix 'spike/' filenames{i} ], knee );
        end

        plot_title = strrep(filenames{i}, '.txt', '');
        plot_title = strrep(plot_title, 'subject', 'S');
        
        subplot(['32' num2str(j)])
        j = j+1;
        
        if( strcmp( stft_or_time, 'time' ) )
            time_routine( plot_title, knee );
        else
            stft_routine( plot_title, knee )
        end
        
    end

    %% out dir 

    out_dir_prefix = [ './figures/' processing_type '/' alpha_criterion '/'];
    if ~exist( out_dir_prefix, 'dir' )
        fprintf('Directory %s not exists. Going to make one.');
        mkdir( out_dir_prefix );
    end;

    out_title = [ out_dir_prefix stft_or_time '-' processing_type ...
                  '-' strrep(alpha_criterion, '_', '-') '-' ...
                  data_type_category ];
    if( strcmp( stft_or_time, 'time' ) )
        save_figure( out_title, 'epsc' );
    else
        save_six_figure_with_colorbar( out_title, 'epsc' );
    end


end
