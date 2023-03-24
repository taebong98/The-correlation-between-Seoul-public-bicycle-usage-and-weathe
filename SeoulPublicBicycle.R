rm(list=ls())
bike = read.csv('C:/dataset/SeoulBikeData.csv') #데이터를 불러옵니다
View(bike)

str(bike) # 8769개 행, 14개 열
summary(bike)

bike$Date[which.max(bike$Rented.Bike.Count)]

names(bike)[4] = 'Temperature'
names(bike)[5] = 'Humidity'
names(bike)[6] = 'Wind.speed'
names(bike)[7] = 'Visibility'
names(bike)[8] = 'Dew.point.temperature' 
names(bike)[9] = 'Solar.Radiation'
names(bike)[10] = 'Rainfall'
names(bike)[11] = 'Snowfall' 

windows()
plot(bike$Temperature, bike$Rented.Bike.Count) #일반적으로 온도가 높아질수록 대여량이 늘어나는 형태 


### Modeling _ 단순 선형 회귀분석 ###
# y = ax + b
# y:(RentedBikeCount), x:(Temperature), (a,b): parameter
bike.temp.reg = lm(Rented.Bike.Count ~ Temperature, data = bike)
bike.temp.reg # a = 329.95, b = 29.08
abline(bike.temp.reg, col='red')

summary(bike.temp.reg)

# 대여량 = 329.95 + 29.08*temperature

### Modeling _ 다중 선형 회귀분석 ###
names(bike)
bike.all.reg = lm(Rented.Bike.Count ~ Temperature + Humidity + Wind.speed + Visibility + Dew.point.temperature + Solar.Radiation, data = bike)

summary(bike.all.reg)
bike.all.reg2 = lm(Rented.Bike.Count ~ Temperature + Humidity + Wind.speed + Solar.Radiation, data = bike)
summary(bike.all.reg2)
