module AbstractBases
using DiffEqBase

abstract type AbstractBasis end

# Info

"""
    basecount(basis)

Return total number of basis functions in basis.
"""
function basecount(basis::AbstractBasis)
    error("Not implemented")
end

"""
    basisfuncs(basis)

Return iterator to indices of basis functions in basis.
"""
basisfuncs(basis::AbstractBasis) = 1:basecount(basis)

# Evaluate basis functions for reconstruction of expanded functions

"""
    evaluate!(basis, x, ϕ)

Evaluate all basis functions on the locations given by `x` and store
in `ϕ`, which must have the size (`length(x)`,`basecount(basis)`).
"""
function evaluate!(basis::AbstractBasis, x::AbstractVector, ϕ::AbstractMatrix)
    error("Not implemented")
end

"""
    evaluate(basis, x)

Evaluate and return all basis functions on the locations given by `x`.
"""
function evaluate(basis::AbstractBasis, x::AbstractVector)
    error("Not implemented")
end

# Projections of functions (and polynomials, etc), and numeric vectors
# onto basis.

"""
    project(fun, basis)

Project function `fun` onto `basis`, returning the expansion coeffiecients.
"""
function project(fun, basis::AbstractBasis)
    error("Not implemented")
end

"""
    project(u, basis)

Project the vector `u` onto `basis` using linear interpolation,
returning the expansion coeffiecients.
"""
function project(u::AbstractVector, basis::AbstractBasis)
    error("Not implemented")
end

# Operators

# An operator represented by a matrix in a certain basis, may benefit
# from/necessitate knowing about the basis for certain operations.
abstract type AbstractBasisOperator{T} <: AbstractDiffEqLinearOperator{T} end

basis(op::AbstractBasisOperator) = op.basis

## Identity operator

"""
    eye(basis)

Return the matrix representation of the identity operator in the `basis`.
"""
function Base.eye(basis::AbstractBasis)
    error("Not implemented")
end

## Application of operators onto expanded functions

## Application of operator inverses onto expanded functions

## Computation of expectation values (statistical averages)

## Action of exponential of operator on vector

## Eigendecomposition of operators

export AbstractBasis, basecount, basisfuncs, evaluate, evaluate!, project, basis, eye

end # module
