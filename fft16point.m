clc
clear all
close all
N=16;
%x1 = rand(1,N);
x1=[ 0.2599    0.8001    0.4314    0.9106    0.1818    0.2638    0.1455    0.1361    0.8693    0.5797 0.5499    0.1450    0.8530    0.6221    0.3510    0.5132]
%display(x1);
x=fi(x1,1,24,13);
q=fi(x1,1,14,13);
y=cast(0,'like',x);
z=cast(0,'like',x);
p=cast(0,'like',x);
e=cast(0,'like',x);
v=cast(0,'like',x);
a=cast(0,'like',x);
b=cast(0,'like',x);
c=cast(0,'like',x);
d=cast(0,'like',q);
f=cast(0,'like',q);
g=cast(0,'like',q);
h=cast(0,'like',q);
k=cast(0,'like',q);
s3=cast(0,'like',x);
%twiddle factor generation
for i=1:1:N
    q(i)=exp(-1i*2*pi*(i-1)/N);
end
%fft dif algorithm

%Stage-1
for i=1:1:N/2
    [sr, si, s1, s2] = bf(real(x(i)), imag(x(i)), real(x(i+N/2)), imag(x(i+N/2)), 0, 0);
    y(i)= sr + 1i*si;
    [sr,si,s1,s2] = bf(real(x(i)),imag(x(i)),real(x(i+N/2)),imag(x(i+N/2)),real(q(i)),imag(q(i)));
    y(i+N/2)= s1 + 1i*s2;
end
%Stage-2
for j=1:N/2:N
    for i=j:1:j+N/4-1
    [sr,si,s1,s2] = bf(real(y(i)),imag(y(i)),real(y(i+N/4)),imag(y(i+N/4)),0,0);
    z(i)= sr + 1i*si;
    [sr,si,s1,s2] = bf(real(y(i)),imag(y(i)),real(y(i+N/4)),imag(y(i+N/4)),real(q(2*(i-j+1)-1)),imag(q(2*(i-j+1)-1)));
    z(i+N/4)= s1 + 1i*s2;
%       ;%1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31
    
    end  
end
%Stage-3
for j=1:N/4:N
    for i=j:1:j+N/8-1   
    [sr,si,s1,s2] = bf(real(z(i)),imag(z(i)),real(z(i+N/8)),imag(z(i+N/8)),0,0);
    p(i)= sr + 1i*si;
    [sr,si,s1,s2] = bf(real(z(i)),imag(z(i)),real(z(i+N/8)),imag(z(i+N/8)),real(q(4*(i-j+1)-3)),imag(q(4*(i-j+1)-3)));
    p(i+N/8)= s1 + 1i*s2; 
    
    end    
end

%stage-4
for j=1:N/8:N
    for i=j:1:j+(N/16)-1
    [sr,si,s1,s2] = bf(real(p(i)),imag(p(i)),real(p(i+N/16)),imag(p(i+N/16)),0,0);
    v(i)= sr + 1i*si;
    [sr,si,s1,s2] = bf(real(p(i)),imag(p(i)),real(p(i+N/16)),imag(p(i+N/16)),real(q(8*(i-j+1)-7)),imag(q(8*(i-j+1)-7)));
    v(i+N/16)= s1 + 1i*s2;
 
       a(i)=p(i)+p(i+N/16);
        a(i+N/16)=(p(i)-p(i+N/16))*q((8*(i-j+1)-7)); 
    end
end

e=bitrevorder(a);
g=fft(x1);
display([e',g']);
fx=e;
plot(abs(g)-abs(fx));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:1:16
    d=bin(real(x(i)));
    display(['mem[',num2str(i-1),']=24',char(39),'b',num2str(d),';' ]);
    d=0;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
for i=1:1:16
    h=bin(imag(x(i)));
    display(['mem[',num2str(i-1),']=24',char(39),'b',num2str(h),';' ]);
    h=0;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:1:16
    d=bin(real(q(i)));
    display(['mem[',num2str(i),']=14',char(39),'b',num2str(d),';' ]);
    d=0;
end
display(['%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'])
for i=1:1:16
    h=bin(imag(q(i)));
    display(['mem[',num2str(i-1),']=14',char(39),'b',num2str(h),';' ]);
    h=0;
end
display(['%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'])
for i=1:1:16
    s3=z(i);
    display(s3.hex);
end

% for i=1:2:7
%    k=q(i);
%    display(k.hex);
% end

% display(['%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'])
% for i=1:1:16
%     s3=x(i);
%     display(s3.hex);
% end
% display(['%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'])
% for i=1:1:16
%     s3=y(i);
%     display(s3.hex);
% end
% display(['%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'])
% for i=1:1:16
%     s3=z(i);
%     display(s3.hex);
% end
% display(['%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'])
% for i=1:1:16
%     s3=p(i);
%     display(s3.hex);
% end
% display(['%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'])
% for i=1:1:16
%     s3=v(i);
%     display(s3.hex);
% end
% display(['%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'])
% for i=1:1:8
%     s3=q(i);
%     display(s3.hex);
% end
