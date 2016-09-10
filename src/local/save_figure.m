function [] = save_figure( out_title, file_type )
% out_title is the output title NOT including file type suffix
% file_type is either 'epsc' or 'pdf'

    set(gcf,'Units','Inches');
    pos = get(gcf,'Position');
    set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])

    if strcmp( file_type, 'pdf' )
        print(gcf, out_title, '-dpdf', '-r300')
    elseif or( strcmp( file_type, 'eps' ), strcmp( file_type, 'epsc') )
        print(gcf, out_title, '-depsc')
    else 
        error(['Neither eps nor pdf file type.'...
               'Please check your input argument.']);
    end

end
