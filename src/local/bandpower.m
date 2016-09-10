function p = bandpower( sig, f1, f2)
% receive sig then calculate power from f1 to f2

    fs = 12800;
    N = length(sig);

    [ Pxx, F ] = periodogram( sig, rectwin(N), N, fs );
    % since time and point are related by
    % i.e. n = [ 0: N ] then time t = [ 0: N/fs ] = n*fs
    % denormalized by multiply by fs

    p = sum(fs*Pxx(and(F > f1, F < f2)));
    % however this is still normalized by signal length N
    % Note that you can check this result by Parseval's theorem
    % that say sum x[n]^2 = 1/N sum X_k
    % and in MATLAB code as
    % sig.*sig == bandpower( sig, 0, fs/2 )

end
