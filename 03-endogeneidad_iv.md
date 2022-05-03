# Endogeneidad y el estimador de variables instrumentales



## Introducción 

El estimador MCO se dice insesgado si

\begin{equation}
\tag{1}
E(\hat{\boldsymbol{\beta}}|\mathbf{X})=\boldsymbol{\beta}
\end{equation}

Sabemos que este resultado requiere que $E(\mathbf{u|X})=\mathbf{0}$. Sin embargo, hay situaciones en las que esto no es así, en tre ellas tenemos

- `<svg aria-hidden="true" role="img" viewBox="0 0 512 512" style="height:1em;width:1em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:currentColor;overflow:visible;position:relative;"><path d="M440.5 88.5l-52 52L415 167c9.4 9.4 9.4 24.6 0 33.9l-17.4 17.4c11.8 26.1 18.4 55.1 18.4 85.6 0 114.9-93.1 208-208 208S0 418.9 0 304 93.1 96 208 96c30.5 0 59.5 6.6 85.6 18.4L311 97c9.4-9.4 24.6-9.4 33.9 0l26.5 26.5 52-52 17.1 17zM500 60h-24c-6.6 0-12 5.4-12 12s5.4 12 12 12h24c6.6 0 12-5.4 12-12s-5.4-12-12-12zM440 0c-6.6 0-12 5.4-12 12v24c0 6.6 5.4 12 12 12s12-5.4 12-12V12c0-6.6-5.4-12-12-12zm33.9 55l17-17c4.7-4.7 4.7-12.3 0-17-4.7-4.7-12.3-4.7-17 0l-17 17c-4.7 4.7-4.7 12.3 0 17 4.8 4.7 12.4 4.7 17 0zm-67.8 0c4.7 4.7 12.3 4.7 17 0 4.7-4.7 4.7-12.3 0-17l-17-17c-4.7-4.7-12.3-4.7-17 0-4.7 4.7-4.7 12.3 0 17l17 17zm67.8 34c-4.7-4.7-12.3-4.7-17 0-4.7 4.7-4.7 12.3 0 17l17 17c4.7 4.7 12.3 4.7 17 0 4.7-4.7 4.7-12.3 0-17l-17-17zM112 272c0-35.3 28.7-64 64-64 8.8 0 16-7.2 16-16s-7.2-16-16-16c-52.9 0-96 43.1-96 96 0 8.8 7.2 16 16 16s16-7.2 16-16z"/></svg>`{=html} Variable omitida

- `<svg aria-hidden="true" role="img" viewBox="0 0 512 512" style="height:1em;width:1em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:currentColor;overflow:visible;position:relative;"><path d="M440.5 88.5l-52 52L415 167c9.4 9.4 9.4 24.6 0 33.9l-17.4 17.4c11.8 26.1 18.4 55.1 18.4 85.6 0 114.9-93.1 208-208 208S0 418.9 0 304 93.1 96 208 96c30.5 0 59.5 6.6 85.6 18.4L311 97c9.4-9.4 24.6-9.4 33.9 0l26.5 26.5 52-52 17.1 17zM500 60h-24c-6.6 0-12 5.4-12 12s5.4 12 12 12h24c6.6 0 12-5.4 12-12s-5.4-12-12-12zM440 0c-6.6 0-12 5.4-12 12v24c0 6.6 5.4 12 12 12s12-5.4 12-12V12c0-6.6-5.4-12-12-12zm33.9 55l17-17c4.7-4.7 4.7-12.3 0-17-4.7-4.7-12.3-4.7-17 0l-17 17c-4.7 4.7-4.7 12.3 0 17 4.8 4.7 12.4 4.7 17 0zm-67.8 0c4.7 4.7 12.3 4.7 17 0 4.7-4.7 4.7-12.3 0-17l-17-17c-4.7-4.7-12.3-4.7-17 0-4.7 4.7-4.7 12.3 0 17l17 17zm67.8 34c-4.7-4.7-12.3-4.7-17 0-4.7 4.7-4.7 12.3 0 17l17 17c4.7 4.7 12.3 4.7 17 0 4.7-4.7 4.7-12.3 0-17l-17-17zM112 272c0-35.3 28.7-64 64-64 8.8 0 16-7.2 16-16s-7.2-16-16-16c-52.9 0-96 43.1-96 96 0 8.8 7.2 16 16 16s16-7.2 16-16z"/></svg>`{=html} Error de medición

- `<svg aria-hidden="true" role="img" viewBox="0 0 512 512" style="height:1em;width:1em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:currentColor;overflow:visible;position:relative;"><path d="M440.5 88.5l-52 52L415 167c9.4 9.4 9.4 24.6 0 33.9l-17.4 17.4c11.8 26.1 18.4 55.1 18.4 85.6 0 114.9-93.1 208-208 208S0 418.9 0 304 93.1 96 208 96c30.5 0 59.5 6.6 85.6 18.4L311 97c9.4-9.4 24.6-9.4 33.9 0l26.5 26.5 52-52 17.1 17zM500 60h-24c-6.6 0-12 5.4-12 12s5.4 12 12 12h24c6.6 0 12-5.4 12-12s-5.4-12-12-12zM440 0c-6.6 0-12 5.4-12 12v24c0 6.6 5.4 12 12 12s12-5.4 12-12V12c0-6.6-5.4-12-12-12zm33.9 55l17-17c4.7-4.7 4.7-12.3 0-17-4.7-4.7-12.3-4.7-17 0l-17 17c-4.7 4.7-4.7 12.3 0 17 4.8 4.7 12.4 4.7 17 0zm-67.8 0c4.7 4.7 12.3 4.7 17 0 4.7-4.7 4.7-12.3 0-17l-17-17c-4.7-4.7-12.3-4.7-17 0-4.7 4.7-4.7 12.3 0 17l17 17zm67.8 34c-4.7-4.7-12.3-4.7-17 0-4.7 4.7-4.7 12.3 0 17l17 17c4.7 4.7 12.3 4.7 17 0 4.7-4.7 4.7-12.3 0-17l-17-17zM112 272c0-35.3 28.7-64 64-64 8.8 0 16-7.2 16-16s-7.2-16-16-16c-52.9 0-96 43.1-96 96 0 8.8 7.2 16 16 16s16-7.2 16-16z"/></svg>`{=html} Simultaneidad

## Endogeneidad

### Variable omitida

En Colombia, las zonas de deforestación han coincidido con áreas de presencia de grupos armados ¿La violencia causa la deforestación? [Ferguson, Romero, y Vargas (2014)](https://ageconsearch.umn.edu/record/209328/) intentar estimar el efecto de la expansión paramilitar sobre la deforestación. 

- Considere la siguiente especificación

\begin{equation}
forest_{m,t}=\beta_0+\beta_1Para_{mt}+\epsilon_{m,t}
\end{equation}

Donde $forest_{m,t}$ es la proporción de la municipalidad $m$ cubierta de bosque en el año $t$, mientras que $Para_{m,t}$ son los ataques paramilitares hasta el año $t$

- Al estimar por MCO encuentran que $\hat{\beta_1}=0.045$ con $s.e=0.0117$

- ¿Podría decir que el estimador es insesgado?

- ¿Qué pasa si la deforestación y la presencia del conflicto dependen de las características ecológicas y geológicas del terreno? 


### Simultaneidad

Usted quiere estimar el efecto de los aranceles sobre el volumen de comercio. Plantéa el siguiente modelo

\begin{equation}
comercio=\beta_0+\beta_1arancel+\upsilon
\end{equation}


Sin embargo, si los grupos de presión logran hacer que el gobierno suba los aranceles como respuesta a la creciente competencia con importaciones, entonces 

\begin{equation}
arancel=\gamma_0+\gamma_1comercio+\omega
\end{equation}

En consecuencia

\begin{equation}
comercio=\beta_0+\beta_1(\gamma_0+\gamma_1comercio+\omega)+\upsilon
\end{equation}

- Un choque al comercio, $\upsilon$, afecta también a los aranceles, luego $Cov(arancel,\upsilon)\neq0$


### Error de Medcición

Quiere estimar el efecto del ingreso familiar sobre el desempeño académico. Tiene el modelo

\begin{equation}
nota=\beta_0+\beta_1ing^*+u
\end{equation}

Acá, $ing^*$ es la medida ideal del ingreso. Sin embargo, lo que tiene es lo que reporta el estudiante es $ing$

$$
ing=ing^*+e
$$

luego

\begin{align}
nota&=\beta_0+\beta_1(ing-e)+u\\
&=\beta_0+\beta_1ing+\upsilon
\end{align}

Con $\upsilon=u-\beta_1e$. 

- Note que $Cov(ing,\upsilon)\neq0$ porque $ing$ está correlacionado con $e$


## El estimador de variables instrumentales

Para resolver el problema de endogeneidad necesitamos exogeneidad, obvio, pero ¿Cómo? 

`<svg aria-hidden="true" role="img" viewBox="0 0 512 512" style="height:1em;width:1em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:currentColor;overflow:visible;position:relative;"><path d="M507.73 109.1c-2.24-9.03-13.54-12.09-20.12-5.51l-74.36 74.36-67.88-11.31-11.31-67.88 74.36-74.36c6.62-6.62 3.43-17.9-5.66-20.16-47.38-11.74-99.55.91-136.58 37.93-39.64 39.64-50.55 97.1-34.05 147.2L18.74 402.76c-24.99 24.99-24.99 65.51 0 90.5 24.99 24.99 65.51 24.99 90.5 0l213.21-213.21c50.12 16.71 107.47 5.68 147.37-34.22 37.07-37.07 49.7-89.32 37.91-136.73zM64 472c-13.25 0-24-10.75-24-24 0-13.26 10.75-24 24-24s24 10.74 24 24c0 13.25-10.75 24-24 24z"/></svg>`{=html} La idea básica es pensar que si $x_j$ tiene una parte que está correlacionada con el error, $e$, y otra que no lo está, entonces puede usarse la parte de $x_j$ que no está correlacionada con el error. Para ello necesitamos un instrumento

`<svg aria-hidden="true" role="img" viewBox="0 0 496 512" style="height:1em;width:0.97em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:currentColor;overflow:visible;position:relative;"><path d="M336.5 160C322 70.7 287.8 8 248 8s-74 62.7-88.5 152h177zM152 256c0 22.2 1.2 43.5 3.3 64h185.3c2.1-20.5 3.3-41.8 3.3-64s-1.2-43.5-3.3-64H155.3c-2.1 20.5-3.3 41.8-3.3 64zm324.7-96c-28.6-67.9-86.5-120.4-158-141.6 24.4 33.8 41.2 84.7 50 141.6h108zM177.2 18.4C105.8 39.6 47.8 92.1 19.3 160h108c8.7-56.9 25.5-107.8 49.9-141.6zM487.4 192H372.7c2.1 21 3.3 42.5 3.3 64s-1.2 43-3.3 64h114.6c5.5-20.5 8.6-41.8 8.6-64s-3.1-43.5-8.5-64zM120 256c0-21.5 1.2-43 3.3-64H8.6C3.2 212.5 0 233.8 0 256s3.2 43.5 8.6 64h114.6c-2-21-3.2-42.5-3.2-64zm39.5 96c14.5 89.3 48.7 152 88.5 152s74-62.7 88.5-152h-177zm159.3 141.6c71.4-21.2 129.4-73.7 158-141.6h-108c-8.8 56.9-25.6 107.8-50 141.6zM19.3 352c28.6 67.9 86.5 120.4 158 141.6-24.4-33.8-41.2-84.7-50-141.6h-108z"/></svg>`{=html} **Ejemplo**

[Feyrer (2009)](https://voxeu.org/article/1967-75-suez-canal-closure-lessons-trade) quiere estimar el efecto del comercio sobre el crecimiento económico. Propone el siguiente modelo

<br/>

\begin{equation}
lny_{it}=\alpha+\gamma_i+\gamma_t+\beta lntrade_{it}+\epsilon_{it}
\end{equation}

<br/>

La estimación consistente de $\beta$ requiere que $corr(\epsilon_{it},lntrade_{it})=0$. Este supuesto no es plausible, al fin y al cabo entre mayor sea el ingreso per cápita de un país mayor tenderá a ser su volúmen de importaciones y por lo tanto de comercio. 

Imagine que podemos descomponer la variabilidad de $lntrade$ en dos partes. Una correlacionada con $\epsilon$ y otra no correlacionada $\epsilon$. Acá es donde entra el *instrumento* `<svg aria-hidden="true" role="img" viewBox="0 0 512 512" style="height:1em;width:1em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:currentColor;overflow:visible;position:relative;"><path d="M507.73 109.1c-2.24-9.03-13.54-12.09-20.12-5.51l-74.36 74.36-67.88-11.31-11.31-67.88 74.36-74.36c6.62-6.62 3.43-17.9-5.66-20.16-47.38-11.74-99.55.91-136.58 37.93-39.64 39.64-50.55 97.1-34.05 147.2L18.74 402.76c-24.99 24.99-24.99 65.51 0 90.5 24.99 24.99 65.51 24.99 90.5 0l213.21-213.21c50.12 16.71 107.47 5.68 147.37-34.22 37.07-37.07 49.7-89.32 37.91-136.73zM64 472c-13.25 0-24-10.75-24-24 0-13.26 10.75-24 24-24s24 10.74 24 24c0 13.25-10.75 24-24 24z"/></svg>`{=html}, que no es más que otra variable, $z$ que debe cumplir con dos condiciones

**C1** No estar correlacionada con el error. Es decir, que sea exógena

**C2** Debe estar correlacionada con la variable endógena. Esto se conoce como condición de relevancia

Feyrer (2009) propone usar el [cierre del canal del Suez entre 1967 y 1975](https://www.britannica.com/topic/Suez-Canal/History) como $z$. Si el cierre fue un evento motivado principalmente por razones políticas, pero que impactó los fluos comerciales, entonces podría funcionar.  En el estudo estimaron $\hat{\beta}_{OLS}=0.3(0.053)$ y $\hat{\beta}_{IV}=0.23(0.083)$

Note que el error estándar del estimador de variables instrumentales es mayor. Si calculamos los intervalos de confianza al 95% para cada estimación obtenemos 

- $0.3\pm 1.96(0.053)=[0.196,0.404]$


- $0.23\pm 1.96(0.083)=[0.07,0.39]$

No es evidente que la diferencia sea *estadísticamente* significativa. El intervalo de IV contiene la estimación por MCO


### El Estimador IV


Considere el siguiente modelo de regresión lineal

<br/>

\begin{equation}
y=\beta_0+\beta_1x+e
\end{equation}

<br/>

- Sospechamos que $Cov(x,e)\neq0$

- Para obtener estimadores consistentes de $\beta_0$ y $\beta_1$ necesitamos información adicional. Esta la obtenemos de $z$

- Z es una variable observable que debe cumplir las siguientes condiciones

<br/>

**C1**: Exogeneidad 

$$
Cov(z,e)=0
$$

**C2**: Relevancia

$\pi_1\neq0$ en la regresión

$$
x=\pi_0+\pi_1z+\upsilon
$$

<br/>

De donde podemos obtener

$$
\hat{x}=\hat{\pi}_0+\hat{\pi}_1z
$$

<br/>

Es claro que $Cov(\hat{x},e)=0$. Luego lo usamos en

$$
y=\beta_0+\beta_1\hat{x}+e$
$$

<br/>

`<svg aria-hidden="true" role="img" viewBox="0 0 192 512" style="height:1em;width:0.38em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:currentColor;overflow:visible;position:relative;"><path d="M176 432c0 44.112-35.888 80-80 80s-80-35.888-80-80 35.888-80 80-80 80 35.888 80 80zM25.26 25.199l13.6 272C39.499 309.972 50.041 320 62.83 320h66.34c12.789 0 23.331-10.028 23.97-22.801l13.6-272C167.425 11.49 156.496 0 142.77 0H49.23C35.504 0 24.575 11.49 25.26 25.199z"/></svg>`{=html} **C1** No se puede probar estadísticamente

`<svg aria-hidden="true" role="img" viewBox="0 0 192 512" style="height:1em;width:0.38em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:currentColor;overflow:visible;position:relative;"><path d="M176 432c0 44.112-35.888 80-80 80s-80-35.888-80-80 35.888-80 80-80 80 35.888 80 80zM25.26 25.199l13.6 272C39.499 309.972 50.041 320 62.83 320h66.34c12.789 0 23.331-10.028 23.97-22.801l13.6-272C167.425 11.49 156.496 0 142.77 0H49.23C35.504 0 24.575 11.49 25.26 25.199z"/></svg>`{=html} **C2** Se puede probar estadísticamente

Además

<br/>

`<svg aria-hidden="true" role="img" viewBox="0 0 192 512" style="height:1em;width:0.38em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:currentColor;overflow:visible;position:relative;"><path d="M176 432c0 44.112-35.888 80-80 80s-80-35.888-80-80 35.888-80 80-80 80 35.888 80 80zM25.26 25.199l13.6 272C39.499 309.972 50.041 320 62.83 320h66.34c12.789 0 23.331-10.028 23.97-22.801l13.6-272C167.425 11.49 156.496 0 142.77 0H49.23C35.504 0 24.575 11.49 25.26 25.199z"/></svg>`{=html} Perdemos precisión en la estimación

<br/>

`<svg aria-hidden="true" role="img" viewBox="0 0 192 512" style="height:1em;width:0.38em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:currentColor;overflow:visible;position:relative;"><path d="M176 432c0 44.112-35.888 80-80 80s-80-35.888-80-80 35.888-80 80-80 80 35.888 80 80zM25.26 25.199l13.6 272C39.499 309.972 50.041 320 62.83 320h66.34c12.789 0 23.331-10.028 23.97-22.801l13.6-272C167.425 11.49 156.496 0 142.77 0H49.23C35.504 0 24.575 11.49 25.26 25.199z"/></svg>`{=html} Si $z$ no cumple las condiciones, entonces puede ser peor que usar MCO

Retomando

\begin{equation}
\tag{1}
y=\beta_0+\beta_1x+e
\end{equation}

\begin{equation}
\tag{C.1}
Cov(z,e)=0
\end{equation}

\begin{equation}
\tag{C.2}
Cov(z,x)\neq0
\end{equation}

<br/>

Usando la propiedad distributiva de la covarianza escribimos

<br/>

\begin{equation}
\tag{2}
Cov(z,y)=\beta_1Cov(z,x)+Cov(z,u)
\end{equation}

Note que bajo C.1 y C.2 podemos **identificar** $\beta_1$

<br/>

\begin{equation}
\tag{3}
\beta_1=\dfrac{Cov(z,y)}{Cov(z,x)}
\end{equation}

Usando el estimador de la covarianza, obtenemos el estimador IV

<br/>

\begin{equation}
\tag{4}
\hat{\beta}_1=\dfrac{n^{-1}\sum_i^n(z_i-\bar{z})(y_i-\bar{y})}{n^{-1}\sum_i^n(z_i-\bar{z})(x_i-\bar{x})}
\end{equation}

<br/>

Usando la ley de grandes números podemos mostrar que el estimador es consistente: $plim(\hat{\beta_1})=\beta_1$

### Inferencia: necesitamos un error estándar

Si suponemos 

<br/>

\begin{equation}
\tag{5}
E(e^2|z)=\sigma^2=Var(e)
\end{equation}


Entonces, la varianza aintótica del estimador $\hat{\beta}_1$ es

<br/>

\begin{equation}
\tag{6}
\dfrac{\sigma^2}{n\sigma_x^2\rho_{x,z}}
\end{equation}



Y el estimador de la varianza del estimador es

<br/>

\begin{equation}
\tag{7}
\dfrac{\hat{\sigma}^2}{SST_xR^2_{x,z}}
\end{equation}


Note que entre menor sea la correlación de la endógena con el instrumento, mayor es la varianza del estimador. 


### Ejercicio

#### Motivación: Los origenes coloniales del desarrollo

Acemoglu, Johnson y Robinson ^[Acemoglu, Johnosn y Robinson, 2001, The colonial origins of comparative development: an empirical investigation, *The American Economic Review*, Vol. 95, 5, http://economics.mit.edu/files/4123] se preguntan *¿Cuáles son las causas fundamentales de las grandes diferencias de ingreso per cápita entre paises?* Los autores argumentan que mejores instituciones dan lugar a países más ricos. Los autores parten de la idea histórica según la cual en tiempos coloniales las potencias europeas realizaron dos tipos diferentes de colonización. En la primera establecieron enclaves extractivos, por ejemplo para obtener oro, y en la segunda intentaron replicar las instituciones del país de origen. Mientras que el primer tipo de colonización produce malas instituciones, el segundo produce buenas instituciones. Como consecuencia de ello, hoy día son más ricos los paises donde se dio el segundo tipo de colonización. Para examinar el efecto de las instituciones sobre el desempeño económico los autores proponen estimar el siguiente modelo

\begin{equation}
log y_i=\mu+\alpha R_i+\mathbf{X}'_i\boldsymbol{\gamma}+\epsilon_i
\end{equation}

Donde $log y_i$ es el ingreso per cápita del país i en 1995, $R_i$ es una medida de riesgo de expropiación y $\mathbf{X}_i$ es un vector de variables de control. La variable $R_i$, avexpr, es un índice que mide la protección contra la expropiación, y por lo tanto captura las diferencias institucionales entre paises. En aquellos paises donde los derechos de propiedad privados se respetan el valor del índice es mayor, máximo 10, mientras que en un país donde los derechos de propiedad no son protegidos en absoluto el valor es 0. El coeficiente $\alpha$ es el interés de la investigación. 

#### Procedimiento

Cargue la base de datos "colonial.dta" en R. Restrinja la muestra solo para los paises que son excolonias y tienen los datos completos, baseco=1.


1. Estime la ecuación (1) por MCO, donde la variable dependiente es logpgp95 y $R_i$ es avexpr. Como variables de control incluya

  - lat_abst: distancia absoluta al ecuador, escalado entre 0 y 1
  - asia: dummy para Asia
  - africa: dummy para África
  - other: dummy para otro continente. Toman el valor de 1 los siguientes países:  Australia (AUS), Malta      (MLT), y Nueva Zelanda (NZL). 
  
Las dummies de continente tienen como categoría base América



Table: (\#tab:unnamed-chunk-1)Regresión MCO

|            | coefficient | Std. Error | t-value | p-value |
|:-----------|:-----------:|:----------:|:-------:|:-------:|
|(Intercept) |    5.737    |   0.398    | 14.407  |  0.000  |
|avexpr      |    0.401    |   0.059    |  6.788  |  0.000  |
|lat_abst    |    0.875    |   0.628    |  1.393  |  0.169  |
|asia        |   -0.577    |   0.231    | -2.493  |  0.016  |
|africa      |   -0.881    |   0.170    | -5.181  |  0.000  |
|other       |    0.107    |   0.382    |  0.280  |  0.780  |


2. Los autores indican que si bien los resultados van en la dirección esperada, el parámetro de interés $\alpha$ no se estima consistentemente por MCO ¿Por qué?

3. Los autores proponenen usar como instrumento la tasa de mortalidad de los colonizadores europeos, en logaritmo, logem4 ¿Cuál es la lógica de este instrumento?

4. El instrumento debe cumplir dos condiciones para que permita identificar el parámetro de interés. Indique cuales son los dos supuestos y pruebe econométricamente el que se puede probar. 

5. Estime el modelo usando el estimador de variables instrumentales. Compare los resultados del coeficiente de interés entre los modelos MCO y IV. Interprete los resultados


Table: (\#tab:unnamed-chunk-2)Estimador IV

|             | coefficient | Std. Error | t-value | p-value |
|:-----------:|:-----------:|:----------:|:-------:|:-------:|
| (Intercept) |   1.4405    |   2.8396   | 0.5073  | 0.6139  |
|   avexpr    |   1.1071    |   0.4636   | 2.3881  | 0.0202  |
|  lat_abst   |   -1.1782   |   1.7554   | -0.6712 | 0.5048  |
|    asia     |   -1.0471   |   0.5246   | -1.9961 | 0.0506  |
|   africa    |   -0.4373   |   0.4242   | -1.0308 | 0.3069  |
|    other    |   -0.9904   |   0.9980   | -0.9924 | 0.3251  |

6. Como siempre, las estimaciones por IV dependen de la calidad de los instrumentos. Lea el comentario de Albouy (2012)^[Albouy, D., 2012, The colonial origins of comparative development: an empirical investigation: comment, *The American Economic Review*, Vol 102(6) ] y explique de manera brece y clara porque las estimaciones podrían sufirir del problema de instrumentos débiles

