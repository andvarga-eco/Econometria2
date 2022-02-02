# Estimador MCO: Propiedades



Recuerde que el estimador MCO consiste en obtener los parámetros que minimizan la diferencia al cuadrado entre el valor observado y el valor predicho. Con una muestra particular de datos esto quiere decir que son aquellos para que minimizan la expresión

\begin{equation}
\tag{1}
\sum_i^n(y_i-\hat{\beta_1}-\hat{\beta_2}x_{i2}-...-\hat{\beta_k}x_{ik})^2
\end{equation}

Donde $i=1,...,n$ identifica cada observación en la muestra. Al tomar las condiciones del primer orden obtenemos

\begin{align}
\tag{2}
\sum_i^n(y_i-\hat{\beta_1}-\hat{\beta_2}x_{i2}-...-\hat{\beta_k}x_{ik})&=0\\
\sum_i^nx_{i2}(y_i-\hat{\beta_1}-\hat{\beta_2}x_{i2}-...-\hat{\beta_k}x_{ik})&=0\\
.&\\
.&\\
.&\\
\sum_i^nx_{ik}(y_i-\hat{\beta_1}-\hat{\beta_2}x_{i2}-...-\hat{\beta_k}x_{ik})&=0
\end{align}
