function gen_test(save_dir, save_fn, files)
%% load files
%default loading files
data_dir = '/home/adityajoshi/git/cellfinder_gui/data/';
for i=1:5;
    load([data_dir 'rand' num2str(i) '.mat']);
end
%TO BE ADDED for loop for loading files
%load(files); or something like that
%% general test
sum = zeros(256,256,100);
for i=1:5;
    if ~exist(['rand' num2str(i)],'var')
        continue;
    end
    cur_rand = eval(['rand' num2str(i)]);
    for j=1:100;
        sum(:,:,j) = sum(:,:,j) + cur_rand;
        eval(sprintf('image%d%d = sum(:,:,%d);',i,j,j));
        save([save_dir '/' save_fn num2str(i) '-' num2str(j)],['image' num2str(i) num2str(j)]); % save files to save_dir with save_fn 
    end
end
end