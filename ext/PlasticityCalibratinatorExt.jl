module PlasticityCalibratinatorExt

struct GUIEquations{<:Plasticity}
    characteristic_equations::Vector{String}
    dependence_equations::Vector{String}
    dependence_sliders
end

end # that's all folks!