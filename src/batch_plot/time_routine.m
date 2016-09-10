function [] = time_routine( plot_title, knee )
  % usage: time_routine( plot_title, knee )
  % plot VAG in time domain input is VAG signal array
  % the script will help adjust fontsize, x,y label and add time x-axis scale
  % which use default value of sampling frequency 12800Hz
    fontsize = 12;
    plot( [1:length(knee)]./12800, knee );
    title( plot_title, 'FontSize', fontsize );
    xlabel('time (s)', 'FontSize', fontsize);
    ylabel('acceleration (m/s^2)', 'FontSize', fontsize);
    xlim([0 15]); ylim([-7.5 7.5]);
end
