function gen_test(save_dir, save_fn, files)
%sprintf('entering gen_test')
%% load files
%default loading files
%{
data_dir = '/home/adityajoshi/git/cellfinder_gui/data/';
for i=1:5;
    load([data_dir 'rand' num2str(i) '.mat']);
end
%}
%TO BE ADDED for loop for loading files
for i=1:length(files)
    fn = files{i};
    load(fn);
%% general test
sum = zeros(256,256,3);
for i=1:5;
    if ~exist(['rand' num2str(i)],'var')
        continue;
    end
    cur_rand = eval(['rand' num2str(i)]);
    for j=1:3;
        sprintf('processing image %d %d', i,j);
        sum(:,:,j) = sum(:,:,j) + cur_rand + randn(256,256);
        img = sum(:,:,j);
        save([save_dir '/' save_fn num2str(i) '-' num2str(j) '.mat'],'img'); % save files to save_dir with save_fn 
    end
end
end