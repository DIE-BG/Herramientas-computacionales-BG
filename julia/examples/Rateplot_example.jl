using Dates
using CSV
using DataFrames
using Chain
using Downloads
using XLSX
using Plots

datafile = joinpath("julia", "examples", "imm13.xlsx")
# Downloads.download(
#     "https://www.banguat.gob.gt/sites/default/files/banguat/imm/imm13.xls", 
#     datafile,
# )

xf = XLSX.readxlsx(datafile)

df = DataFrame(xf[1]["C5:AE16"], [:mname, Symbol.(1995:2022)...])

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

cspdf = @chain df begin
    stack(Not(:mname), variable_name=:year)
    transform(
        :mname => ByRow(mname2num) => :month, 
        :year => ByRow(s -> parse(Int, s)) => :year,
        # :value => ByRow(s -> parse(Float64, s)) => :csp,
        :value => :csp,
    )
    transform([:year, :month] => ByRow(Date) => :date)
    select(:date, :csp)
    dropmissing(:csp)
end

using StatsPlots

@df cspdf begin 
    plot(:date, :csp)
end