function feature_extract(filename)
% This is for CIS6590 dataset feature extraction. By Guangyi Zhu.
format long g
digits(128)
total = csvread(filename);
% total = uint64(total);
SIZE = size(total);

%Block border detect.
border = [0];
SIZE=size(total);
for rows = 1:SIZE(1)
    if total(rows,1) == 0
        border = [border rows];
    else
        continue
    end
end
%Calculate feature for each block.
for i = 1:length(border)-1
    current_block = total(border(i)+1:border(i+1)-1,1:5);
    current_block = sortrows(current_block,3);
    current_size = size(current_block);
    % Hold(Down-Up) duration:
    hold = current_block(:,5)-current_block(:,3);
    output = [current_block hold];
    
    %current_block = total(border(i)+1:border(i+1)-1,1:5);
    %current_size = size(current_block)
    
    % Down-Down duration:
    dd_duration = [0];
    for dd = 1:current_size(1)-1
        dd_duration(dd+1,1) = current_block(dd+1,3)-current_block(dd,3);
    end
    output = [output dd_duration];
    % Up-Up duration:
    uu_duration = [0];
    for uu = 1:current_size(1)-1
        uu_duration(uu+1,1) = current_block(uu+1,5)-current_block(uu,5);
    end
    output = [output uu_duration];
    
    % Up-Down duration:
    ud_duration = [0];
    for ud = 1:current_size(1)-1
        ud_duration(ud+1,1) = current_block(ud+1,3)-current_block(ud,5);
    end
    output = [output ud_duration];
    total(border(i)+1:border(i+1)-1,1:9) = output;
end

%xlswrite('feature.xlsx',total2)
dlmwrite('42.csv',total,'precision',14)
end