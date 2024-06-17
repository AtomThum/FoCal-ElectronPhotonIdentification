using CSV
using DataFrames

dataF = CSV.read("OriginalData.csv", DataFrame)
dataF = filter(row -> 5.5 > row.etaclust > 3.4, dataF)

dataNoPCut = dataF[:, [:EHCAL,:ERclust,:E_match,:E_match_ge,:Eclust,:W1Cclust,:W1Fclust,:W2Cclust,:W2Fclust,:Xclust,:Yclust,:dist_match,:dist_match_ge,:eta_match,:etaclust,:imass_pi0,:n_match_02,:n_match_05,:pdg_match,:pdg_parent_match,:phi_match,:pi0_Eclust2,:pt_match,:pt_match_ge,:pt_parent_match,:ptclust,:ptisoR2,:ptisoR2EMMC,:ptisoR2HCAL,:ptisoR2HadMC,:ptisoR4,:ptisoR4EMMC,:ptisoR4HCAL,:ptisoR4HadMC,:vx_match,:vy_match,:vz_match,:totalptR4,:y]]

CSV.write("DataCutP4.csv", dataNoPCut)

dataF = filter(row -> row.ptclust > 1.0, dataF)

dataFpt1 = dataF[:, [:Eclust, :W1Cclust, :W2Cclust, :Xclust, :Yclust, :ERclust, :ptisoR4, :ptisoR4HCAL, :totalptR4, :y]]
dataFpt2 = filter(row -> row.ptclust > 2.0, dataF)[:, [:Eclust, :W1Cclust, :W2Cclust, :Xclust, :Yclust, :ERclust, :ptisoR4, :ptisoR4HCAL, :totalptR4, :y]]
dataFi1pt1 = dataF[:, [:Eclust, :W1Cclust, :W2Cclust, :Xclust, :Yclust, :ERclust, :ptisoR4, :ptisoR4HCAL, :totalptR4, :vx_match, :vy_match, :vz_match, :y]]

CSV.write("DataCutP1.csv", dataFpt1)
CSV.write("DataCutP2.csv", dataFpt2)
CSV.write("DataCutP3.csv", dataFi1pt1)