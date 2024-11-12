module PlasticityCalibratinatorExt

using PlasticityBase
using PlasticityCalibratinator

characteristicequations(        ::Type{<:Plasticity}) = [] # ::Vector{Union{Char, String, LaTeXString}}
dependenceequations(            ::Type{<:Plasticity}) = [] # ::Vector{Union{Char, String, LaTeXString}}
dependencesliders(              ::Type{<:Plasticity}) = [] # ::Vector{NamedTuple{label, range, format, startvalue}}

function calibration_init(      ::Type{<:Plasticity}, args...; kwargs...) end
function dataseries_init(       ::Type{<:Plasticity}, args...; kwargs...) end
function plot_sets!(            ::Type{<:Plasticity}, args...; kwargs...) end
function calibration_update!(   ::Type{<:Plasticity}, args...; kwargs...) end
function update!(               ::Type{<:Plasticity}, args...; kwargs...) end

export characteristicequations
export dependenceequations
export dependencesliders
export calibration_init
export dataseries_init
export plot_sets!
export calibration_update!
export update!

end # that's all folks!