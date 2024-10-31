module PlasticityBase

abstract type Plasticity end

function record!() end
function referenceconfiguration() end
function solve!() end


export Plasticity
export record!
export referenceconfiguration
export solve!

end # that's all folks!