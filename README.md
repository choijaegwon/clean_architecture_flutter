
## Controller (HomeController)
- UI와 상호 작용하며, 사용자의 액션에 따라 화면 갱신 및 데이터 요청을 처리 HomePresenter의 인스턴스를 가지며, 이를 통해 비즈니스 로직을 수행

## Presenter (HomePresenter)
- 비즈니스 로직을 담당하는 부분으로, GetUserUseCase를 호출하여 유저 데이터를 가져옴. Observer를 사용하여 UseCase의 실행 결과를 처리하고, 그에 따른 콜백 함수를 호출

## UseCase (GetUserUseCase)
- 실제로 데이터를 가져오는 부분으로, Repository를 통해 데이터를 가져옴. 비즈니스 로직을 담당하며, 결과를 Observer를 통해 Presenter로 반환.

## Repository (UsersRepository)
- 데이터에 대한 접근을 추상화하는 인터페이스, 여기서는 유저 데이터에 접근하기 위한 메서드가 정의되어 있을 것입니다.

## Observer (_HomeUserUseCaseObserver)
- UseCase의 실행 결과를 처리하는데 사용, UseCase가 실행을 완료하거나 에러가 발생하면 Presenter의 콜백 함수를 호출하여 결과를 전달


# 데이터 플로우

1. HomeController에서 getUser 메서드를 호출하면, 이는 HomePresenter의 getUser 메서드로 연결
2. HomePresenter는 GetUserUseCase를 통해 실제로 데이터를 가져오기 위해 execute 메서드를 호출
3. GetUserUseCase는 UsersRepository를 통해 데이터를 가져오고, 결과를 Observer를 통해 다시 HomePresenter로 전달
4. HomePresenter는 결과를 받아서 UI를 갱신하거나 에러를 처리하고자 하는 등의 작업을 수행