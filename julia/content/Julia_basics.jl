### A Pluto.jl notebook ###
# v0.18.4

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ b9fc9306-267e-4be8-829e-04057d937806
using PlutoUI 

# ╔═╡ 54a8887b-e9cb-4b7d-baec-f69b050a7220
PlutoUI.TableOfContents(title = "📚 Contenido")

# ╔═╡ ced1d3ee-370d-46f8-b625-468b4aa171bb
md"""
1. Variables y tipos de datos
2. Sentencias condicionales y de iteración
3. Funciones y Multiple Dispatch
"""

# ╔═╡ 0e0b4542-afaf-11ec-3a30-cdcfacda7f43
md"""
# Variables y tipos de datos

- En Julia, al igual que en todos los lenguajes, los datos son almacenados en memoria y accedidos a través de una referencia, denominada **variable**. 

- Las variables pueden ser de diferentes tipos, de acuerdo con la representación interna de memoria de los datos.
"""

# ╔═╡ 2987f00c-1574-4429-a89f-7009a095a895
a = 2

# ╔═╡ a0ac68a0-ad12-4821-a2f7-14cf37af262e
b = 2.0 * a

# ╔═╡ de552ebb-d04f-4185-8cc2-540088b7c55b
s = "Hola mundo"

# ╔═╡ 29ceac87-ef59-416e-8a9a-8e11b2720c08
f = true

# ╔═╡ 3e217975-4985-49cd-b41a-f14cb45c9731
typeof(a), typeof(b), typeof(s), typeof(f) 

# ╔═╡ 56c2e83f-1d4f-4259-877e-1edf6a305469
md"""
## Colecciones

Las colecciones permiten almacenar elementos del mismo tipo (o de diferente tipo) para realizar operaciones sobre conjuntos de datos. 
"""

# ╔═╡ 165eee6f-a56b-47cf-8a25-6fc3053301c9
t = rand(10)

# ╔═╡ 2f4527bb-3f25-4aa1-a8db-040157730608
ϵ = randn(10)

# ╔═╡ 1ac04f8e-cb74-4509-8e4f-7386573ff049
md"""
## Matrices (y arreglos de mayores dimensiones)
Para crear una matriz de valores
"""

# ╔═╡ 720e0368-c3f7-4ff3-98a6-e8711b62a1fa
u = rand(10,10)

# ╔═╡ 0daf64ee-347e-4637-9410-755ca6526f60
md"""
## Vectores y tuplas
- Los vectores pueden ser de cualquier tipo (incluso, de tipos mixtos).
- Las tuplas son colecciones inmutables de elementos de cualquier tipo. 
"""

# ╔═╡ 8952fc5d-7529-41bc-9723-249895d35271
my_names = ["Rodrigo", "Miguel", "Eva"]

# ╔═╡ ab2b0667-0d25-46cc-95b9-ba5830ce73e1
my_tuple = ("Rodrigo", "Miguel", "Eva")

# ╔═╡ 8b53b3de-4c67-4d92-a41a-345a196b9555
md"""
## Tipos compuestos

En Julia es común trabajar con tipos compuestos que representen la información con la que estamos trabajando. 

Por ejemplo, si estamos trabajando un problema con una lista de personas para una fiesta, podríamos utilizar el siguiente **tipo compuesto**: 
"""

# ╔═╡ 278e9ae3-4e3a-4b73-8a7c-39e56267380a
struct Person 
	name::String 
	age::Int
end

# ╔═╡ 426405ba-27c2-4853-b7ae-33ebeb0f8d22
p1 = Person("José", 25)

# ╔═╡ a929b78a-290a-4a87-9c0e-601faf554b53
my_party = [
	p1, 
	Person("Eva María", 36), 
	Person("Ricardo Arjona", 57)
]

# ╔═╡ 5a62a83c-9f18-42ed-b6a0-6f50b1afb6bf
md"""
# Sentencias condicionales y de iteración

- Las sentencias condicionales nos sirven para cambiar el flujo de ejecución de un programa. 
- Las sentencias de iteración permiten repetir los procedimientos u algoritmos ya sea con:
  - un número determinado de veces (ciclo `for`) 
  - un número indeterminado de veces (ciclo `while`).
"""

# ╔═╡ a31b479b-0f16-4892-89d1-231b410041dc
md"""
## Sentencias condicionales

Revisemos las sentencias condicionales básicas con el bloque `if`:
"""

# ╔═╡ ab8179cf-c923-4635-bff0-6138422b18fc
c = 1

# ╔═╡ e8c62834-614e-4b3a-b4df-cf42d79972ce
# (Con PlutoUI podemos crear controles interactivos en nuestros cuadernos)
# @bind c Slider(-5:5; show_value=true)

# ╔═╡ 6b483608-c945-4cca-84eb-a966c45925b6
if c > 1
	"sí"
else
	"no"
end

# ╔═╡ b833aff9-e049-426f-b629-1498d5665415
d = if c > 1
		10
	else
		20
	end

# ╔═╡ ddff967b-4ded-4cc9-ad8d-7ba6ecf5b943
md"""
## Sentencias de iteración
"""

# ╔═╡ c20bc6d0-9d2d-4b01-a15f-77643fee97d1
t

# ╔═╡ b46638be-b4b1-4d12-a179-ff31974cfa0f
begin
	my_sum = zero(eltype(t))
	for x in t 
		my_sum += x
	end
	my_sum
end

# ╔═╡ b778dc21-524d-4f24-a683-47cabd6312d4
with_terminal() do 
	for person in my_party
		println("Having fun with $(person.name)")
	end
end

# ╔═╡ 53d6470a-13be-4a59-819a-c668e6f9f3c2
md"""
# Funciones

Para crear una función, podemos utilizar diferentes recetas: 
"""

# ╔═╡ 58f8f2f7-b0f5-4946-a18a-2066c9cd6c21
simplefn(x) = 2x

# ╔═╡ 0f59173e-1348-4b32-a4a5-2e15c9a01650
simplefn(2)

# ╔═╡ d5ff8cb9-55e8-4642-9079-b76dfd120dd9
md"""
Para definir una función más compleja, utilizamos el bloque `function`
"""

# ╔═╡ 45ae1da9-67c2-4140-b799-83b07934eb05
function complex_fn(x)
	2x
end

# ╔═╡ b6f550b2-f65d-4023-940b-d18e39fe8eaf
md"""
## Argumentos posicionales y nombrados
Podemos crear funciones más complejas y configurables con **argumentos posicionales** y **argumentos nombrados**. 
"""

# ╔═╡ 2fb5901d-50c6-49f1-864c-05812826e7b3
function my_function(a=1, b=a ,c...=ones(10)...; α=0.5, β=1-α, γ=one(a), kwargs...)

    z1 = a*sum(c) + b
    z2 = γ * (α + β)
    @show kwargs

    z = z1 + z2 
    z # return es opcional
end

# ╔═╡ d3acb613-7737-46ce-b1fd-801adc2454b9
md"""
# *Multiple dispatch*

Una de las características de Julia es la utilización del *multiple dispatch*, que se refiere a la capacidad del lenguaje de llamar a las funciones más adecuadas para los tipos con los que se invoca la función. 

Debido a esta característica, muchas funciones tienen diferentes **métodos**. Veamos un ejemplo: 
"""

# ╔═╡ 25b0b4d3-cffb-4441-8627-513b9a080767
+

# ╔═╡ 37cdd64d-a037-483f-9837-48e3d119e2aa
sum

# ╔═╡ 2ecb0e73-38e7-45a4-90a5-d2b31cf35481
md"""
## Métodos de una función
"""

# ╔═╡ 9dd6990c-d347-4013-8466-767e2c3b2624
methods(sum)

# ╔═╡ ce2b298b-f3f0-4c16-9763-dba6e6eff31e
md"""
## Comprobando el *multiple dispatch*
"""

# ╔═╡ ca7f901c-0b58-4efd-91b7-afd0b728093f
sum([1,2,3,4,5])

# ╔═╡ 3e72f5e4-e110-4b37-add9-1e4473b443d2
@which sum([1,2,3,4,5])

# ╔═╡ 62eb02ae-5d4a-4ef3-b6eb-5547274d214d
sum((1,2,3,4,5))

# ╔═╡ 03c11c89-5849-4e84-96d8-6b7f09223c4f
@which sum((1,2,3,4,5))

# ╔═╡ 416a74f4-78e8-4f9a-8df2-cef7262f9efc
md"""
## Utilidad del multiple dispatch 

La charla de de Stefan Karpinksi llamada [The Unreasonable Effectiveness of Multiple Dispatch ](https://www.youtube.com/watch?v=kc9HwsxE1OY) explica por qué ha funcionado tan bien.
  - **Es un sistema muy eficaz para extender el ecosistema**: una persona crea un tipo en un paquete, otra persona lo mejora y extiende en otro paquete.  
    - Plots.jl -> StatsPlots.jl
    - Random -> Distributions.jl
  - Permite realizar **programación genérica**: esto permite generalizar más fácilmente y la componibilidad del lenguaje. 
  - "*Vine por la velocidad, pero me quedo por el multiple dispatch*".
"""

# ╔═╡ 3b03b8fa-f162-4c00-88c4-02417c97276f
md"""
## Programación genérica
"""

# ╔═╡ 93731703-b604-4830-a1fb-70a1e44520c1
begin
	# Tipo abstracto para representar figuras geométricas
	abstract type GeometricFigure end 
	
	struct Square <: GeometricFigure 
		side::Float64
	end
	
	struct Circle <: GeometricFigure 
		radius::Float64
	end
	
	# Métodos específicos para obtener el área y describir al objeto
	area(s::Square) = s.side^2
	area(c::Circle) = pi*c.radius^2
	whatami(::Square) = "Square"
	whatami(::Circle) = "Circle"
	
	# Método generales para mostrar el objeto
	whatami(::GeometricFigure) = "GeometricFigure"
	function Base.show(io::IO, g::GeometricFigure)
		i = whatami(g)
		myarea = area(g)
		println(io, "¡Hola! Soy un $i y mi área es ", myarea)
	end
end

# ╔═╡ 7968fa64-f493-4b68-a38a-347a96314efc
sq1 = Square(1)

# ╔═╡ ba4aee5e-d1c5-49d0-9f58-c404d33ef59a
c1 = Circle(1)

# ╔═╡ e5e9a3bc-96b1-493a-af53-c8043d79170b
md"""
## Extendiendo la funcionalidad

Si otra persona crea otro paquete con más figuras, puede utilizar estas definiciones para extender la funcionalidad: 
"""

# ╔═╡ 672e06b7-9049-4959-86e1-215e7f7e8b4a
begin
	# Extendiendo un tipo nuevo
	struct Triangle <: GeometricFigure 
		base::Float64
		height::Float64
	end
	
	# Extendiendo la funcionalidad específica
	area(t::Triangle) = t.base * t.height/ 2
	# ¿ cómo podemos definir el método whatami para un triángulo?
end

# ╔═╡ 4482a144-4df3-4742-a089-179b362c1e99
t1 = Triangle(2,3)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.38"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "024fe24d83e4a5bf5fc80501a314ce0d1aa35597"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.0"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[HypertextLiteral]]
git-tree-sha1 = "2b078b5a615c6c0396c77810d92ee8c6f470d238"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.3"

[[IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[LinearAlgebra]]
deps = ["Libdl"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "85b5da0fa43588c75bb1ff986493443f821c70b7"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.2.3"

[[Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "670e559e5c8e191ded66fa9ea89c97f10376bb4c"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.38"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
"""

# ╔═╡ Cell order:
# ╠═b9fc9306-267e-4be8-829e-04057d937806
# ╠═54a8887b-e9cb-4b7d-baec-f69b050a7220
# ╠═ced1d3ee-370d-46f8-b625-468b4aa171bb
# ╟─0e0b4542-afaf-11ec-3a30-cdcfacda7f43
# ╠═2987f00c-1574-4429-a89f-7009a095a895
# ╠═a0ac68a0-ad12-4821-a2f7-14cf37af262e
# ╠═de552ebb-d04f-4185-8cc2-540088b7c55b
# ╠═29ceac87-ef59-416e-8a9a-8e11b2720c08
# ╠═3e217975-4985-49cd-b41a-f14cb45c9731
# ╟─56c2e83f-1d4f-4259-877e-1edf6a305469
# ╠═165eee6f-a56b-47cf-8a25-6fc3053301c9
# ╠═2f4527bb-3f25-4aa1-a8db-040157730608
# ╟─1ac04f8e-cb74-4509-8e4f-7386573ff049
# ╠═720e0368-c3f7-4ff3-98a6-e8711b62a1fa
# ╟─0daf64ee-347e-4637-9410-755ca6526f60
# ╠═8952fc5d-7529-41bc-9723-249895d35271
# ╠═ab2b0667-0d25-46cc-95b9-ba5830ce73e1
# ╟─8b53b3de-4c67-4d92-a41a-345a196b9555
# ╠═278e9ae3-4e3a-4b73-8a7c-39e56267380a
# ╠═426405ba-27c2-4853-b7ae-33ebeb0f8d22
# ╠═a929b78a-290a-4a87-9c0e-601faf554b53
# ╟─5a62a83c-9f18-42ed-b6a0-6f50b1afb6bf
# ╟─a31b479b-0f16-4892-89d1-231b410041dc
# ╠═ab8179cf-c923-4635-bff0-6138422b18fc
# ╠═e8c62834-614e-4b3a-b4df-cf42d79972ce
# ╠═6b483608-c945-4cca-84eb-a966c45925b6
# ╠═b833aff9-e049-426f-b629-1498d5665415
# ╟─ddff967b-4ded-4cc9-ad8d-7ba6ecf5b943
# ╠═c20bc6d0-9d2d-4b01-a15f-77643fee97d1
# ╠═b46638be-b4b1-4d12-a179-ff31974cfa0f
# ╠═b778dc21-524d-4f24-a683-47cabd6312d4
# ╟─53d6470a-13be-4a59-819a-c668e6f9f3c2
# ╠═58f8f2f7-b0f5-4946-a18a-2066c9cd6c21
# ╠═0f59173e-1348-4b32-a4a5-2e15c9a01650
# ╟─d5ff8cb9-55e8-4642-9079-b76dfd120dd9
# ╠═45ae1da9-67c2-4140-b799-83b07934eb05
# ╟─b6f550b2-f65d-4023-940b-d18e39fe8eaf
# ╠═2fb5901d-50c6-49f1-864c-05812826e7b3
# ╟─d3acb613-7737-46ce-b1fd-801adc2454b9
# ╠═25b0b4d3-cffb-4441-8627-513b9a080767
# ╠═37cdd64d-a037-483f-9837-48e3d119e2aa
# ╟─2ecb0e73-38e7-45a4-90a5-d2b31cf35481
# ╠═9dd6990c-d347-4013-8466-767e2c3b2624
# ╟─ce2b298b-f3f0-4c16-9763-dba6e6eff31e
# ╠═ca7f901c-0b58-4efd-91b7-afd0b728093f
# ╠═3e72f5e4-e110-4b37-add9-1e4473b443d2
# ╠═62eb02ae-5d4a-4ef3-b6eb-5547274d214d
# ╠═03c11c89-5849-4e84-96d8-6b7f09223c4f
# ╟─416a74f4-78e8-4f9a-8df2-cef7262f9efc
# ╟─3b03b8fa-f162-4c00-88c4-02417c97276f
# ╠═93731703-b604-4830-a1fb-70a1e44520c1
# ╠═7968fa64-f493-4b68-a38a-347a96314efc
# ╠═ba4aee5e-d1c5-49d0-9f58-c404d33ef59a
# ╟─e5e9a3bc-96b1-493a-af53-c8043d79170b
# ╠═672e06b7-9049-4959-86e1-215e7f7e8b4a
# ╠═4482a144-4df3-4742-a089-179b362c1e99
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
