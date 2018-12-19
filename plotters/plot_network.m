function plot_network(xns,yns,CC,L,H)
    
    fig1 = figure();
    plot([0,L,L,0,0],[0,0,H,H,0],'k-','LineWidth',2.0)
    axis equal
    axis([-0.1*L,1.1*L,-0.1*H,1.1*H])
    axis off
    hold on
    
    Nn = length(xns);
    for i=1:Nn
        for j=i+1:Nn
            if CC(i,j)>0
                plot([xns(i),xns(j)],[yns(i),yns(j)],'-','LineWidth',1)
            end
        end
    end
    for i=1:Nn
        plot(xns(i),yns(i),'*')
    end
    
end