a<-read.table("E:\\R\\Exploratory Data Analysis\\Week 1\\exdata%2Fdata%2Fhousehold_power_consumption\\household_power_consumption.txt",sep=";",header=TRUE)

a$Date<-as.Date(a$Date, format="%d/%m/%Y")

a<-a[a$Date=="2007-02-02"|a$Date=="2007-02-01",]

a$Time<-paste(a$Date,a$Time,sep=" ")

a$Time<-strptime(a$Time, format="%Y-%m-%d %H:%M:%S")

a$Sub_metering_1<-as.numeric(a$Sub_metering_1)

a$Sub_metering_2<-as.numeric(a$Sub_metering_2)

a$Sub_metering_3<-as.numeric(a$Sub_metering_3)

plot(a$Time,a$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=" ",col="black")

lines(a$Time,a$Sub_metering_2,type="l",col="red")

lines(a$Time,a$Sub_metering_3,type="l",col="blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)

dev.copy(png,'plot3.png')

dev.off()