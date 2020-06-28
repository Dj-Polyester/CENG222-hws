%N is the value found, 1504
N=1504;
%p takes different values
p=input('(Please enter a p value) p=');
%parameter of the poisson variable
lambda=160;

%store simulations' results for number of triangles/choices (part a)
SimResultsForNumOfTri=zeros(N,1);
%store simulations' results for proportions (part b)
SimResultsForProp=zeros(N,1);

for k=1:N;
    %Start the simulation
    %Random number of distinct goods
    NumOfGoods=poissrnd(lambda);
    %Adjacency nxn matrix (n=NumOfGoods) each a Bernoulli variable
    t = triu((rand(NumOfGoods,NumOfGoods) < p),1) ;
    inventory=t+t.';
    %Number of triangles, compatiable goods
    NumOfTri=trace(inventory^3)/6;
    %Number of all distinct choices, triplets
    NumOfChoices=nchoosek(NumOfGoods,3);
    
    %load the arrays
    SimResultsForNumOfTri(k)=NumOfTri;
    SimResultsForProp(k)=NumOfTri/NumOfChoices;
    
end;

%a)at most 1
atmost1=mean(SimResultsForNumOfTri < 2);
%b)exceeding 0.5
exceedshalf=mean(SimResultsForProp > 0.5);
%c.1)estimate X=total number of choices
X_est=mean(SimResultsForNumOfTri);
%c.2)estimate Y=rate of potential first shipments to the distinct goods triplets
Y_est=mean(SimResultsForProp);
%d.1)estimate Std(X)
stdX_est=std(SimResultsForNumOfTri);
%d.2)estimate Std(Y)
stdY_est=std(SimResultsForProp);

%display the results
disp(sprintf('a)%.10f',atmost1));
disp(sprintf('b)%.10f',exceedshalf));
disp(sprintf('c.1)Estimator for X is %.10f',X_est));
disp(sprintf('c.2)Estimator for Y is %.10f',Y_est));
disp(sprintf('d.1)Std(X)=%.10f',stdX_est));
disp(sprintf('d.2)Std(Y)=%.10f',stdY_est));

%p=0.012
%a)0.6662234043
%b)0.0000000000
%c.1)Estimator for X is 1.1894946809
%c.2)Estimator for Y is 0.0000017185
%d.1)Std(X)=1.1738427763
%d.2)Std(Y)=0.0000016389

%p=0.79
%a)0.0000000000
%b)0.1462765957
%c.1)Estimator for X is 335193.3317819149
%c.2)Estimator for Y is 0.4926895054
%d.1)Std(X)=81140.0626731319
%d.2)Std(Y)=0.0069427860
