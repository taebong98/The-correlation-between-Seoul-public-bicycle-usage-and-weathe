# The-correlation-between-Seoul-public-bicycle-usage-and-weathe
R 프로그램을 이용하여 서울시 공공자전거 대여량과 날씨의 상관관계를 분석해본다.

무역학/경영학을 전공했지만 프로그래밍에 흥미와 관심이 많았습니다.
그래서 프로그래밍과 조금이라도 관련이 있는 강의를 모두 수강했던 기억이 있습니다.

이 레포지토리는 프로그래밍 관련 지식이 전혀 없던 시절(2021년 1학기) 개인(1인) 과제로 진행한 프로젝트를 정리한 레포지토리입니다.

# 데이터
데이터셋은 UCI data set에서 제공하는 "Seoul Bike Sharing Demand Data Set" 데이터를 이용하였습니다. <br>
![image](https://user-images.githubusercontent.com/96982575/227447435-93a1d894-83a8-4d98-90ce-0246e35a2ace.png) <br>
링크: https://archive.ics.uci.edu/ml/datasets/Seoul+Bike+Sharing+Demand

# 개요
당시 따릉이, 카카오바이크, 전동 킥보드 등 이동수단을 대여해주는 기업과 서비스가 늘고있었습니다. <br>

본 프로젝트를 선정한 이유는 다음과 같습니다.

첫째, 공공자전거는 대중교통과 유사한 운영 모델을 갖고 있으며, 여러 사람이 이용합니다. 따라서 따릉이와 같은 공공자전거를 이용하는 사람들의 수요를 예측하기 위해 날씨와 같은 외부 환경 요인을 고려하는 것은 매우 중요하다고 생각했습니다.

둘째, 공공자전거는 지속 가능한 대중교통 수단으로 각광받고 있으며, 따릉이와 같은 서비스는 도시에서 점차 더 중요한 역할을 하고 있습니다. 이에 따라 공공자전거 이용자들의 이용 패턴과 이를 영향하는 요인들을 분석하는 것은 더 나은 도시 교통계획 수립에 도움을 줄 수 있다고 생각했습니다.

셋째, 날씨는 매우 다양한 요인들에 영향을 미치며, 그 중 하나가 대중교통 수단 이용에 있습니다. 예를 들어, 비가 오거나 추운 날씨에는 대중교통보다는 자동차나 택시를 이용하게 되는 경우가 많습니다. 이에 따라 따릉이와 같은 공공자전거 이용 패턴도 날씨에 따라 영향을 받을 수 있을 것이라고 생각했고 구체적인 수치가 궁금했습니다.

# 본문
## RentedBikeCount - Temperature 관계 파악
![image](https://user-images.githubusercontent.com/96982575/227449580-e80e2468-90be-4d42-bf26-7fd19d65da18.png) <br>
일반적으로 온도가 높아질수록 자전거 대여량이 늘어나는 형태입니다.

## Modeling: 단순 선형 회기분석
y = ax + b <br>
y: RentedBikeCount <br>
a: Temperature <br>
a = 329.95, b = 29.08 <br>

### Summary 
![image](https://user-images.githubusercontent.com/96982575/227449917-ef20b1c9-ce09-407b-9b10-5eb2867dc784.png)  <br>
자전거 대여수와 온도 사이의 관계가 있는가? Y <br>
온도가 변하면 자전거 대여수가 변화하는가? Y <br>
온도는 자전거 대여수에 영향을 미치는가?  Y <br>

### 구체적인 관계
대여량 = 329.95 + 29.08*temperature <br>
온도가 자전거 대여량에 약 29%를 설명 <br>
즉, 온도가 1도 올라갈 때마다 대여량은 29대 증가 <br>
극단적인 예로 기온이 100도 일때의 자전거 대여량을 설명하지 못하는 한계가 있다.

## Modeling _ 다중 선형 회귀분석
Rented.Bike.Count ~ Temperature + Humidity + Wind.speed + Visibility + Dew.point.temperature + Solar.Radiation <br>

### 자전거 대여량과 각각의 변수의 상관관계
바이크 대여량과 온도, 습도, 풍속, 가시성, 이슬점온도, 태양 방사의 관계 <br>
![image](https://user-images.githubusercontent.com/96982575/227450577-9827b2ce-8ae3-45ef-b2b3-fb0ce27d3d47.png) <br>
Visibility, Dew.point.temperature 유의하지 않음 <br>
즉 자전거 대여량은 가시성, 이슬점온도와 관계가 없다. <br>

![image](https://user-images.githubusercontent.com/96982575/227451197-e5016262-e907-49e8-bdbd-c4de216d37d4.png)  <br>
Rented.Bike.Count = 905.097 + 36.243*Temperature -11.333*Humidity + 50.743*Wind.speed -118.666*Solar.Radiation <br>
온도, 습도, 풍속, 일사량의 변화가 39%를 설명 <br>
일사량이 낮을 수록 자전거 대여 갯수가 가장 크게 줄어든다 <br>
