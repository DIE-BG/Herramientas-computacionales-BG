# Funciones de apoyo para automatizar la gr�fica

# Esta funci�n computa la variaci�n interanual de los datos
function varinteran(vals)
    out = similar(vals)
    out[1:12] .= NaN
    for t in 13:length(vals)
        out[t] = 100 * ((vals[t] / vals[t-12]) - 1)
    end
    out
end

# Esta funci�n formatea las etiquetas para los valores finales
fmtval(v) = string(round(v, digits=1))
