# AppStorage & SceneStorage

이 둘을 사용하지 않고도 CoreData, TextFile , Binary File 등을 사용해 구현도 가능하지만
초기화 코드들이 필요하고, 이를 위한 코드의 양도 많다.

따라서 SwiftUI 에서는 OS가 제공하는 DefaultSystem 이라는 기본형식을 저장하는 기본 DB를 사용해서
이를 간단하게 저장 할 수 있다.
AppStorage 와 SceneStorage는 비슷하지만
이름대로 각각 App전체와 특정 Scene에서 유효하다는 차이가 존재 한다. 

#### https://developer.apple.com/documentation/swiftui/scenestorage

1) Scene Storage에는 많은 데어터 / 중요 데이터 저장은 적절하지 않다. 상태복원용 데이터만 적합하다. 
   또한 시스템은 데이터가 언제, 얼마나 자주 지속될 것인지에 대해서 보장하지 않는다. 
   사용자가 앱 전환기를 사용하거나 앱을 종료 시키면 사라지게 된다. 
2) Scene 이라는 개념에 대해서 일반적은 iPhone 어플에서는 잘 이해가 안될 수 있다. 
   하나의 씬으로 이뤄진 경우가 많기 떄문이다. 
   이 개념은 iPad / MacOS 에서 좀 더 이해하기 쉽디ㅏ. 
   링크를 참조하자. 
   https://crystalminds.medium.com/introducing-scenestorage-in-swiftui-5a4ec1a90ca3
   



# Swift Char RadarChart

## Swift Open source "Chart(DGChart)" 사용. 

## 기본 화면 구성을 위해서 "UIViewRepresentable" 로 "TransactionRadarChartView" 생성. 

data는 기본 구성인데 옵션에 대해서 정리하려고 합니다.

## Option Values 

- activities: RadarChart 에 각 항목을 정해주는 값. 
  


# ToastContainerView 
## 여타의 프로젝트에 바로 적용가능한 ToastView를 만듬. 

# Photo Picker
## PhotosPicker 를 이용한 이미지 접근을 한다. 
## Transferable 에 대한 정의를 공부 한다. 
