# En este script se procesan datos de un archivo descargado de la página para
# automatizar una gráfica referente al crédito bancario al sector privado  
using Dates
using CSV
using DataFrames
using Chain
using XLSX

## Archivos procesados
datafile = joinpath("julia", "examples", "imm13.xlsx")
outputfile = joinpath("julia", "examples", "processed_imm13.xlsx")

# Tabla de datos originales
xf = XLSX.readxlsx(datafile)
df = DataFrame(xf[1]["C5:AE16"], [:mname, Symbol.(1995:2022)...])

## Funciones para limpieza de los datos

# Esta función ayuda a convertir el mes a número para conformar una fecha
function mname2num(m)
    s = strip(lowercase(m))
    if s == "enero" return 1
    elseif s == "febrero" return 2
    elseif s == "marzo" return 3
    elseif s == "abril" return 4
    elseif s == "mayo" return 5
    elseif s == "junio" return 6
    elseif s == "julio" return 7
    elseif s == "agosto" return 8
    elseif s == "septiembre" return 9
    elseif s == "octubre" return 10
    elseif s == "noviembre" return 11
    elseif s == "diciembre" return 12
    end
end

# Esta función ayuda a limpiar los valores la columna de crédito
cleanval(s::AbstractFloat) = s
cleanval(s::AbstractString) = parse(Float64, replace(s, "," => ""))
cleanval(::Missing) = NaN

## Modificar la forma de la tabla de valores

# cspdf = DataFrame de credito bancario al sector privado
cspdf = @chain df begin
    stack(Not(:mname), variable_name=:year)
    transform(
        :mname => ByRow(mname2num) => :month, 
        :year => ByRow(s -> parse(Int, s)) => :year,
        :value => ByRow(cleanval) => :csp,
    )
    transform([:year, :month] => ByRow(Date) => :date)
    select(:date, :csp)
end


## Guardar el archivo en diferentes formatos 

# Guardar como archivo de Excel
XLSX.openxlsx(outputfile, mode="w") do xf
    sheet = xf[1]
    XLSX.rename!(sheet, "imm13")
    sheet["A1"] = Matrix(cspdf)
end

# Guardar como archivo CSV
CSV.write(joinpath("julia", "examples", "imm13.csv"), cspdf)
