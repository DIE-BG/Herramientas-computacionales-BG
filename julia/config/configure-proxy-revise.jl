# # Configuración de servidor proxy y Revise

# ## Configuración de servidor proxy
# Para poder descargar e instalar paquetes en el Banco de Guatemala, Julia
# requiere permisos de red para clonar repositorios de Github. Para esto, es
# necesario agregar una configuración del servidor proxy en el archivo de
# *startup* de Julia. Este archivo se encuentra en el directorio de
# configuración de Julia, en la carpeta del usuario. A continuación se indican
# una serie de pasos para llevar a cabo esta configuración. En este ejemplo, el
# usuario es `RRCP`, el cual debe ser apropiadamente reemplazado. 

# 1. Navegar al directorio de usuario. Por ejemplo: `C:\Users\RRCP\.julia\config`. Si el
#    directorio `config` no existe, entonces se debe crear. 
# 2. Dentro del directorio `config`, crear un archivo llamado `startup.jl`. 
# 3. Colocar dentro de dicho archivo la siguiente configuración. 
# 4. Reiniciar Julia si estaba abierto para que surtan efecto los cambios. 

## Configuración servidor proxy 
ENV["HTTP_PROXY"] = "http://130.1.11.66:80"
ENV["HTTPS_PROXY"] = "http://130.1.11.66:80"
ENV["JULIA_SSL_NO_VERIFY_HOSTS"] = "github.com"

# ### Probando la configuración
# Para probar que la instalación de paquetes fue configurada correctamente, ejecutar en Julia los siguientes comandos: 

import Pkg
Pkg.add("Example")

# O alternativamente, en modo `Pkg`: 
# ```julia
# julia> ]
# (@v1.6) pkg> add Example
# ```


# ## Instalación de Revise
# [Revise.jl](https://github.com/timholy/Revise.jl) es un paquete que permite
# actualizar las definiciones de funciones y datos en paquetes definidos por el
# usuario o en archivos de funciones individuales. Actualmente posee la
# limitación de que no permite redefinir tipos de datos creados por el usuario,
# pero esta es una limitación de Julia en sí misma. De cualquier forma, `Revise`
# permite un flujo de trabajo más fluido y ordenado, permitiéndonos organizar el
# código en paquetes o archivos separados sin tener que estar recargándolos.

# Para agregar `Revise` ejecutamos los siguientes comandos: 

import Pkg
Pkg.add("Revise")

# Para probar `Revise` podemos incluir un archivo de funciones con la función
# `includet`, crear algunas definiciones y probar en el REPL que estas se
# actualizan al llamarlas. 

using Revise 
includet("funciones.jl")

# `Revise` es cargado automáticamente por Visual Studio Code. Para revisar esta
# configuración, presionar `Control+Shift+P`, o bien `F1` en el editor, buscar
# la configuración de la extensión de Julia y revisar que esté marcada la
# casilla de cargar Revise automáticamente. 