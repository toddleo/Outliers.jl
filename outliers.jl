function outliers{T <: Real}(x::AbstractVector{T}; range::Float64 = 1.5)
    n = length(x)
    Q1, Q3 = quantile(x, 0.25), quantile(x, 0.75)
    LIF = Q1 - range * (Q3 - Q1)
    UIF = Q3 + range * (Q3 - Q1)
    
    o, idc = Float64[], Int64[]

    @inbounds for i in 1:n
        if !(LIF < x[i] < UIF)
            push!(o, x[i])
            push!(idc, i)
        end
    end
    o, idc
end

function outliers{T <: Real}(x::AbstractMatrix{T})
    n,d = size(x)
    x = zscore(x)
    μ,σ = mean(x, 1), std(x, 1)
    x = x'
    Σ = cov(x, vardim = 2)
    MDist(x,μ) = (x .- μ)' * pinv(Σ) * (x .- μ)
    ChiSq(x) = sum(x .^2)
    o = Array(Int64, 0)
    for i in 1:n
        all(MDist(x[:,i], μ)[1] .> 3*σ) && push!(o, i)
        ## MDist(x[:,i], μ)[1] > ChiSq(x[:,i]) && push!(o, i)
    end
    o
end
