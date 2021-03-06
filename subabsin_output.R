library (data.table)
library(ggplot2)
library(reshape2)

system("SWAT_64rel.exe")

#creat table for subbasin data
sboptab <- read.table("output.sub", skip = 9, header = FALSE)
sboptab = as.data.table(sboptab)

#split 65 subbasin data from that table
sbdttab <- tail(sboptab,65)

#split column data from the table and make new table
sbdttabnew <- sbdttab[, list(V2, V8, V9, V11, V12, V20)]

#setting the column name
setnames(sbdttabnew, old = c("V2","V8", "V9","V11","V12","V20"), new = c("Subbasins", "ET", "SW", "SUR", "GW", "LAT"))

#change table to longer form from wider form
sbpartab <- melt(sbdttabnew, id.vars = "Subbasins", variable.name = "Parameters", value.name = "Q_mmPeryear")

#stakedbar graph
ggplot(data = sbpartab, mapping = aes(x = Subbasins, y = Q_mmPeryear, fill = Parameters)) + geom_bar(stat = "identity") + ggtitle("Comparison of different Parameters yearly")

#scatterplot
#ggplot(data = sbpartab, mapping = aes(x = Subbasins, y = Q_mmPeryear, colour = Parameters, shape = Parameters)) + geom_point() + geom_line() + geom_smooth(method = lm, se = FALSE, fullrange = TRUE) 

#boxplot
#ggplot(data = sbpartab, mapping = aes(x = Parameters, y = Q_mmPeryear)) + geom_boxplot()
