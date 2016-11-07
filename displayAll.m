function displayAll(data)
z=1;
    for i=1:8
        for j=1:8
        subplot(8,8,z);
        if(any(squeeze(data(i,j,:))>25))
           plot(squeeze(data(i,j,:)));

        else
            plot(squeeze(data(1,2,:)));
        end
        title([int2str(z) 'ith Plot']);
        z=z+1;
        end
    end
end
%any(squeeze(cutCube.A1(1,1,:))>200)