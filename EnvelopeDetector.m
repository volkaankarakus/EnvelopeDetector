%% Message Signal m(t)
% 1.d)

fm=110;
zaman=[0:1/fm:20];

m1=3*tripuls((zaman-6)/6);
m2=3*tripuls((zaman-12)/6);
mt=m1+m2;  % Message Signal

figure(1);
plot(zaman,mt);
xlabel('Time(s)');
ylabel('m(t)');
title(['Triangle Message Signal fm=',num2str(fm),' Hz']);
grid on



%% 1.e)
% Integrated Signal

y=myfunc(zaman);
mSapkat=y;
figure(2)
plot(zaman,mSapkat);
title('Integrated m(t) Signal ');
xlabel('Time');
ylabel('Amplitude');

figure(3)
plot(zaman,mSapkat);
title('Integrated m(t) Signal and m(t) Signal');
xlabel('Time');
ylabel('Amplitude');
grid on 
hold on
plot(zaman,mt);
legend('Integrated m(t) Signal','m(t) Signal');
grid on

%% 1.f)
% Frequency Spectrum of Modulated Signal

fs=2201;      % fs for calculating the same length with f
f=-fs/2:1:fs/2-1;
mt_f=fftshift(fft(mt));
figure(4);
plot(f,abs(mt_f)/fm);
title('Frequency Spectrum of m(t) :');
xlabel('Frequency(Hz)');
ylabel('Magnitude');
grid on

%% 1.g)

fc=100;
kf=5*pi/18;
st=cos(2.*pi.*fc.*zaman + 2.*pi.*kf.*mSapkat);

figure(5);
plot(zaman,st);

%% 1.h)

st_f=fftshift(fft(st));
figure(6);
plot(f,abs(st_f)/fm);
title('Frequency Spectrum of s(t) :');
xlabel('Frequency(Hz)');
ylabel('Magnitude');
grid on

%% 1.h.i.A)
% Using Envelope 

differenceEq=diff(st);
figure(7);


envelope(differenceEq,100,'peak');

%% 1.h.i.B)
[b,a]= butter(5,2*fc/fs);  % Butterworth Filter Design
st_filt=filter(b,a,differenceEq);

figure(8)
plot(zaman,st_filt);
title('Low Pass Filtered Signal');
xlabel('Time(s)');
ylabel('Amplitude');
grid on


