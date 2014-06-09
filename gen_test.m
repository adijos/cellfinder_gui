function gen_test(save_dir, save_fn, files)
%% load files
load('rand1.mat') %testing default
%% General test
sum = zeros(256,256,100);
for i=1:5;
    if ~exist(['rand' num2str(i)],'var')
        continue;
    end
    cur_rand = eval(['rand' num2str(i)]);
    for j=1:100;
        sum(:,:,j) = sum(:,:,j) + cur_rand
    end
end
%% save files to save_dir with save_fn
end