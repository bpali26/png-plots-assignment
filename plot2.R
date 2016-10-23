a<-read.table("E:\\R\\Exploratory Data Analysis\\Week 1\\exdata%2Fdata%2Fhousehold_power_consumption\\household_power_consumption.txt",sep=";",header=TRUE)

a$Date<-as.Date(a$Date, format="%d/%m/%Y")

a<-a[a$Date=="2007-02-02"|a$Date=="2007-02-01",]

a$Time<-paste(a$Date,a$Time,sep=" ")

a$Time<-strptime(a$Time, format="%Y-%m-%d %H:%M:%S")

a$Global_active_power<-as.numeric(a$Global_active_power)

a$Global_active_power<-as.numeric(a$Global_active_power*2/1000)

plot(a$Time,a$Global_active_power,ylab="Global Active Power (kilowatts)",xlab=" ",type="l",width = 480, height = 480,bg = "white")

dev.copy(png,'plot2.png')
dev.off()
