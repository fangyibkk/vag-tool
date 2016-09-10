function [] = stft_surf_routine( plot_title, knee )    

    Nx = length(knee);
    % Each window has length of 1% of overall signal length
    nwindow = floor(Nx/100);
    % Specify 25% overlap between contiguous sections.
    noverlap = floor(nwindow/2);
    f_sampling = 12800;
    f_limit = 1000; % 500Hz
    t_lim = 20;

    % Obtain power spectral density in decibel
    s = 20*log10(abs(spectrogram(knee, kaiser(nwindow,4), noverlap, Nx, f_sampling, 'yaxis'))/nwindow);
    % Cutting the overflow
    f_point = floor(size(s,1)*f_limit/(f_sampling/2));
    f_s_vec = [1: f_point].*((f_sampling/2)/size(s,1));

    % making x axis
    if(t_lim < (Nx/f_sampling))
        t_point = floor(size(s,2)*t_lim/(Nx/f_sampling));
    else
        t_point = size(s,2);
    end

    t_s_vec = [1: t_point].*(Nx/f_sampling/size(s,2));
    h = surf( t_s_vec,f_s_vec,s(1:f_point,1:t_point) );
    view( -45, 65 )
    xlim([ 0 20 ])
    zlim([ -100 -40 ])

    % IMPORTANT: otherwise the color will mislead the result
    caxis([ -100 -40 ])

    set(h,'LineStyle','none')
    xlabel('time(s)'); ylabel('frequency(Hz)'); zlabel('db');
    title( plot_title );

end
