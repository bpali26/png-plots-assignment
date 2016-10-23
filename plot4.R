a<-read.table("E:\\R\\Exploratory Data Analysis\\Week 1\\exdata%2Fdata%2Fhousehold_power_consumption\\household_power_consumption.txt",sep=";",header=TRUE)

a$Date<-as.Date(a$Date, format="%d/%m/%Y")

a<-a[a$Date=="2007-02-02"|a$Date=="2007-02-01",]

a$Time<-paste(a$Date,a$Time,sep=" ")

a$Time<-strptime(a$Time, format="%Y-%m-%d %H:%M:%S")

a$Global_active_power<-as.numeric(a$Global_active_power)

a$Global_active_power<-as.numeric(a$Global_active_power*2/1000)

a$Global_reactive_power<-as.numeric(a$Global_reactive_power)

par(mfrow=c(2,2),mar=c(4,4,4,4),oma=c(2,2,0,0))
with(a,{

plot(Time,a$Global_active_power,ylab="Global Active Power (kilowatts)",xlab=" ",type="l")

plot(Time,Voltage,xlab="datetime",type="l")

plot(Time,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=" ",col="black")
lines(Time,Sub_metering_2,type="l",col="red")
lines(Time,Sub_metering_3,type="l",col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)

plot(Time,Global_reactive_power,xlab="datetime",type="l")
})

dev.copy(png,'plot4.png')

dev.off()