 list_stft_or_time = { 'stft', 'time' };
 list_processing_type = { 'sr' };
 list_alpha_criterion = { 'discard_lt_0.5', 'discard_gt_0.5'};
 list_data_type_category = { 'resurface', 'non-resurface', 'subject-6', 'has-sound' };

 for i = 1:length(list_stft_or_time)
     for j = 1:length(list_processing_type)
         for k = 1:length(list_alpha_criterion)
             for l = 1:length(list_data_type_category)
                 % fprintf('working on %s: %s/%s class %s \n', list_stft_or_time{i}, list_processing_type{j}, list_alpha_criterion{k}, list_data_type_category{l} );
                 batch( list_stft_or_time{i}, list_processing_type{j}, list_alpha_criterion{k}, list_data_type_category{l} );
             end
         end
     end
 end
