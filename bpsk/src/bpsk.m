clear all;
clc;
r= randit(1,10000);
for i=1:10000
    if r(i)==0
        s(i)=-1;
    else
        s(i)=1;
    end
end
k=1;
for snr=1:1:10;
    v=1/(10^(snr/10));
x=awgn(s,snr,'measured');
y=x;
for j=1:10000
    if y(j)>0
        z(j)=1;
    else
        z(j)=0;
    end
end
error=length(find(z~=r));
ber(k)=error/10000;
k=k+1;
end
snr=1:1:10;
snrlin=10.^(snr./10);
semilogy(snr,ber,'-bo');
grid on;
title('BPSK with AWGN');
xlabel('SNR (db)');
ylabel('BER');