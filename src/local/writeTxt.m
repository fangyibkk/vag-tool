function [] = writeTxt( out_path, data )

%% WARNING if dir not exists, this will lead to error
    fileID = fopen([ out_path '.txt' ], 'w');
    fprintf( fileID, '%f\n', data );
    fclose( fileID );
    fprintf( 'finish %s \n', out_path )

end
