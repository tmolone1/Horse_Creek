radius<-function(r1,K,h1,h2,Q) {
  r2 <- r1/exp((pi*K*(h1^2-h2^2))/Q)
  return(r2)
}
r1<-0.5 #feet
K<-89.14 # from flow model, ft/d
h1<-20 # feet aquifer thickness minus drawdown at well
h2<-60 # feet aquifer thickness
Q<-550 # GPM
Q<-Q*192.5 # convert to ft3/d
radius(r1,K,h1,h2,Q)


r1<-140 #feet
K<-89.14 # from flow model, ft/d
h1<-2 # feet aquifer thickness minus drawdown at well
h2<-60 # feet aquifer thickness
Q<-2000 # GPM
Q<-Q*192.5 # convert to ft3/d
radius(r1,K,h1,h2,Q)


