### A Pluto.jl notebook ###
# v0.18.4

using Markdown
using InteractiveUtils

# ╔═╡ af70bcb0-b42a-11ec-1188-9d28e2e20c3c
md"""
# Flujos de trabajo con Julia

Para utilizar Julia podemos utilizar alguno de estos flujos de trabajo: 
- REPL: para pruebas rápidas y para cargar Pluto. 
- Visual Studio Code:
  - Proyectos de investigación 
  - Desarrollo de paquetes
  - Para scripts de automatización
- Cuadernos Jupyter: 
  - Proyectos de investigación en los que se desee desarrollar el código y mostrar los resultados a la vez. 
- Cuadernos Pluto: 
  - Similar al anterior, pero cuando sea requerido utilizar interactividad. 
"""

# ╔═╡ 2aa4873c-b9b7-4787-9228-c05ab86a79e2
md"""
## REPL (*Read-Eval-Print Loop*)

- Modo de instrucciones de Julia: 
```julia
julia> 
```

- Modo de gestión de paquetes: entrar con `]`
  - Por defecto, en este modo se encuentra activo el **entorno global** de Julia. 
```julia
julia> ]
(@v1.6) pkg> 
``` 

- Modo de ayuda: entrar con `?`
```julia
julia> ?
help?> 
```
"""

# ╔═╡ 858db1fb-5093-4aa5-9ecf-00f6222375f1
md"""
## Instalación de paquetes

- Configurar el servidor proxy (si es necesario)
- Entrar en modo paquete
- Decidir si el paquete se instala en el **entorno global** o el **entorno local** de un **proyecto**.
"""

# ╔═╡ b1f03ad3-8e01-4afd-8286-5cd2a8076ea3
md"""
## Proyectos

- Los proyectos de Julia permiten registrar los paquetes utilizados en una aplicación específica. 
- Su propósito es facilitar la replicación del código por otros usuarios. 
- Para activar un proyecto, utilizamos el comando `activate` en modo de gestión de paquetes: 
```julia
julia> ]
(@v1.6) pkg> activate <directorio>
```

- Si utilizamos `activate .`, activaremos un proyecto en el directorio de trabajo en que se encuentre Julia (el cual podemos consultar con `pwd()`)
  - Si deseamos cambiar de directorio, podemos hacerlo con `cd(<directorio>)`. Por ejemplo `cd("C:\\Users\\RRCP\\Documentos")`
"""

# ╔═╡ b7290d5f-85b2-42d2-9588-93eddff336d1
md"""
## Cuadernos Pluto

- Los cuadernos Pluto pueden ser la forma más sencilla de empezar. 
- Veamos cómo instalar Pluto.
- Vamos a crear un nuevo cuaderno. 
- Experimentemos con el gestor de paquetes en Pluto. 

```julia
julia> import Pluto
julia> Pluto.run()
```
"""

# ╔═╡ 210d4e50-d9ad-448b-8e72-c7cd95a84957
md"""
## Visual Studio Code
- Instalación y configuración de la extensión de Julia. 
- Crear un directorio con un proyecto de Julia. 
- Crear un *script* de prueba y ejecutar el código. 
- Convertir el proyecto en un repositorio para colaborar con algún compañero. 

El paquete de Julia llamado [`DrWatson`](https://juliadynamics.github.io/DrWatson.jl/stable/) permite gestionar un *proyecto reproducible* y provee algunas funcionalidades para acceder a los directorios del proyecto. 
"""

# ╔═╡ 348eb974-067b-433d-96be-0d07c229b0cd
md"""
## Jupyter Notebooks 
- Actualmente, con la extensión de Julia es posible trabajar directamente en cuadernos Jupyter. 
- Estos cuadernos permiten embeber el código fuente junto con un documento con formato (similar a Microsoft Word). 
- Veamos cómo crear un cuaderno y utilizarlo con nuestro proyecto. 
"""

# ╔═╡ Cell order:
# ╟─af70bcb0-b42a-11ec-1188-9d28e2e20c3c
# ╟─2aa4873c-b9b7-4787-9228-c05ab86a79e2
# ╟─858db1fb-5093-4aa5-9ecf-00f6222375f1
# ╟─b1f03ad3-8e01-4afd-8286-5cd2a8076ea3
# ╟─b7290d5f-85b2-42d2-9588-93eddff336d1
# ╟─210d4e50-d9ad-448b-8e72-c7cd95a84957
# ╟─348eb974-067b-433d-96be-0d07c229b0cd
