module Outliers

export outliers

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

end
