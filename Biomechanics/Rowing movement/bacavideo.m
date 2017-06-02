obj = VideoReader('dayung.wmv');

mov(1:120)=struct('cdata', zeros(vidHeight, vidWidth, 3, 'uint8'), 'colormap',[]);

for k = 1:120
    mov(k).cdata = read(obj, k);
end
% -------------------------------------------------------------------------
% obj = mmreader('dayung.wmv','Height','Width',3,'uint8');
obj = mmreader('dayung.wmv');
vidFrames = read(obj);
% numFrames = get(obj, 'numberOfFrames');

% for k = 1 : numFrames
% ambil di frame 121-300 saja
for k = 121 : 300
mov(k).cdata = vidFrames(:,:,:,k);
mov(k).colormap = [];
end
% -------------------------------------------------------------------------
% Construct a multimedia reader object associated with file xylophone.mpg with the user tag property set to 'myreader1'.
obj = mmreader('dayung.wmv');

% Read in all the video frames.
vidFrames = read(obj);

% Find out how many frames there are.
numFrames = get(obj, 'numberOfFrames');

% Create a MATLAB movie structure from the video frames.
for k = 1 : numFrames
    mov(k).cdata = vidFrames(:,:,:,k);
    mov(k).colormap = [];
end

% Play back the movie once at the video's frame rate.
movie(mov, 1, obj.FrameRate);

% There is no need to close an mmreader object, but when you are finished with it you can clear it from the workspace.
% clear(obj)
