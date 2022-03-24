### A Pluto.jl notebook ###
# v0.18.4

using Markdown
using InteractiveUtils

# ╔═╡ 3bfb9ffe-be74-4e54-a02f-8487d5c09dd3
using PlutoUI

# ╔═╡ 29d04192-3c68-4fd1-8305-4addcc2090d4
PlutoUI.TableOfContents(title="Contenido", indent=true)

# ╔═╡ 9afaf420-aad0-11ec-34ce-779d0ef36e3e
md"""
# Introducción 

- Bienvenida al curso de herramientas de investigación computacional. 
"""

# ╔═╡ fd899a44-0a38-469a-8143-e8ce5b520c1a
md"""
## Objetivo
- Conocer el funcionamiento de Julia, Git y LaTeX para incorporarlos como herramientas computacionales durante el desarrollo de las funciones diarias de trabajo.
"""

# ╔═╡ 26b98f1c-6ebe-4c4b-8629-636354065766
md"""
# Julia 

- [Julia](https://www.julialang.org) (Bezanson, Edelman, Karpinski y Shah, 2017) es un lenguaje de programación relativamente nuevo, liberado por primera vez en 2012, con el propósito de ser de **alto nivel** y **rápido**.
  
- Julia es un lenguaje de tipado dinámico que es compilado en tiempo de ejecución (*just-in-time compiled*) utilizando tecnología LLVM. Se dice que Julia ["corre como C pero camina como Python"](https://www.nature.com/articles/d41586-019-02310-3), lo que significa que es *increíblemente* rápido y fácil para prototipar código. 

- Es **multiparadigma**, permite combinar programación imperativa, funcional y programación orientada a objetos. 
  - Es [homoicónico](https://es.wikipedia.org/wiki/Homoiconicidad): permite definir lenguajes de propósito específico dentro de Julia. Por ejemplo: [Turing.jl](https://turing.ml/stable/)
"""

# ╔═╡ 52e06abf-aaec-4743-b538-adf8d246bf2f
md"""
### ¿Por qué fue creado Julia?
- Veamos esta [publicación de sus autores](https://julialang.org/blog/2012/02/why-we-created-julia/).

> We want the speed of C with the dynamism of Ruby. We want a language that's homoiconic, with true macros like Lisp, but with obvious, familiar mathematical notation like Matlab. We want something as usable for general programming as Python, as easy for statistics as R, as natural for string processing as Perl, as powerful for linear algebra as Matlab, as good at gluing programs together as the shell. Something that is dirt simple to learn, yet keeps the most serious hackers happy. We want it interactive and we want it compiled.
"""

# ╔═╡ 29ff95f3-fe2f-4ec5-9296-3e48e002c150
md"""
### Características de Julia

- Gobernanza: existe un grupo de [personas e instituciones](https://julialang.org/blog/2019/02/julia-entities/) detrás de Julia. 
- Es un lenguaje de **propósito general**, a diferencia de MATLAB o R, pero ha sido pensado principalmente para computación científica. 

- **Multiple dispatch**: es el paradigma principal de Julia. La charla de de Stefan Karpinksi llamada [The Unreasonable Effectiveness of Multiple Dispatch ](https://www.youtube.com/watch?v=kc9HwsxE1OY) explica por qué ha funcionado tan bien.
  - Es un sistema **muy eficaz** para extender el ecosistema. 
  - Permite realizar **programación genérica** (*composability*). 
  - "Vine por la velocidad, pero me quedo por el *multiple dispatch*".
"""

# ╔═╡ 3ce2f7cc-daea-4d0a-8142-4bc86ced96a5
md"""
### A programming language to heal the planet together
- [A programming language to heal the planet together: Julia | Alan Edelman | TEDxMIT](https://www.youtube.com/watch?v=qGW0GT1rCvs&t=13s) 

$(PlutoUI.LocalResource("images/heal-the-planet.png"))
"""

# ╔═╡ 78d73bc5-53cd-4cd1-9087-bb0590327d5f
md"""
## Flujo de trabajo 
- REPL
- Visual Studio Code: 
  - Instalación de paquetes. 
  - Crear proyectos (entornos de trabajo).
  - Crear paquetes.
    - Cada paquete es un proyecto, pero no cada proyecto es un paquete.
  - Utilización de [Revise.jl](https://github.com/timholy/Revise.jl). 
- Cuadernos Jupyter
- Cuadernos Pluto (¡como este!)
"""

# ╔═╡ 033c2f3e-060c-4f01-b31d-67b29dacf7d8
md"""
## Referencias y material de apoyo

### Documentación y ayuda de Julia:

- [Documentación oficial de Julia](https://docs.julialang.org/en/v1/), el manual. 
- [Julia Discourse](https://discourse.julialang.org/): el foro de ayuda. Para poder preguntar a otros usuarios e interactuar con la comunidad.

### Cursos en línea

- [Julia Academy](https://juliaacademy.com/courses): buen recurso para iniciarse desde cero en programación. Les recomiendo Introduction to Julia y Julia for Data Science.
- [Julia Scientific Programming](https://www.coursera.org/learn/julia-programming) **en Coursera**: curso introductorio de análisis de datos en Julia. Ofrece un certificado al completar el curso. 
"""

# ╔═╡ dd8dc624-ff1d-42df-89a5-f3160b1370ae
md"""
### Libros: 

**Principiantes:**
- Balbaert, I. (2015). Getting started with Julia. Packt Publishing Ltd. 
- Balbaert, I., Salceanu, A. (2019). Julia 1.0 Programming Complete Reference Guide. Packt Publishing Ltd.  
- Nagar, S., Nagar, & Anglin. (2017). Beginning Julia Programming. Springer Science+ Business Media.

**Programación de alto desempeño:** 
- Balbaert, I., Sengupta, A., & Sherrington, M. (2016). Julia: High Performance Programming. Packt Publishing Ltd.
"""

# ╔═╡ cc935c25-5f0a-42bf-b96a-ac5111463746
md"""
### Cursos en YouTube

Los primeros dos son para principiantes. Los dos últimos son cursos impartidos por el MIT. 

- [Julia from total beginner to power user](https://youtube.com/playlist?list=PLLiJ249IkzRFxZGALbKy75_ZyHxYCUmuk): este es bueno para empezar desde cero. 
- [Julia programming for nervous beginners](https://youtube.com/playlist?list=PLP8iPy9hna6Qpx0MgGyElJ5qFlaIXYf1R): este es bueno si ya saben un poquito de programación. 
- [MIT Introduction to Computational Thinking](https://youtube.com/playlist?list=PLP8iPy9hna6T56GkMHEdSrjCCheNuEwI0): este es de pensamiento computacional. No enseñan directamente a programar con Julia, sino a utilizarlo para resolver problemas de todo tipo. El enlace a los materiales del curso es el siguiente: [https://computationalthinking.mit.edu/Spring21/](https://computationalthinking.mit.edu/Spring21/)
- [Parallel Computing and Scientific Machine Learning](https://youtube.com/playlist?list=PLCAl7tjCwWyGjdzOOnlbGnVNZk0kB8VSa): curso avanzado de ecuaciones diferenciales y *machine learning* científico. También se tratan temas de programación de alto desempeño.

El canal oficial de YouTube de Julia: vale la pena ver las conferencias de los diferentes JuliaCon.

- [The Julia Programming Language - YouTube](https://www.youtube.com/user/JuliaLanguage)
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.37"
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
git-tree-sha1 = "bf0a1121af131d9974241ba53f601211e9303a9e"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.37"

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
# ╠═3bfb9ffe-be74-4e54-a02f-8487d5c09dd3
# ╠═29d04192-3c68-4fd1-8305-4addcc2090d4
# ╟─9afaf420-aad0-11ec-34ce-779d0ef36e3e
# ╟─fd899a44-0a38-469a-8143-e8ce5b520c1a
# ╟─26b98f1c-6ebe-4c4b-8629-636354065766
# ╟─52e06abf-aaec-4743-b538-adf8d246bf2f
# ╟─29ff95f3-fe2f-4ec5-9296-3e48e002c150
# ╟─3ce2f7cc-daea-4d0a-8142-4bc86ced96a5
# ╟─78d73bc5-53cd-4cd1-9087-bb0590327d5f
# ╟─033c2f3e-060c-4f01-b31d-67b29dacf7d8
# ╟─dd8dc624-ff1d-42df-89a5-f3160b1370ae
# ╟─cc935c25-5f0a-42bf-b96a-ac5111463746
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
