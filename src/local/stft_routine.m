function [] = stft_routine( plot_title, knee )    

    fontsize = 12;
    Nx = length(knee);
    % Each window has length of 1% of overall signal length
    nwindow = floor(Nx/100);
    % Specify 25% overlap between contiguous sections.
    noverlap = floor(nwindow/2);
    f_sampling = 12800;
    f_limit = 1000; % 500Hz
    t_lim = 20;

    % Obtain power spectral density in decibel
    spectrogram( knee, kaiser(nwindow,4), noverlap, Nx, f_sampling, 'yaxis');

    ylim([ 0 1000 ])
    xlim([ 0 15 ])
    % zlim([ -100 -40 ])

    % IMPORTANT: otherwise the color will mislead the result
    caxis([ -100 -40 ])

    % set( gcf,'LineStyle','none')
    xlabel('time(s)', 'FontSize', fontsize ); 
    ylabel('frequency(Hz)', 'FontSize', fontsize );
    title( plot_title, 'FontSize', fontsize );

end
