# Modelos con datos temporales: Introducción




## Introducción

Una serie de tiempo es un proceso ordenado secuencialmente en el tiempo. Decimos que $t$ es un entero que denota el periodo de tiempo. La mayoría de las series de tiempo de variables económicas se registran a intervalos discretos: anual, trimestral, mensual, diario. Decimos que el número de periodos observados por año define la frecuencia de la serie. 

Un aspecto crucial es la dependencia temporal de las observaciones qeu están cercanas en tiempo calendario. Por ejemplo, la tasa de inflación de junio está relacionada con la tasa de inflación de mayo. 


### Ejemplos




```r
library(fpp3)
library(readxl)
library(ggpubr)
piby<- read_excel(here("Econometria2","Data","pibyear.xlsx"))
piby<-tsibble(piby,index=year)
pib.plot<-ggplot(piby,aes(x=year,y=rgdpo))+geom_line()+labs(title="PIB",
                                                            y="USD (millones 2011)",x="")+theme_minimal()

piby<-piby%>%mutate(gpib=difference(log(rgdpo),lag=1)*100)
gpib.plot<-ggplot(piby,aes(x=year,y=gpib))+geom_line()+labs(title="Crecimiento",y="%",x="",caption="Penn World Tables")+theme_minimal()+geom_hline(yintercept=0)

ggarrange(pib.plot,gpib.plot,ncol=2)                                                            
```

<img src="05-ts_intro_files/figure-html/unnamed-chunk-1-1.png" width="672" />


```r
mes<- read_excel(here("Econometria2","Data","tsmonth.xlsx"))
mes<-mes%>%mutate(date=yearmonth(date))%>%as_tsibble(index=date)

ipc.plot<-ggplot(mes,aes(x=date,y=ipc))+geom_line()+labs(title="IPC",y="",x="")+theme_minimal()

inf.plot<-mes%>%mutate(inf=difference(log(ipc),lag=1)*100)%>%ggplot(aes(x=date,y=inf))+geom_line()+theme_minimal()+labs(title="Inflación Mensual",x="",y="",caption="DANE")

ggarrange(ipc.plot,inf.plot,ncol=2)
```

<img src="05-ts_intro_files/figure-html/unnamed-chunk-2-1.png" width="672" />


```r
mes%>%mutate(inf=difference(log(ipc),lag=1)*100)%>%
  gg_season(inf,labels="both")+
  labs(y="%",title="Gráfico estacional: inflación mensual",x="")
```

<img src="05-ts_intro_files/figure-html/unnamed-chunk-3-1.png" width="672" />


```r
ipcdcmp<-mes%>%model(stl=STL(ipc))
components(ipcdcmp)%>%autoplot()
```

<img src="05-ts_intro_files/figure-html/unnamed-chunk-4-1.png" width="672" />


```r
wti.plot<-ggplot(mes,aes(x=date,y=wti))+geom_line()+labs(title="WTI",y="US$/barril",x="")+theme_minimal()

gwti.plot<-mes%>%mutate(gwti=difference(log(wti),lag=1)*100)%>%ggplot(aes(x=date,y=gwti))+geom_line()+theme_minimal()+labs(title="Var mes WTI",x="",y="%",caption="IEA")

ggarrange(wti.plot,gwti.plot,ncol=2)
```

<img src="05-ts_intro_files/figure-html/unnamed-chunk-5-1.png" width="672" />

```r
trm<- read_excel(here("Econometria2","Data","tsdaily.xlsx"))
trm<-trm%>%mutate(date=ymd(date))%>%as_tsibble(index=date)

trm.plot<-ggplot(trm,aes(x=date,y=trm))+geom_line()+labs(title="TRM",y="COP/USD",x="")+theme_minimal()

dep.plot<-trm%>%mutate(dep=difference(log(trm),lag=1)*100)%>%ggplot(aes(x=date,y=dep))+geom_line()+theme_minimal()+labs(title="Depreciación",x="",y="%",caption="BanRep")

ggarrange(trm.plot,dep.plot,ncol=2)
```

<img src="05-ts_intro_files/figure-html/unnamed-chunk-6-1.png" width="672" />

## Autocorrelaciones

Para explorar el grado de dependencia entre la variable en el periodo $t$ y sus rezagos, $t-s$, usamos el coeficiente de correlación

$$
\rho_s=\dfrac{Cov(X_t,X_{t-s})}{Var(X_t)}
$$

Cuyo estimador muestral es

$$
\hat{\rho}_s=\dfrac{\sum_{t=s+1}^{T}(X_t-\bar{X})(X_{t-s}-\bar{X})}{\sum_{t=1}^{T}(X_t-\bar{X})^2}
$$


```r
acfpib<-piby%>%ACF(rgdpo)%>%autoplot()+labs(title="ACF PIB")
acfgpib<-piby%>%ACF(gpib)%>%autoplot()+labs(title="ACF Crecimiento PIB")
ggarrange(acfpib,acfgpib,ncol=2)
```

<img src="05-ts_intro_files/figure-html/unnamed-chunk-7-1.png" width="672" />


```r
acfipc<-mes%>%mutate(lipc=log(ipc))%>%ACF(lipc,lag_max=48)%>%autoplot()+labs(title="ACF Ln IPC")
acfinf<-mes%>%mutate(inf=difference(log(ipc),lag=1))%>%ACF(inf,lag_max=48)%>%autoplot()+labs(title="ACF Inflación")

ggarrange(acfipc,acfinf,ncol=2)
```

<img src="05-ts_intro_files/figure-html/unnamed-chunk-8-1.png" width="672" />



```r
acftrm<-trm%>%mutate(ltrm=log(trm))%>%ACF(ltrm)%>%autoplot()+labs(title="ACF Ln TRM")

acfdep<-trm%>%mutate(dep=difference(log(trm),lag=1))%>%ACF(dep)%>%autoplot()+labs(title="ACF Depreciación")

ggarrange(acftrm,acfdep,ncol=2)
```

<img src="05-ts_intro_files/figure-html/unnamed-chunk-9-1.png" width="672" />
