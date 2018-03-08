%Gap is whether to plot air gap or not 1,0
function[sumVec] =compareScript(gap)
close all
%fiberNums={'22', '03', '04', '05', '21','22','24','33','41','42'}%Fiber nums tested
fiberNums={'42','41','33'}
small=0;%Small or large falkon
airGap=1;%New or Old Air Gap
if gap==0
    type='LFokon';%Name for plots and saving

else
    type='Air_GapSig';%Name for plots and saving
end

sumVec=[];%Vector integrals at each distance
for i=1:length(fiberNums)
    fiberNum=fiberNums{i};%sets to fiberNum active
    
    if gap==0%Load in correct data file based on data plotted
        if small==1
        load(['Data/fiber' fiberNum '_small_fokon_0.0gap.txt.mat']);
        else
         load(['Data/fiber' fiberNum '_large_fokon_0.0gap.txt.mat']);  
        end
    else
        load(['Data/fiber' fiberNum '_15mm_diag.txt.mat']);
        
    end
    
    A15=ADataDenoise;
    
    if gap==0
        if small==1
        load(['Data/fiber' fiberNum '_small_fokon_0.5gap.txt.mat']);
        else 
       load(['Data/fiber' fiberNum '_large_fokon_0.5gap.txt.mat']);  
        end
   else
        load(['Data/fiber' fiberNum '_15.5mm_diag.txt.mat']);
        
    end
    
    A15five=ADataDenoise;
    
    if gap==0
        if small==1
        load(['Data/fiber' fiberNum '_small_fokon_1.0gap.txt.mat']);
        else 
        load(['Data/fiber' fiberNum '_large_fokon_1.0gap.txt.mat']);
        end
    else
        load(['Data/fiber' fiberNum '_16mm_diag.txt.mat']);
        
    end
    
    A16=ADataDenoise;
    
    if gap==0
        if small==1
        load(['Data/fiber' fiberNum '_small_fokon_1.5gap.txt.mat']);
        else 
            load(['Data/fiber' fiberNum '_large_fokon_1.5gap.txt.mat']);
        end
    else
        load(['Data/fiber' fiberNum '_16.5mm_diag.txt.mat']);
        
    end
    
    A16five=ADataDenoise;
    
    if gap==0
        if small==1
        load(['Data/fiber' fiberNum '_small_fokon_2.0gap.txt.mat']);
        else 
         load(['Data/fiber' fiberNum '_large_fokon_2.0gap.txt.mat']);   
        end
    else
        load(['Data/fiber' fiberNum '_17mm_diag.txt.mat']);
        
    end
    A17=ADataDenoise;
    %load(['Data/fiber' fiberNum '_small_fokon_2.5gap.txt.mat']);
    %A17five=ADataDenoise;
    %load(['Data/fiber' fiberNum '_18mm_diag.txt.mat']);
    %A18=ADataDenoise;
    %FOR EACH Data distance plot the mean across the trigger dimentsion
    %color code heat map and label for each one
    figure
    subplot(2,4,1)
    imagesc(mean(A15,3));
    colorbar
    xlabel('X Position');
    ylabel('Y Position');
    title(['Fiber ' fiberNum ' 0mm' type]);
    set(gca,'fontsize',20)
    
    subplot(2,4,2)
    imagesc(mean(A15five,3));
    colorbar
    xlabel('X Position');
    ylabel('Y Position');
    title(['Fiber ' fiberNum ' 0.5mm' type]);
    set(gca,'fontsize',20)
    
    subplot(2,4,3)
    imagesc(mean(A16,3));
    colorbar
    xlabel('X Position');
    ylabel('Y Position');
    title(['Fiber ' fiberNum ' 1mm' type]);
    set(gca,'fontsize',20)
    
    subplot(2,4,4)
    imagesc(mean(A16five,3));
    colorbar
    xlabel('X Position');
    ylabel('Y Position');
    title(['Fiber ' fiberNum ' 1.5mm' type]);
    set(gca,'fontsize',20)
    
    subplot(2,4,5)
    
    imagesc(mean(A17,3));
    colorbar
    xlabel('X Position');
    ylabel('Y Position');
    title(['Fiber ' fiberNum ' 2mm' type]);
    set(gca,'fontsize',20)
    
    %{
subplot(2,4,6)
imagesc(mean(A17five,3));
colorbar
xlabel('X Position');
ylabel('Y Position');
title(['Fiber ' fiberNum ' 2.5mm Air Gap']);

subplot(2,4,7)
imagesc(mean(A18,3));
colorbar
xlabel('X Position');
ylabel('Y Position');
title(['Fiber ' fiberNum ' 3mm Air Gap']);
    %}
    %Sub plot showing the maximal ampltiude pixel ampltidue as a function
    %of distance
    subplot(2,4,6)
    aone=mean(A15,3);
    atwo=mean(A15five,3);
    athree=mean(A16,3);
    afour=mean(A16five,3);
    afive=mean(A17,3);
    %asix=mean(A17five,3);
    %aseven=mean(A18,3);
    [row col]=find(max(max(aone))==aone,1,'first');%Gets 1st max pixel
    maxrow=row;
    maxcol=col;%Collect maxpixels for each distance
    amps=[aone(maxrow,maxcol),atwo(maxrow,maxcol),athree(maxrow,maxcol),afour(maxrow,maxcol),afive(maxrow,maxcol)];%[aone(i,j),atwo(i,j),athree(i,j),afour(i,j),afive(i,j),asix(i,j),aseven(i,j)];
    dist=[0 0.5 1 1.5 2];
    plot(dist,amps,'*','MarkerSize',20);%Plot dist vs max ampltiudes
    mdl=fitlm(dist,amps)%fit using a linear model***SHOULD BE CHANGED
    xlabel(['Optical ' type 'Distance']);
    ylabel('ADC Counts of Max Pixel');
    title('Max Pixel Dist');
    text(0.25,amps(1),['X Int: ' num2str(table2array(mdl.Coefficients(1,1))) ' A: ' num2str(table2array(mdl.Coefficients(2,1)))],'fontsize',15);
    hold all
    trig=0:0.01:2;
    y=table2array(mdl.Coefficients(1,1))+table2array(mdl.Coefficients(2,1))*trig;
    plot(trig,y);%Plots the model evauluated at given psotion
    set(gcf, 'Position', get(0,'Screensize')); % Maximize figure.
    set(gca,'fontsize',20)
    subplot(2,4,7)
    histogram(squeeze(A15(maxrow,maxcol,:)));%plots histogram for the maximal pixel
    hold all;
    histogram(squeeze(A15five(maxrow,maxcol,:)));
    histogram(squeeze(A16(maxrow,maxcol,:)));
    histogram(squeeze(A16five(maxrow,maxcol,:)));
    histogram(squeeze(A17(maxrow,maxcol,:)));
    xlabel('ADC Counts');
    ylabel('Counts');
    title('Histogram of Max Pixel');
    set(gca,'fontsize',20)
    legend('0mm','0.5mm','1.0mm','1.5mm','2.0mm');
    subplot(2,4,8)
    [rowone colone]=find(aone>8);%plots integral distrbution across each distance
    [rowtwo coltwo]=find(atwo>8);%8 was choosen since it is right above PMT noise floor on ADC Counts
    [rowthree colthree]=find(athree>8);
    [rowfour colfour]=find(afour>8);
    [rowfive colfive]=find(afive>8);
    a=0;
    sumone=0;
    sumtwo=0;
    sumthree=0;
    sumfour=0;
    sumfive=0;
    for wow=1:length(rowone)
        sumone=sumone+aone(rowone(wow),colone(wow));
    end
    for wow=1:length(rowtwo)
        sumtwo=sumtwo+atwo(rowtwo(wow),coltwo(wow));
    end
    for wow=1:length(rowthree)
        
        sumthree=sumthree+athree(rowthree(wow),colthree(wow));
    end
    for wow=1:length(rowfour)
        
        sumfour=sumfour+afour(rowfour(wow),colfour(wow));
    end
    for wow=1:length(rowfive)
        
        sumfive=sumfive+afive(rowfive(wow),colfive(wow));
    end
    sumVec(i,:)=[sumone sumtwo sumthree sumfour sumfive];%Put these integral sums in vecotr
    plot(dist,sumVec(i,:),'*','MarkerSize',20);
    xlabel(['Optical ' type ' Distance']);
    ylabel('Integral Value');
    title('Integral Distance');
    set(gca,'fontsize',20)
    lightLoss=fit(dist',sumVec(i,:)','poly2');%try to fit light loss***SHOULD BE CHANGED
    hold all;
    plot(lightLoss);%Plot light loss
    text(0.25,sumone,[num2str(lightLoss.p1) '^2+ ' num2str(lightLoss.p2) '+ ' num2str(lightLoss.p3)])
    %saveas(gcf,['Plots/Comparsion' type 'LinDiag' fiberNum '.png']);
    
    
end

end