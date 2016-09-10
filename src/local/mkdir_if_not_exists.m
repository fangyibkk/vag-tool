function [] = mkdir_if_not_exists( out_dir_list )
% receive { '/sample/out/dir1', 'sample/2', ... }
% and make that directory if it does not exist.

    for i = 1:length(out_dir_list)
        dir_to_check = out_dir_list{i}
        if ~exist( dir_to_check, 'dir' )
            fprintf('Directory %s not exists. Going to make one.');
            mkdir( dir_to_check );
        end;
    end

end
