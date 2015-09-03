function DrawPic(data,pos)
    plot(data(:,1),data(:,2),'.');
    hold on;
    axis ij;
    axis off;
    city = size(data,1);
    res = zeros(city+1,2);
    res(1:city,:) = data(pos,:);
    res(city+1,:) = data(pos(1),:);
    plot(res(:,1),res(:,2),'-');
    drawnow;
    hold off;
end