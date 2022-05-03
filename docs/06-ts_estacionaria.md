# Modelos con series de tiempo estacionarias




## Modelos lineales

El modelo de regresión lineal toma la forma

$$
Y_t=\mathbf{X}_t\boldsymbol{\beta}+e_t
$$
 
 Donde $\mathbf{X}_t$ es el vector de regresores, que puede incluir rezagos de $Y_t$ $(Y_{t-1},...,Y_{t-p})$. 
 
Decimos que si se cumplen los siguientes supuestos 

- **TS1**: $(Y_t,X_t)$ es estacionario y débilmente dependiente

- **TS2**: No hay colinealidad perfecta

- **TS3**: $E(e_t|\mathbf{X}_t)=0$, es decir que las explicativas son contemporáneamente exógenas

Entonces el estimador MCO es consistente, $plim \hat{\beta}\to \beta$

