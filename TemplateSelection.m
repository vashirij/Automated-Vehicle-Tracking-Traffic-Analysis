function Template = TemplateSelection(VidGray)

% If template already exists, load it
if exist('Template.mat','file')

    load Template.mat Template row1 row2 col1 col2 frameNum

    disp('Loaded existing template.')

else

    [ny,nx,nt] = size(VidGray);

    frameNum = round(nt/2);
    I = VidGray(:,:,frameNum);

    figure
    imagesc(I)
    axis image
    colormap(gray)
    title('Drawing Rectangle Around Vehicle and Double Click')

    h = drawrectangle('Color','r');
    wait(h)

    pos = round(h.Position);

    col1 = pos(1);
    row1 = pos(2);

    col2 = col1 + pos(3);
    row2 = row1 + pos(4);

    Template = I(row1:row2,col1:col2);

    save Template.mat Template row1 row2 col1 col2 frameNum

    disp('Template saved.')

end

end