function [] = save_six_figure_with_colorbar( out_title, file_type )
% This is different from save_figure in a way that it include the color bar
% out_title is the output title NOT including file type suffix
% file_type is either 'epsc' or 'pdf'

    hp6 = get(subplot(3,2,6),'Position');
    colorbar('Position', [hp6(1)+hp6(3)+0.02  hp6(2)  0.03  hp6(2)+hp6(3)*2.1])
    set(gcf,'Units','Inches');
    pos = get(gcf,'Position');
    set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])

    if strcmp( file_type, 'pdf' )
        print(gcf, [ out_title '.pdf' ], '-dpdf', '-r300')
    elseif strcmp( file_type, 'eps' )
        print(gcf, [ out_title '.eps' ], '-depsc')
    else 
        error(['Neither eps nor pdf file type.'...
               'Please check your input argument.']);
    end

end
