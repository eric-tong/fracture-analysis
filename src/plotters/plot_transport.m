function plot_transport(xns,yns,CC,QQ,nps,tps,L,H)
    
    fig1 = figure();
    plot([0,L,L,0,0],[0,0,H,H,0],'k-','LineWidth',2.0)
    axis equal
    axis([-0.1*L,1.1*L,-0.1*H,1.1*H])
    axis off
    hold on
    
    Nn = length(xns);
    
    % Plot the links, color-coded by flow rate
    cmap = colormap(hot(256));
    cmap(cmap < 0.5) = 0.8;
    cmin = min(QQ(QQ>0));
    cmax = max(QQ(QQ>0));
    for i=1:Nn
        for j=1:Nn
            if CC(i,j)>0 && QQ(i,j)>=0
                if QQ(i,j)==0
                    cind = 1;
                else
                    cind = round(200*(QQ(i,j)-cmin)/(cmax-cmin)) + 1;
                end
                plot([xns(i),xns(j)],[yns(i),yns(j)],'-','LineWidth',1,'Color',cmap(cind,:))
            end
        end
    end 
end