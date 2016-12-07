% QR Algorithm for Finding Eigenvalues.
function a = QRMethodEig(eps,N,m,a)

v = zeros(m,1);

for k = 1:N
    while m > 1
        if abs(a(m,m-1)) < eps
            v(m) = a(m,m);

            % Deleting the mth row and column.
            a = a(m-1,m-1);
            m = m - 1;
        end;
        [Q,R] = qr(a);
        a = R*Q;
    end;
end;
v(1) = a(1,1);