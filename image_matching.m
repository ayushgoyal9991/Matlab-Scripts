scan_img=imread('face1.png');
scan_img=imresize(scan_img,[440 720]);

my_img=imread('face2.png');
my_img=imresize(my_img,[440 720]);

diff_img1=imsubtract(scan_img,my_img);
diff_img2=imsubtract(my_img,scan_img);
diff_img1=im2bw(diff_img1,0.001);
diff_img2=im2bw(diff_img2,0.001);
total_pix1=numel(diff_img1);
total_pix2=numel(diff_img2);
black_pix1=total_pix1-sum(diff_img1(:));
black_pix2=total_pix2-sum(diff_img2(:));
match_per1=(black_pix1/total_pix1)*100;
match_per2=(black_pix2/total_pix2)*100;
if match_per1>=85 && match_per2>=85
    disp('Recognized');
else
disp('not recognized');
end