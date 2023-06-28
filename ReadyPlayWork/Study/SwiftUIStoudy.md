# AppStorage & SceneStorage

이 둘을 사용하지 않고도 CoreData, TextFile , Binary File 등을 사용해 구현도 가능하지만
초기화 코드들이 필요하고, 이를 위한 코드의 양도 많다.

따라서 SwiftUI 에서는 OS가 제공하는 DefaultSystem 이라는 기본형식을 저장하는 기본 DB를 사용해서
이를 간단하게 저장 할 수 있다.
AppStorage 와 SceneStorage는 비슷하지만
이름대로 각각 App전체와 특정 Scene에서 유효하다는 차이가 존재 한다. 

#### https://developer.apple.com/documentation/swiftui/scenestorage

You use SceneStorage when you need automatic state restoration of the value. SceneStorage works very similar to State, except its initial value is restored by the system if it was previously saved, and the value is shared with other SceneStorage variables in the same scene.

 값의 자동 상태 복원이 필요한 경우 SceneStorage를 사용합니다. SceneStorage 는 State 와 매우 유사하게 작동합니다. 단, 이전에 저장한 경우 초기 값이 시스템에 의해 복원되고 이 값이 동일한 씬(scene)의 다른 SceneStorage 변수와 공유된다는 점이 다릅니다.
 
 The system manages the saving and restoring of SceneStorage on your behalf. The underlying data that backs SceneStorage is not available to you, so you must access it via the SceneStorage property wrapper. The system makes no guarantees as to when and how often the data will be persisted.
  시스템은 사용자 대신 SceneStorage의 저장 및 복원을 관리힙니다. SceneStorage를 백업하는 기본 데이터는 사용 할 수 없으므로 SceneStorage속성 래퍼를 통해 엑세스해 야 합니다.
  시스템은 데이터가 언제, 얼마나 자주 지속될 것인지에 대한 보장을 하지 않습니다.
  
  Each Scene has its own notion of SceneStorage, so data is not shared between scenes.
각 씬(scene)에는 씬 저장에 대한 자체 개념이 있으므로 씬 간에 데이터가 고융 되지 않습니다.

Ensure that the data you use with SceneStorage is lightweight. Data of a large size, such as model data, should not be stored in SceneStorage, as poor performance may result.

SceneStorage와 함께 사용하는 데이터가 경량인지 확인합니다. 모델 데이터와 같이 큰 데이터는 성능이 저하될 수 있으므로 SceneStorage에 저장하면 안됩니다.

If the Scene is explicitly destroyed (e.g. the switcher snapshot is destroyed on iPadOS or the window is closed on macOS), the data is also destroyed. Do not use SceneStorage with sensitive data.

장면이 명시적으로 파괴딘 경우 (에: iPad에서 전환기 스냅샷이 파괴된경우) MacOS에서 OS 또는 창이 닫힘. 데이터도 파괴됩니다. 중요한 데이터와 함께 SceneStorage를 사용하지 마십시오.
