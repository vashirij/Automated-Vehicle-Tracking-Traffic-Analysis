function [CorImage,bestRow,bestCol,bestR] = TemplateMatchNoFigure(I,Template)

I = double(I);
Template = double(Template);

[ny,nx] = size(I);
[a,b] = size(Template);

CorImage = zeros(ny,nx);

Tmean = mean(Template(:));
Tzero = Template - Tmean;

Tden = 0;
for r = 1:a
    for c = 1:b
        Tden = Tden + Tzero(r,c)^2;
    end
end

for r = 1:ny-a+1
    for c = 1:nx-b+1

        patch = I(r:r+a-1,c:c+b-1);

        Pmean = mean(patch(:));
        Pzero = patch - Pmean;

        numerator = 0;
        Pden = 0;

        for rr = 1:a
            for cc = 1:b
                numerator = numerator + Pzero(rr,cc)*Tzero(rr,cc);
                Pden = Pden + Pzero(rr,cc)^2;
            end
        end

        denominator = sqrt(Pden*Tden);

        if denominator ~= 0
            CorImage(r,c) = numerator/denominator;
        end

    end
end

bestR = -Inf;
bestRow = 1;
bestCol = 1;

for r = 1:ny
    for c = 1:nx
        if CorImage(r,c) > bestR
            bestR = CorImage(r,c);
            bestRow = r;
            bestCol = c;
        end
    end
end

end