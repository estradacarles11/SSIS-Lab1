t=-1:1/1000:1;
x=ce_pr(t);
plot(t,x); hold on;
t1=1/4;
T=1/2;
x1=ce_pr((t-t1)/T);
plot(t,x1);