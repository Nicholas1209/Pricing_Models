#Gabor Granger analysis
library(ggplot2)

file.choose()

#read in max price to pay
GG <- read.csv(file="/Users/nicholas/Desktop/CSUMB/Spring 23/BUS421/02 pricing/assignment/GaborGranger_hw.csv")

GG_table = as.data.frame(table(GG$Max_Price))                       #convert to R data frame
colnames(GG_table) = c("price","count")                             #change column names
GG_table$price = as.numeric(as.character(GG_table$price))

# exam the data
barplot(GG_table$count, names.arg = GG_table$price, xlab="price", ylab="counts")

GG_table = GG_table[order(GG_table$price, decreasing = TRUE),]      #Decreasing order of table
row.names(GG_table) <- NULL                                         #reindex

# calculate demand 
GG_table$demand = cumsum(GG_table$count)

# calculate cumulative percentage
GG_table$cumulativepercent = GG_table$demand/sum(GG_table$count)

# calculate revenue
GG_table$revenue = GG_table$price*GG_table$demand

#print the data
GG_table

## plot GG demand curve
# Create demand curve
plot(GG_table$price, GG_table$demand, type = "b",  col = "blue", pch=19, xlab = "price", 
     ylab = "demand", main="Gabor-Granger Demand curve")
# create rev curve
plot(GG_table$price, GG_table$revenue, type = "b",  col = "red",lwd=4, pch=19, xlab = "price",
     ylab = "revenue", main="Gabor-Granger revenue curve")
