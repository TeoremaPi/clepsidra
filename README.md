# Problema de la clepsidra
Proyecto de Matlab para calcular como varía la altura del líquido en un recipiente, también compatible con Octave.

Concretamente se pretende visualizar como en una clepsidra cuyo radio varíe con la altura según la siguiente fórmula, la altura del líquido desciende a velocidad constante:

<img src="https://render.githubusercontent.com/render/math?math=r\left(h\right)=r_{0}\,\sqrt[4]{\left(1%2B\frac{2gh}{v_{1}^{2}}\right)}">

La descripción completa del problema, así como su solución física puede encontrarse en el archivo [Solucion.pdf](https://github.com/TeoremaPi/clepsidra/blob/master/Solucion.pdf)

# Uso del programa
La función puede ejecutarse sin ningún argumento de entrada.

	vaciadoDeposito
  
En ese caso, el programa resolverá el problema del vaciado de la clepsidra cuya geometría se ha descrito anteriormente. Concretamente se han usado los siguientes parámetros:

+ <img src="https://render.githubusercontent.com/render/math?math=r_{0}=0.03\,\text{m}">
+ <img src="https://render.githubusercontent.com/render/math?math=v_{1}=0.01\,{\text{m}}/{\text{s}}">
+ <img src="https://render.githubusercontent.com/render/math?math=g=9.81\,{\text{m}}/{\text{s}^{2}}">

Los resultados obtenidos serán una gráfica con la geometría (suponiendo que el objeto sea de revolución), otra gráfica con la evolución del nivel del líquido, la altura final del líquido (debe ser cero si todo ha funcionado bien) y el tiempo total de vaciado.

Por otra parte, la función ejecutarse introduciendo varios argumentos de entrada, todos ellos son opcionales.

	vaciadoDeposito(S, S0, hi)
  
Donde

+ `S` es una función que determina la superficie superior del depósito para cada altura
+ `S0` es la superficie del orificio de salida de la parte inferior del depósito
+ `hi` es la altura inicial del líquido

## Ejemplos

Para un depósito cilíndrico, la superficie superior será constante. Para ver, por ejemplo, como sería el vaciado de un depósito de <img src="https://render.githubusercontent.com/render/math?math=0.5\,\text{m}^{2}"> se puede hacer de la siguiente forma utilizando funciones anónimas.

	vaciadoDeposito(@(h) 0.5)
  
Así mismo, si se quiere imponer que la superficie del orificio de salida sea de <img src="https://render.githubusercontent.com/render/math?math=0.001\,\text{m}^{2}"> y la altura inicial sea de <img src="https://render.githubusercontent.com/render/math?math=2\,\text{m}">, se puede hacer así

	vaciadoDeposito(@(h) 0.5, 0.001, 2)
