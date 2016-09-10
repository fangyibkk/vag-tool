function [] = time_routine_without_ylim( plot_title, knee )
    fontsize = 12;
    plot( [1:length(knee)]./12800, knee );
    title( plot_title, 'FontSize', fontsize );
    xlabel('time (s)', 'FontSize', fontsize);
    ylabel('acceleration (m/s^2)', 'FontSize', fontsize);
    xlim([0 15]); 
end
