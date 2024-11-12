module PlasticityBase

abstract type AbstractPlasticity end
abstract type AbstractLoading end

abstract type AbstractStrainControl{T1<:Integer, T2<:AbstractFloat} <: AbstractLoading
    # θ       ::T2                # applied temperature
    # ϵ_dot   ::T2                # applied strain rate
    # ϵₙ      ::T2                # final strain
    # N       ::T1                # number of strain increments
    # params  ::Dict{String, T2}  # material constants
end

abstract type AbstractConfigurationCurrent
    # θ       ::T         # applied temperature
    # ϵ_dot   ::T         # applied strain rate
    # N       ::Integer   # number of strain increments
    # σ       ::Vector{T} # deviatoric stress tensor
    # ϵ       ::Vector{T} # total strain tensor
end

abstract type AbstractConfigurationHistory
    # σ::AbstractVecOrMat{T} # deviatoric stress tensor
    # ϵ::AbstractVecOrMat{T} # total strain tensor
end

const ConfigurationTuple = Tuple{<:AbstractConfigurationCurrent, <:AbstractConfigurationCurrent, <:AbstractConfigurationHistory}

function Base.:+(x::T, y::T) where {T<:AbstractConfigurationHistory}
    # return AbstractConfigurationHistory{eltype(x.σ)}(
    #     hcat(x.σ, y.σ),
    #     hcat(x.ϵ, y.ϵ .+ x.ϵ[:, end]),
    # )
end

function Base.copyto!(reference::AbstractConfigurationCurrent, history::AbstractConfigurationHistory)
    # reference.σ = history.σ[:, end]
    # reference.ϵ = history.ϵ[:, end]
    # return nothing
end

function record!(history::AbstractConfigurationHistory, i, current::AbstractConfigurationCurrent)
    # history.σ[:, i] .= current.σ
    # history.ϵ[:, i] .= current.ϵ
end

function referenceconfiguration(::Type{<:AbstractPlasticity},
        loading::AbstractLoading)::ConfigurationTuple
    # θ       = loading.θ
    # ϵ_dot   = loading.ϵ_dot
    # N       = loading.N
    # params  = loading.params
    # M       = N + 1
    # T       = typeof(float(θ))
    # current = AbstractConfigurationCurrent{T}(θ, ϵ_dot, ϵₙ, N, 0., 0.)
    # history = AbstractConfigurationHistory{T}(
    #     Matrix{T}(undef, (1, M)),
    #     Matrix{T}(undef, (1, M))
    # )
    # record!(history, 1, current)
    # return (current, current, history)
end

function solve!(current::AbstractConfigurationCurrent,
        history::AbstractConfigurationHistory)
    # for i ∈ range(2, current.N + 1)
    #     current.ϵ = current.ϵ + Δϵ
    #     current.σ = stressfunction()
    #     record!(history, i, current)
    # end
    # return nothing
end

function kernel(T::Type{<:AbstractPlasticity},
        loading::AbstractLoading)::ConfigurationTuple
    configuration   = referenceconfiguration(T, loading)
    reference       = configuration[1]
    current         = configuration[2]
    history         = configuration[3]
    solve!(current, history)
    return (reference, current, history)
end

function nextloadingphase(nextconfiguration::ConfigurationTuple,
        previoushistory::AbstractConfigurationHistory)::ConfigurationTuple
    reference   = nextconfiguration[1]
    copyto!(reference, previoushistory)
    current     = reference
    history     = nextconfiguration[3]
    record!(history, 1, current)
    return (reference, current, history)
end

# abstract/composite types
export AbstractPlasticity
export AbstractLoading
export AbstractStrainControl
export AbstractConfigurationCurrent
export AbstractConfigurationHistory
export ConfigurationTuple

# functions to re-export
export +
export copyto!
export record!
export referenceconfiguration
export solve!

# functions to use
export kernel
export nextloadingphase

end # that's all folks!