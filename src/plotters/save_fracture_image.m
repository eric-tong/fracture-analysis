function save_fracture_image(filename)

    set(gcf,'PaperUnits','inches')
    figw = 9;
    figh = 6;
    
    set(gcf,'PaperPosition',[-1.15 -1.3 figw figh])
    set(gcf,'PaperSize',[figw-2 figh-2.4])
    
    print(gcf,'-dpdf',['B1/figs/' filename '.pdf']);
    
end