% gram schmidt
% [1, n, n2, n3, n4]
% range: [0, 12]

polyset = diag(ones(1,5));
range = [0,12];

orthoset = zeros(size(polyset));

% phi_0
orthoset(1,:) = polyset(1,:) ./ getNorm(polyset(1,:), range);
for m = [2:5]
    tmp = zeros(size(polyset(1,:)));
    for k = [1:m-1]
        tmp = tmp + innerProduct(orthoset(k,:), polyset(m,:), range)*orthoset(k,:);
    end
    phi = polyset(m,:) - tmp;
    orthoset(m,:) = phi ./ getNorm(phi, range);
end
breakFlag = 0;
for i = [1:4]
    for j = [i+1:5]
        if checkOrtho(orthoset(i,:),orthoset(j,:), range) == 0
            disp("not ortho");
            breakFlag = 1;
            break;
        end
    end
    if breakFlag
        break;
    end
end
if ~breakFlag
    disp("ortho");
end

function nv = getNorm(poly, range)
    nv = sqrt(innerProduct(poly, poly, range));
end

function value = getValue(poly, n)
    n_list = [0:length(poly)-1];
    n_list = n .^ n_list;
    value = n_list * poly';
end

function iv = innerProduct(poly1, poly2, range)
    iv = 0;
    for i = [range(1):range(2)]
       iv = iv + getValue(poly1, i) * getValue(poly2, i);
    end
end

function t = checkOrtho(poly1, poly2, range)
    threshold = 1e-10;
    t = 0;
    if abs(innerProduct(poly1,poly2,range)) < threshold
        t = 1;
    end
end