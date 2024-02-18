getwd() ## replace the text
install.packages('solaR')
install.packages('zoo')

source('R_code/clearSky.R')

source('R_code/csMother.R')

#get a list of the available models from below line
print(csModels)

load('data_example/cabauw.RData')
cabauw

#this is a zoo object that brings Go, Bn, Do, BoO, kt, cs, p, RH, Temp, Month, theta, m, deltaT, alpha, beta, aod500, aod380, aod700, vis, pwc, un, uo, k, uc, TL, cosThzS, taua, rhog, alpha1, alpha2,
#these are measured observations from a met station
#for a fixed timeframe at 1 min resolution

#get a list of the coordinates for stations from here
a <- read.csv('data_example/stations.csv')
a

#example if we want to run the REST2 model for Cabauw station, the code will look like
cabauwREST2 <- clearSky(meteo = cabauw, loc = a[1, ], model = "REST2")
cabauwREST2

#we get G0, D0, B0, and Bn between 2014-02-03 to 2014-11-21 at 1 min resolution
#G0 is the global horizontal irradiance in W/m2
#D0 is the diffuse horizontal irradiance in W/m2
#Bn is the normal direct irradiance in W/m2
#Bo0 is the extraterrestrial horizontal irradiance in W/m2

#trying for MAC
print(csModels)

cabauwMAC <- clearSky(meteo = cabauw, loc = a[1, ], model = "MAC")
cabauwMAC
#we get the same outputs between the same timeframe at the same resolution

plot(cabauwMAC$G0, cabauw$G0, xlab = 'model', ylab = 'measurements')
