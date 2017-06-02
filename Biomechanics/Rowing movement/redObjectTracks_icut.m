
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
obj = mmreader('dayung.wmv');
vidFrames = read(obj);
% numFrames = get(obj, 'numberOfFrames');

% for k = 1 : numFrames
% ambil di frame 121-280 saja
for k = 121 : 280
mov(k).cdata = vidFrames(:,:,:,k);
mov(k).colormap = [];
end
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
    diff_im = imsubtract(mov(240).cdata(:,:,1), rgb2gray(mov(240).cdata));
    %Use a median filter to filter out noise
    diff_im = medfilt2(diff_im, [3 3]);
    % Convert the resulting grayscale image into a binary image.
    diff_im = im2bw(diff_im,0.25);
    
    % Remove all those pixels less than 300px
    diff_im = bwareaopen(diff_im,200);
    
    % Label all the connected components in the image.
    bw = bwlabel(diff_im, 8);
    
    % Here we do the image blob analysis.
    % We get a set of properties for each labeled region.
    stats = regionprops(bw, 'BoundingBox', 'Centroid');
    
    % Display the image
    imshow(mov(240).cdata)
    
    hold on
    
    %This is a loop to bound the red objects in a rectangular box.
    for object = 1:length(stats)
        bb = stats(object).BoundingBox;
        bc = stats(object).Centroid;
        rectangle('Position',bb,'EdgeColor','r','LineWidth',2)
        plot(bc(1),bc(2), '-m+')
        a=text(bc(1)+15,bc(2), strcat('X: ', num2str(round(bc(1))), '    Y: ', num2str(round(bc(2)))));
        set(a, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'yellow');
    end
    
    hold off
    %end
    % Both the loops end here.

    % Stop the video aquisition.
    %stop(vid);

    % Flush all the image data stored in the memory buffer.
    %flushdata(vid);

    % Clear all variables
    %clear all
    %sprintf('%s','That was all about Image tracking, Guess that was pretty easy :) ')

%     figure
        imshow(stats)
% end
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------