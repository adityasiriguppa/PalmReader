coeff=reshape(coeff,[1,16384]);
l1=line1.predictFcn(coeff);
l2=line2.predictFcn(coeff);
l3=line3.predictFcn(coeff);

if l1==1
    fprintf('These people possess a balanced mentality and physical aspects of love is secondary importance\nThey are affectionate and  liberal\n');
elseif l1==2
    fprintf('They possess a practical outlook in matter of love and affection\n');
else
    fprintf('They are generally less sympathetic \nThey do not show interest towards love life\n');
end

if l2==4
    fprintf('These people are mean to possess good memory and excellent brain i.e intelligent and capable of taking wise decisions\n');
elseif l2==5
    fprintf('They are known for their practical thinking and good common sense.Also they have imaginative power\n');
else
    fprintf('These people never listen to others and remain carefree in life.They tend to be violent in nature and self centered\n');
end

if l3==7
    fprintf('They are very ambitious and it is more favourable that they achieve their ambitions \nThey has less consideration to others\n ');
elseif l3==8
    fprintf('These people have a very balanced thinking of mind \nThey travel less frequently\n');
else
    fprintf('They are very aggressive in nature\n');
end

