function plot_fractures(lfs,thetafs,xfs,yfs,L,H)
    
    fig1 = figure();
    plot([0,L,L,0,0],[0,0,H,H,0],'k-','LineWidth',2.0)
    axis equal
    axis([-0.1*L,1.1*L,-0.1*H,1.1*H])
    axis off
    hold on
    
    Nf = length(xfs);
    for i=1:Nf
        
        l = lfs(i);
        theta = thetafs(i);
        x = xfs(i);
        y = yfs(i);
        
        x1 = x - (l/2)*cos(theta);
        x2 = x + (l/2)*cos(theta);
        y1 = y - (l/2)*sin(theta);
        y2 = y + (l/2)*sin(theta);
        
        plot([x1,x2],[y1,y2],'-','LineWidth',1,'Color',[0.4,0.4,0.4])
        
    end
    
end