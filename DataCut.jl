using CSV
using DataFrames

dataF = CSV.read("OriginalData.csv", DataFrame)
dataF = filter(row -> 5.5 > row.etaclust > 3.4, dataF)
dataF = filter(row -> row.ptclust > 1.0, dataF)

dataFpt1 = dataF[:, [:Eclust, :W1Cclust, :W2Cclust, :Xclust, :Yclust, :ERclust, :ptisoR4, :ptisoR4HCAL, :totalptR4, :y]]
dataFpt2 = filter(row -> row.ptclust > 2.0, dataF)[:, [:Eclust, :W1Cclust, :W2Cclust, :Xclust, :Yclust, :ERclust, :ptisoR4, :ptisoR4HCAL, :totalptR4, :y]]

CSV.write("DataCutP1.csv", dataFpt1)
CSV.write("DataCutP2.csv", dataFpt2)