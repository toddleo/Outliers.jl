import Outliers
using Base.Test

a = randn(10)
o, idc = Outliers.outliers(a)
@test isempty(o)

b = [randn(10), 100]
o, idc = Outliers.outliers(b)
@test !isempty(o)
