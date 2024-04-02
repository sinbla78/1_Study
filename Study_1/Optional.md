# Optional

## Optional

### NPE란?

개발을 할 때 많이 발생하는 예외 중 하나가 바로 NPE(NullPointerException)이다. NPE를 피하려면 null 여부를 검사해야 하는데, null 검사를 해야하는 변수가 많은 경우 코드가 복잡해지고 번거롭다. 그래서 null 대신 초기값을 사용하길 권장하기도 한다.

### Optional이란?

Java8 부터는 Optional<T> 클래스를 사용할 수 있어, NPE를 방지할 수 있도록 도와준다. **Optional<T>는 null이 올 수 있는 값을 감싸는 Wrapper 클래스**로, 참조하더라도 NPE가 발생하지 않도록 도와준다. Optional 클래스는 아래와 같은 value에 값을 저장하기 때문에 값이 null이더라도 바로 NPE가 발생하지 않으며, 클래스이기 때문에 각종 메소드를 제공해준다.

- Optional.of - 값이 Null이 아닌 경우
    - 만약 어떤 데이터가 절대 null이 아니라면 Optional.of()로 생성할 수 있다. 만약 Optional.of()로 Null을 저장하려고 하면 NullPointerException이 발생한다.
- Optional.ofNullbale() - 값이 Null일 수도, 아닐 수도 있는 경우
    - 만약 어떤 데이터가 null이 올 수도 있고 아닐 수도 있는 경우에는 Optional.ofNullbale로 생성할 수 있다. 그리고 이후에 orElse 또는 orElseGet 메소드를 이용해서 값이 없는 경우라도 안전하게 값을 가져올 수 있다.

### Optional을 올바르게 사용해야 하는 이유

Optional을 사용하면 코드가 Null-Safe해지고, 가독성이 좋아지며 애플리케이션이 안정적이 된다는 등과 같은 얘기들을 많이 접할 수 있다. 하지만 이는 Optional을 목적에 맞게 올바르게 사용했을 때의 이야기이고, Optional을 남발하는 코드는 오히려 다음과 같은 부작용을 유발할 수 있다.

- NullPointerException 대신 NoSuchElementException이 발생함
    - Optional로 받은 변수를 값이 있는지 확인하지 않고 접근하려고 한다면 NoSuchElementException이 발생하게 된다.
- 오히려 코드의 가독성을 떨어뜨림
    - 위 문제를 해결하기 위해 값이 있는지 확인하려고 하면 코드가 더 늘어나게 된다.
- 시간적, 공간적 비용이 증가함
    - 시간적 : Optional 안에 있는 개체를 얻기 위해서는 Optional 객체를 통해 접근해야 하므로 접근 비용이 증가한다.
    - 공간적 : Optional은 객체를 감싸는 컨테이너이므로 Optional 객체 자페를 저장하기 위한 메모리가 추가로 필요하다.

### Optional을 올바르게 사용하는 방법

- Optional 변수에 Null을 할당하지 말자
- 값이 없을 때 Optional.orElseX()로 기본 값을 반환하자
- 단순히 값을 얻으려는 목적으로만 Optional을 사용하지 말자
- 생성자, 메소드 파라미터 등으로 Optional을 넘기지 말자
- Collection의 경우 Optional이 아닌 빈 Collection을 사용하자
- 반환 타입으로만 사용하자