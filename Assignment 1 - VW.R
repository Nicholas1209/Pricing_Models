#install.packages("pricesensitivitymeter")
library(pricesensitivitymeter)

# R package here: https://rdrr.io/cran/pricesensitivitymeter/

#find file path
file.choose()

# read in respondent data
vw = read.csv("/Users/nicholas/Desktop/CSUMB/Spring 23/BUS421/02 pricing/assignment/VW_homework1.csv")

output_psm_demo <- psm_analysis(toocheap = vw$toocheap,
                                 cheap = vw$cheap,
                                 expensive = vw$expensive,
                                 tooexpensive = vw$tooexpensive)

#plot VW model
psm_plot(output_psm_demo)
#output summary results
summary(output_psm_demo)
