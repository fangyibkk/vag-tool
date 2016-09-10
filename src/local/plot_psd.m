function [] = plot_psd( plot_title, x, fs)

%% alternatively use periodogram but this function
% doesn't normalize the frequency

    fontsize = 12;
    
    N = length(x);
    xdft = fft(x);
    xdft = xdft(1:N/2+1);
    % normalized
    psdx = (1/(2*pi*N)) * abs(xdft).^2;
    % move minus freq to plus but it's symmetric so x2
    psdx( 2:end-1 ) = 2*psdx( 2:end-1 );
    
    % freq = 0:(2*pi)/N:pi;
    freq = [ 0:fs/N:fs/2 ];

    plot(freq,10*log10(psdx))
    grid on
    title( plot_title, 'FontSize', fontsize )
    xlabel('Frequency (Hz)', 'FontSize', fontsize )
    ylabel('Power/Frequency (dB/rad/sample)', 'FontSize', fontsize )

end
