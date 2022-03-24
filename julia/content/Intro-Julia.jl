# # Introducción a Julia

# En este documento se exploran algunas de las características que diferencian a
# Julia respecto de lenguajes como MATLAB, Python, o R. Julia permite ser
# utilizado tan fácilmente como MATLAB, sin embargo, más allá de la sintaxis del
# lenguaje, existen diferencias técnicas muy importantes. En este cuaderno
# exploramos algunas de estas características.  

# Para tener una idea más general de las diferencias entre Julia y otros
# lenguajes, podemos consultar las siguientes referencias: 
# - [https://cheatsheets.quantecon.org/](https://cheatsheets.quantecon.org/)
# - [Learn Julia in Y minutes](https://learnxinyminutes.com/docs/julia/)
# - [*Frequently Asked Questions*](https://docs.julialang.org/en/v1/manual/faq/)
# - [*Noteworthy Differences from other Languages*](https://docs.julialang.org/en/v1/manual/noteworthy-differences)

# ## Cómo pedir ayuda 
# La principal fuente de ayuda es el
# [manual](https://docs.julialang.org/en/v1/). También podemos revisar
# documentación de las funciones entrando al modo de ayuda en el REPL
# escribiendo un `?`. Por ejemplo, si escribimos `?cos`, nos dará la
# documentación de la función `cos`. 

# Otra fuente importante de ayuda es el foro de ayuda [Julia Language Discourse](https://discourse.julialang.org/). Muchos problemas comunes ya están resueltos en la sección de primeros pasos. 


# ## Tipos de objetos 

# ¿Es esto un vector? 
x = 1:100

# Podemos hacer algunas operaciones comúnes con este objeto, como indexarlo y obtener su tamaño: 
x[20:30]
#-
length(x) 
#-
size(x)

# Todo parece indicar que este objeto es un vector. Sin embargo, los vectores en Julia son de tipo `Array{T,1}` o `Vector{T}` 

typeof(x)

# Veamos qué tiene por dentro: 
dump(1:100)

# Ajá. Este objeto está representado por 2 enteros nada más. Esto sí es un vector. (Y sí, una variable se puede llamar así `\prime<TAB> = ′`)
x′ = collect(x)

# ¿Qué diferencia hace esto en memoria? Veamos. 
varinfo() 

# Es claro que es mucho más económico (computacionalmente) operar con `x` que
# con `x′`. Esto es algo muy común en Julia, el sistema de tipos, en conjunto
# con el *multiple dispatch* permite que los objetos implementen funcionalidad
# específica, a pesar de ser otros tipos. Este comportamiento se implementa a
# través de [interfaces](https://docs.julialang.org/en/v1/manual/interfaces/).
# Veamos cómo implementar eficientemente un vector de tipo One-hot. 

# Un vector de tipo One-hot es un vector de tamaño $n$ que tiene todas sus
# entradas iguales a cero, excepto en una de las posiciones. Podemos pensar en
# este tipo de vectores como un conjunto de variables dicótomas. A continuación,
# creamos un objeto muy compacto que se comporta como un vector One-hot. 

struct OneHot <: AbstractVector{Int}
    n::Int  # tamaño del vector
    i::Int  # posición donde es 1
end

# Para que este pueda funcionar como un vector (inmutable), debemos implementar,
# como mínimo, los métodos `size` y `getindex`. Como estos están definidos en el
# módulo `Base`, se deben importar para poder extender: 

import Base: size, getindex
size(a::OneHot) = (a.n, )
getindex(a::OneHot, i::Int) = Int(a.i == i)

# ¡Y ahora nuestro objeto ya funciona como un vector! En este punto, ya podemos
# crear un objeto: 
s = OneHot(10, 1)

#-
size(s)
#-
s[0]
#-
s[5:10]
#-
length(s)

# Veamos la representación en memoria de nuestro objeto: 
varinfo()

# Como vemos, este objeto es bastante compacto. Además, por heredar de
# `AbstractVector`, lo podemos utilizar como un vector en cualquier otra
# operación. Por ejemplo, consideremos el siguiente producto matricial: 

A = rand(10, 10)
#-
A * s

# Sin embargo, podemos hacer este producto más eficiente, ¿no?. ¿Cómo? El
# producto de una matriz con un vector One-hot es equivalente a tomar la columna
# $i$ de la matriz en donde la entrada sea igual a 1 en el vector. Debemos
# definir cómo se debe comportar el producto de una matriz con un vector
# One-hot: 

## Extendemos la definición de la multiplicación
Base.:*(A::AbstractMatrix, x::OneHot) = A[:, x.i]

A * s

# Este es solo uno de los muchos ejemplos en Julia sobre las interfaces.


# ## Formas de crear funciones 
# Veamos [All ways to define functions in Julia?](https://discourse.julialang.org/t/all-ways-to-define-functions-in-julia/45816)

# A diferencia de MATLAB, es **muy** fácil crear funciones con parámetros
# opcionales, tanto posicionales como nombrados, y cada uno con valores por defecto: 

function complex_function(a=1, b=a ,c...=ones(10)...; α=0.5, β=1-α, γ=one(a), kwargs...)

    z1 = a*sum(c) + b
    z2 = γ * (α + β)
    @show kwargs

    z = z1 + z2 
    z # return es opcional
end

# Lo que automáticamente genera diferentes formas de llamar a la función: 
methods(complex_function)

# Una muy sencilla es utilizar todos los parámetros por defecto: 
complex_function() 

# Pero también muchas otras formas válidas: 
complex_function(1, 2, 3,4,5,6, γ=2.0, extra1 = 10, extra2 = 20)

# Al llamar con argumentos nombrados, podemos utilizar `;` o no. 


# ## Formas de crear vectores y matrices 
# Esta sintaxis es tomada de Python, se llama *array comprehension*: 

## Índices de remuestreo para bloques de 25 meses
ids = [(12i + j):(12i + j + 24) for i in 0:7, j in 1:12]


# ## Do-block

# Podemos utilizar el bloque `do` para crear funciones anónimas que se pasan a
# funciones superiores.

## Eleva cada elemento en 1:10 al cuadrado
map(1:10) do i
    i^2
end

#-
## Aplica f y luego suma los resultados
sum(1:10) do x
    2x-1
end

# ## Las funciones son de su propio tipo de objeto 

# Crear una función de esta forma: 

h1(x, y) = x + y 

h1(2,3)

# Es equivalente a esto: 

struct H2 <: Function end 
(::H2)(x, y) = x + y
const h2 = H2() 

h2(2, 3)



# ## Julia es un lenguaje compilado 

# A diferencia de Python, MATLAB o R, que son lenguajes interpretados, Julia es
# un lenguaje compilado. Sin embargo, su sistema de tipos dinámicos y la
# interactividad hacen parecer que es un lenguaje interpretado. En los lenguajes
# interpretados, el código fuente es transformado directamente en código de
# máquina, el cual es finalmente ejecutado por el procesador. Como resultado,
# tienden a ser más rápidos y eficientes de ejecutar que los lenguajes
# interpretados. También le dan al desarrollador más control sobre los aspectos
# del hardware, como la administración de la memoria y el uso de la CPU.

# Por ejemplo, veamos esta función: 

f(x) = 2x

# Cada vez que llamemos a `f`, Julia revisará el tipo de la variable `x` y compilará su código antes de ejecutar la función. En este proceso, Julia intentará generar el código **más eficiente posible**, porque sabe exactamente cómo se representa `x`. Veamos cómo es de diferente el código LLVM cuando llamamos a la función con dos tipos diferentes: 

@code_llvm f(2)
#- 
@code_llvm f(2.0)

# El código LLVM es el penúltimo paso antes de la conversión de código a código de máquina. ¿Cómo podemos ver el código de máquina? 

# ### Introspección del código
# Pasos en el análisis de código y ejecución de Julia: 
# - El AST después de analizar <- Macros
# - El AST después de la inferencia de tipo y la optimización <- Funciones generadas (`@code_lowered`)
# - El AST después de la representación de bajo nivel (`@code_typed`)
# - Las funciones LLVM IR <- (`@code_llvm`)
# - El código ensamblador (`@code_native`)

@code_lowered f(2) 
#-
@code_typed f(2)
#-
@code_llvm f(2)
#-
@code_native f(2)




# ## Estabilidad de tipos (type-stability)
# Para generar código eficiente, Julia requiere conocer en tiempo de compilación
# los tipos de las variables involucradas en el cómputo. En general, nos interesa generar funciones que sean computacionalmente eficientes si estas se han de ejecutar muchas veces. Por ejemplo, en algoritmos iterativos como procesos de optimización y simulación. 

# La siguiente macro `@code_warntype` nos ayuda a determinar si una función es estable en tipo. 

@code_warntype f(2.0)

# Veamos un ejemplo clásico de cómo se genera la inestabilidad de tipos: 

## Ejemplo de una función inestable en tipo
function unstable_f(x) 
    if rand() > 0.5 
        x
    else
        1.0
    end
end

#-
@code_warntype unstable_f(1)

#-
@code_warntype unstable_f(1.0)

# En este caso, veamos cómo podemos corregir nuestra función inestable en tipo. 

## Ejemplo de una función estable en tipo
function stable_f(x) 
    if rand() > 0.5 
        x
    else
        one(x)
    end
end
#-
@code_warntype stable_f(1)
#-
@code_warntype stable_f(1.0)

# ### Optimización prematura del código 
# La inestabilidad de tipos es un problema en las funciones en las que se
# requiere alto desempeño. Sin embargo, no es posible hacer todas las funciones
# estables en tipo, ya que a veces la inestabilidad en tipo es necesaria para
# mantener la flexibilidad y facilidad del lenguaje.  
# 
# > ¡La optimización prematura es la raíz de todo mal! - E. W. Dijkstra 

# Se recomienda la siguiente estrategia de programación en Julia: **prototipar
# rápido y después medir el desempeño o cuidar más los detalles**. 

# Para más información: 
# - [What does "type-stable" mean?](https://docs.julialang.org/en/v1/manual/faq/#man-type-stability)
# - [Write "type-stable" functions](https://docs.julialang.org/en/v1/manual/performance-tips/#Write-%22type-stable%22-functions)
# - [Writing type-stable Julia code](https://www.juliabloggers.com/writing-type-stable-julia-code/)




# ## Las variables globales en el REPL tienen mal desempeño
# Las variables globales en Julia tienen un desempeño terrible. No usar globales
# es el primer hecho en los [tips de
# rendimiento](https://docs.julialang.org/en/v1/manual/performance-tips/) . Sin
# embargo, los recién llegados no se dan cuenta es que el REPL es el ambiente global
# global. Para ver por qué, veamos el siguiente ejemplo: 

a = 3
function badidea(n=10000)
    z = 0
    for j in 1:n
        z = a + j
    end
    z
end

#-
@time badidea()

# En general, es mejor que las funciones requieran todos sus argumentos porque
# esto ayuda al compilador a determinar la forma más eficiente de llevar a cabo
# el cómputo. Es decir, Julia necesita saber en tiempo de compilación el tipo de
# todas las variables para generar código eficiente. En el caso de una variable
# global, puede determinar el tipo de la variable, pero no puede predecir si
# este tipo va a cambiar, por lo que Julia supone que podría cambiar. Esto hace
# que genere código menos eficiente. 

@code_warntype badidea() 

# Por otra parte, una forma muy buena de corregir esto es llevar a cabo el
# cómputo enviando todos los parámetros requeridos. Esto permite a Julia
# especializar completamente la función en tiempo de compilación. 

function goodidea(n=10000, a=3)
    z = 0
    for j in 1:n
        z = a + j
    end
    z
end

#-
@time goodidea()

# Finalmente, a veces podría ser necesario utilizar una variable global en la computación. En este caso, una forma de ayudar al compilador es indicarle que la variable **no puede cambiar de tipo**. Esto se hace con la directiva `const`. 

const b = 3
function maybegoodidea(n=10000)
    z = 0
    for j in 1:n
        z = b + j
    end
    z
end

#-
@time maybegoodidea()

#- 
@code_warntype maybegoodidea()



# ## Macros (y metaprogramación)

# La metaprogramación es una característica de la homoiconicidad Julia. La
# idea clave es que cada declaración de Julia es del tipo expresión (`Expr`).

# Julia opera mediante la construcción de un árbol de sintaxis abstracta (AST) a
# partir de las expresiones. Por ejemplo, un símbolo como: `:PhysicalSciences` no
# es una cadena porque es parte del AST y, por lo tanto, es parte de la
# estructura de análisis / expresión. Una cosa interesante es que las
# comparaciones de símbolos son $O(1)$ mientras que las comparaciones de cadenas,
# como siempre, son $O(n)$ es parte de esto. 

# Las macros (las funciones extrañas con una `@`) son funciones sobre expresiones.
# Por lo tanto, puede pensar en la metaprogramación como "código que toma código
# y genera código". Un ejemplo básico es la macro `@time`. A continuación
# realizamos nuestra propia macro `@my_time`:

macro my_time(ex)
    quote
        t0 = time()
        val = $ex
        t1 = time()
        println("elapsed time: ", t1-t0, " seconds")
        val
    end
end

# Esto toma una expresión ex, obtiene el tiempo antes y después de la evaluación
# e imprime el tiempo transcurrido entre (Julia tiene una macro @time que
# también calcula las asignaciones en memoria). Tenga en cuenta que `$ex`
# "interpola" la expresión en la macro. 

## Ejecutamos nuestra macro
@my_time sleep(1)

# Veamos cómo nuestra `@my_time` macro modifica el código al realizar una llamada a `sleep(2)`
@macroexpand @my_time sleep(1)

# Podemos utilizar la función `Base.remove_linenums!` para ver la expresión sin los comentarios
Base.remove_linenums!(@macroexpand @my_time sleep(1)) 

# **¿Por qué las macros?** Una razón es porque permiten definir cualquier
# sintaxis que se desee. Dado que opera en las propias expresiones, siempre que
# se sepa cómo analizar la expresión en código, permite "elegir cualquier
# sintaxis" para que sea nuestra sintaxis de preferencia. Otra razón es porque
# las macros se ejecutan en "tiempo de análisis" del código fuente (*parsing*) y solo se llaman
# una vez (antes de la compilación de la función).

# Como vimos anteriormente, permiten definir lenguajes de propósito específico: 
# - [Turing](https://github.com/TuringLang/Turing.jl)
# - [JuMP](https://github.com/jump-dev/JuMP.jl)

# Incluso algunas otras que también son interesantes: 
# - [OOPMacro](https://github.com/ipod825/OOPMacro.jl)
# - [WatchJuliaBurn](https://github.com/theogf/WatchJuliaBurn.jl)

# Veamos un ejemplo de una macro que define una función que devuelve siempre los
# mismos $n$ números aleatorios: 

macro generate_random_fn(n)
    # Generar números aleatorios
    r = randn(n)
    quote
        function random_function()
            $r
        end
    end |> eval
end

# Si ahora llamamos a `random_function`, esto genera un error, pues todavía no
# ha sido definida: 

random_function()

# Sin embargo, ahora podemos llamar a nuestra macro, que generará los números aleatorios y definirá la función con estos: 

@generate_random_fn 5

# Ahora sí podemos llamar a nuestra función: 

random_function()
#- 
random_function()

# Ahora, podemos generarla con más argumentos. Nótese que es posible llamar también de esta forma a las macros: 
@generate_random_fn(10)

# Y esto generará una función diferente:  

random_function()
#- 
random_function()

# Finalmente, notemos que con la metaprogramación es posible manipular cadenas de texto que representan el código fuente: 

f_str = "2x+1"
f_sym = Meta.parse(f_str)

# Esto devuelve un símbolo, el cual puede contener variable u otras expresiones a ejecutar. Si evaluamos el símbolo, esto nos da un error: 

eval(f_sym)

# ¡Pues claro! `x` no está definida todavía, simplemente manipulamos un código fuente que hacía referencia a esta variable. 

x = 10
eval(f_sym)


