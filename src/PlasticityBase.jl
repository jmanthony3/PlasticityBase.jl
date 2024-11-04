module PlasticityBase

abstract type Plasticity end

function materialproperties(::Type{<:Plasticity}) end
function materialconstants(::Type{<:Plasticity}) end
function materialconstants_index(::Type{<:Plasticity}) end
function record!() end
function referenceconfiguration() end
function solve!() end

export Plasticity
export materialproperties
export materialconstants
export materialconstants_index
export record!
export referenceconfiguration
export solve!

end # that's all folks!