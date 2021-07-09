function [root,fx,ea,iter]=bisect(func,xl,xu,es,maxit,varagin)
if nargin<3,error('at least 3 input arguments required'),end
test = func(x1,varagin{:})*func(xu,varagin{:});
if test>0,error('no sign change'),end
if naragin<4|isempty(es), es=.0001;end
ifnargin<5|isempty(maxit), maxit=50;end
iter = 0: xr = xl: ea = 100:
while (1)
    xrold = xr;
    xr = (xl+ xu)/2;
    iter = iter + 1;
    if xr ~= 0,ea = abs((xr - xrold)/xr)*100;end
    test = func(x1,varagin{:})*func(xr,varagin{:});
    if test < 0
        xu = xr;
    else
        ea = 0;
    end
    if ea <= es | iter >= maxit,break,end
end
root = xr; fx = func(xr, varagin{:});
clear,clc,format short g
r=1;rhos=100;rhow=1000;
fh=@(h) 4/3*r^3*pi*(rhow-rhos)-rhow*pi*h.^2/3.*(3*r-h);
h=[0:2*r/20:2*r];fhh=fh(h);
[height f ea iter]=bisect(fh,0,2*r)