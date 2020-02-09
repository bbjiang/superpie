function hp = superpie(pct,patchcolors,tt)
% Developer: Biaobin Jiang (biaobinjiang@gmail.com)
h = figure('position',[0 0 1000 500]);
hold on

% make a colormap
npies = length(pct);
cmap = cell(npies,1);
pcix = zeros(2,npies);
w = 0;
for i = 1:npies
    ncc = 100;
    rr = linspace(1,patchcolors(i,1),ncc)';
    gg = linspace(1,patchcolors(i,2),ncc)';
    bb = linspace(1,patchcolors(i,3),ncc)';
    cmap{i} = [rr,gg,bb];
    pcix(1,i) = w + 1;
    pcix(2,i) = w + ncc;
    w = w + ncc;
end
pcix = pcix(:);
cmap = cell2mat(cmap);
colormap(h,cmap)

% plot a pie
hp = pie(pct);
for i = 1:npies*2
    if mod(i,2)
        hp(i).FaceVertexCData(1) = pcix(i);
        hp(i).FaceVertexCData(2:end) = pcix(i+1);
        hp(i).FaceColor = 'interp';
    else
        hp(i).String = [];
    end
end

% legend: tunable size parameters
hs = 1.2; % horizontal shift
sz = 0.085; % cube size
gz = 0.04; % gap size
for i = 1:npies
    rectangle('Position',[hs (1-sz) - (i-1)*(sz + gz), sz sz],...
        'Curvature',0.2,'FaceColor',patchcolors(i,:))
end
% text
for i = 1:npies
    text(hs + sz + 0.01, (1-sz) - (i-1)*(sz + gz) + sz/2, tt{i}, 'horizontalalignment','left')
end

axis equal
set(gca,'visible','off')
hold off