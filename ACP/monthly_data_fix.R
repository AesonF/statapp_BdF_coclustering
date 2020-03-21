######################################################################################
############################# TREATMENT OF MONTHLY DATA ##############################
######################################################################################

#  SUMMARY:
#  1. Regrouping the data
#  2. Limiting to 2006-2019
#  3. Making sure decimals aren't deleted




#  location of the folder containing M1,M2 and M3
adress = "/Users/aesonfeehan/Documents/SCHOOL/ENSAE2/STATAPP/donnees/"

#  importing the data...
M1 = read.csv(paste(adress,"M1.CSV", sep=""))
M2 = read.csv(paste(adress,"M2.CSV", sep=""))
M3 = read.csv(paste(adress,"M3.CSV", sep=""))




#1. REGROUPING THE DATA:
M123 <- merge(M1,M2, by = "X")
M123 <- merge(M123,M3, by = "X")
#  it orders first by year and then by month, which is weird, but unimportant for now


#2. LIMITING TO 2006-2019:
good_years <- as.character(c(2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,
							 2017,2018,2019))
allowed_dates <- c(0)
date_index <- 1
for(t in M123$X){
	if(substr(x=t, start = 7, stop=11) %in% good_years){
		allowed_dates <- c(allowed_dates,date_index)
	}
	date_index = date_index + 1
}
M123_extract <- M123[allowed_dates,]


#3. MAKING SURE DECIMALS AREN'T DELETED
n <- length(M123_extract[["X"]])
m <- length(M123_extract[1,])
for(j in 2:m){
	M123_extract[,j] <- as.numeric(as.character(M123_extract[,j]))
}