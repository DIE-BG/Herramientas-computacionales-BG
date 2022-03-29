# En este script se automatiza una gráfica de crédito bancario al sector privado
using CSV
using DataFrames
using CairoMakie

# Archivo de salida con la gráfica resultante
output = joinpath("julia", "examples", "credito_sector_privado.png")

# Lectura de datos de entrada
datafile = joinpath("julia", "examples", "imm13.csv")
cspdf = CSV.read(datafile, DataFrame) 

## Graficar los datos

# Esta función computa la variación interanual de los datos
function varinteran(vals)
    out = similar(vals)
    out[1:12] .= NaN
    for t in 13:length(vals)
        out[t] = 100 * ((vals[t] / vals[t-12]) - 1)
    end
    out
end

# Esta función formatea las etiquetas para los valores finales
fmtval(v) = string(round(v, digits=1))

df = subset(cspdf, :date => ByRow(d -> d >= Date(2010,12)))
dates = df.date
vals = varinteran(df.csp)

f = let 

    bg_theme = Theme(
        Axis = (
            rightspinevisible=false,
            topspinevisible=false,
            xgridvisible=false,
            ygridvisible=false,
            ylabelsize = 14,
            xlabelsize = 14,
            titlesize=16,
            titlegap=1, 
            titlefont="Arial",
        ),
        Figure = (
            font="Arial"
        ),
    )
    set_theme!(bg_theme)

    f = Figure(resolution=(800,600))
    ax = Axis(f[2,1])

    # Graficar tasa de variación del crédio al sector privado
    dt_ticks = Dates.format.(dates, dateformat"mm/yyyy")
    dt_ticks[end] = "(py) " * dt_ticks[end]
    lentime = length(dt_ticks)
    slice_dates = unique([range(1, lentime; step=lentime÷8)..., lentime])
    l1 = lines!(ax, 1:lentime, vals; color=:blue, linewidth=3)

    # Configuración del eje Y
    CairoMakie.ylims!(ax, 0, 20)
    ax.yticks = 0:2:20

    # Configuración del eje X
    ax.xticks = (slice_dates, dt_ticks[slice_dates])
    ax.xticklabelrotation = pi/4
    ax.xticklabelalign = (:right, :center)

    # Agregar el último valor observado
    ilast = findlast(!isnan, vals)
    pos = Point2f(ilast, vals[ilast])
    scatter!(ax, pos, color=:blue)
    text!(ax, fmtval(vals[ilast]), position=pos, offset=(2,0),textsize=14)

    # Banda de proyección 
    vspan!(ax, ilast, lentime, color=(:gray, 0.2))

    # Punto de proyección a diciembre con su rango
    posf = Point2f(lentime, 9.5)
    rangebars!(ax, lentime, [8.0], [11.0], linewidth=4, whiskerwidth=20)
    scatter!(ax, posf, color=:red)
    text!(ax, fmtval(9.5), position=posf, offset=(10,-5),textsize=14)
    text!(ax, "11.0", position=Point2f(lentime, 11), offset=(-5,+5), textsize=14)
    text!(ax, "8.0", position=Point2f(lentime, 8), offset=(-5,-20), textsize=14)
    text!(ax, "Proyección", position=Point2f(ilast, 20), offset=(0,-20), textsize=9)    

    # Subtítulos 
    ax.title = "Variación relativa interanual\n2015 - 2022 (a)\n(Porcentaje)"

    # Título principal 
    l1 = Label(f[1, 1], "Crédito bancario al sector privado", textsize=18)
    
    # Llamadas 
    l2 = Label(
        f[3, 1], 
        "(a) Al 10 de febrero de 2022\n(py) proyección\nFuente: Banco de Guatemala.",
        textsize=14,
        justification=:left,
        halign=:left,
    )

    rowgap!(f.layout, 0)
    colsize!(f.layout, 1, Relative(1))
    f
end

save(output, f)
