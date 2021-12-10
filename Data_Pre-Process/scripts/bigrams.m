function bigrams()
base = csvread('42.csv');
SIZE=size(base);
line = [];
naming = {'th','he','in','er','an','re','nd','on','en','at','ou','ed','ha','to','or','it','is','hi','es','ng'};
ids = {[84,72],[72,69],[73,78],[69,82],[65,78],[82,69],[78,68],[79,78],[69,78],[65,84],[79,85],[69,68],[72,65],[84,79],[79,82],[73,84],[73,83],[72,73],[69,83],[78,71]};
header = {'uid','key1_id','key2_id','key1_hold_dur','key2_hold_dur','DD_dur','UU_dur','UD_dur'};
for n = 1:length(naming)
    out = [];
    for i = 1:SIZE(1)-1
    if base(i,2)==ids{n}(1) && base(i+1,2)==ids{n}(2)
        line = [base(i,1),base(i,2),base(i+1,2),base(i,6),base(i+1,6),base(i+1,7),base(i+1,8),base(i+1,9)];
        out = [out;line];
    else
        continue
    end
end
TAB=table(out(:,1),out(:,2),out(:,3),out(:,4),out(:,5),out(:,6),out(:,7),out(:,8),'VariableNames',header);
writetable(TAB,['/Users/zhuguangyi/Documents/Bigrams/' naming{n} '.csv'])
end


end