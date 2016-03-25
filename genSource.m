
%------------用来生成0度到X度的图片切割成128*128(原图必须是640*640)-----------------

filename = 'D55';
rotat = [0 45 90 135];
%rotat = [0 30 60 90 120 150];
im = imread([filename '.gif']);

for rot = rotat
    
    path = ['C:\picture\' filename '_' num2str(rot) '\'];
    path_gen = ['C:/picture/' filename '_' num2str(rot)];
    mkdir(path_gen);
    [M,N] = size(im);
    assert(M==640);
    assert(N==640);
    
    block = 4;
    side = M/block;
    step = M/block;
    
    % imshow(im(0+1:127+1,0+1:127+1))
    imfoo = imrotate(im,rot,'bilinear','crop');
    
    for i = 1:block
        for j = 1:block
            foo = imfoo(1+(i-1)*step:i*step, 1+(j-1)*step:j*step);
            imwrite(foo,[path num2str(i) '-' num2str(j) '-' num2str(rot) '.bmp']);
        end
    end
    
end