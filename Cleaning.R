## Data preparation for the Course Project: Developing Data Products.

df <- read.csv("ny.gdp.mktp.cd_Indicator_en_csv_v2.csv",na.strings=c("","#DIV/0!"),stringsAsFactors=FALSE)
df <- df[,c("Country.Name", "X2013")]
df <- na.omit(df)
names(df)[3] <- "usd"
df$usd <- as.numeric(gsub(",","", df$usd))
df <- df[!df$Country.Name %in% c("World","Other small states", "OECD members","Middle East & North Africa (all income levels)", "Low & middle income","Least developed countries: UN classification","Heavily indebted poor countries (HIPC)","Fragile and conflict affected situations","Europe & Central Asia (developing only)", "East Asia & Pacific (developing only)", "Central Europe and the Baltics" , "East Asia & Pacific (all income levels)"),]
df <- df[!df$Country.Name %in% c("Sub-Saharan Africa (all income levels)", "Sub-Saharan Africa (developing only)","Pacific island small states" ,"High income: OECD","High income: nonOECD" ,"Middle East & North Africa (developing only)" ,"Lower middle income","Low income","High income" ,"Euro area","Caribbean small states" ,"South Asia" ,"Macedonia, FYR", "Latin America & Caribbean (all income levels)","Latin America & Caribbean (developing only)","Micronesia, Fed. Sts."),]
df <- df[!df$Country.Name %in% c("North America", "Middle income", "Europe & Central Asia (all income levels)", "Small states", "Upper middle income"),]
df <- df[order(df$usd,decreasing = TRUE),]
df$rank <- 1:nrow(df)
row.names(df) <- 1:nrow(df)
names(df)[1] <- "Country"
df$usd <- round(df$usd/10^9, digits=1)
df <- df[df$usd >= 3,]
save(df, file="df.RData")
load("df.RData")


