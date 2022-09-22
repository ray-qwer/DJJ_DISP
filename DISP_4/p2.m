% PCA
A = [[2,-1,3];[-1,3,5];[0,2,4];[4,-2,-1];[1,0,4];[-2,5,5]];
m = mean(A);
A1 = A-m;

[U,S,V] = svd(A1);

A2 = PCA(U,S,V,m,2);
plot3(A2(:,1),A2(:,2),A2(:,3));
hold on;
grid on;
x = [-10:0.1:10];
y = [-10:0.1:10];
[X,Y] = meshgrid(x,y);
v = (V(:,1) + V(:,2))';
Z = (X*v(1) + Y*v(2)) / v(3);
surf(X+m(1),Y+m(2),Z+m(3));


function appr = PCA(U,S,V, M, order)
    % order means how many eigenvector want to use
    [n,s] = size(S);
    if order > s
        order = s
    elseif order == 0;
        order = 1;
    end
    appr = zeros(size(S));
    for i = [1:order]
        appr = appr + (U(:,i)* V(:,i)') * S(i,i);
    end
    appr = appr + M;
end