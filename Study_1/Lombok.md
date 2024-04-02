# Lombok

Lombok에서 가장 많이 사용되는

`@Getter` `@Setter`

```java
@Getter @Setter
private String name;
```

위와 같이 특정 필드에 어노테이션을 붙여주면, 다음과 같이 자동으로 생성된 접근자와 설정된 메소드를 사용할 수 있어서 매우 편리하다.

```java
user.setName("Name")
String userName = user.getName();
```

필드 레벨이 아닌 클래스 레벨에 `@Getter`  또는 `@Setter`를 선언해줄 경우, 모든 필드에 접근자와 설정자가 자동으로 생성된다.

## **생성자 자동 생성**

`@NoArgsConstructor` 어노테이션은 파라미터(매개변수)가 없는 기본 생성자 생성`@AllArgsConstructor` 어노테이션은 모든 필드값을 파라미터로 받는 생성자를 만든다.`@RequiredArgsConstructor` 어노테이션은 `final` 이나 `@NonNull` 인 필드 값만 파라미터로 받는 생성자를 만든다.

```java
@NoArgsConstructor
@RequiredArgsConstructor
@AllArgsConstructor
public class User {
  private Long id;
  @NonNull
  private String username;
  @NonNull
  private String password;
  private int[] scores;
}

```

## **ToString 메소드 자동 생성**

`@ToString` 어노테이션만 클래스에 붙여주면 `@Tostring` 자동 생성, ToString 메소드는 객체가 가지고 있는 정보나 값들을 문자열로 만들어 리턴하는 메소드

밑의 예제와 같이 `exclude` 속성을 사용하면, 특정 필드를 `toString()` 결과에서 제외시킬 수도 있다.

```java
@ToString(exclude = "password")
public class User {
  private Long id;
  private String username;
  private String password;
  private int[] scores;
}

```

## **equals, hashCode 자동 생성**

자바 빈을 만들 때 `equals` 와 `hashCode` 메소드를 자주 오버라이딩 하는데, `@EqualsAndHashCode` 어노테이션을 사용하면 자동으로 equals 와 hashCode 메소드를 생성할 수 있다. equals는 대상의 내용 자체를 비교하는 메소드, hashCode는 객체의 주소값을 변환하여 생성한 객체의 고유한 정수값이다.`callSuper` 를 사용해서 메소드 자동 생성 시 부모 클래스의 필드까지 고려할 것인지를 설정할 수 있다. `callSuper = true` 이면 부모 클래스 필드 값도 동일한지 고려하고, `callSuper = false(기본값)` 으로 설정하면 자신 클래스의 필드 값들만 고려한다.

```java
@EqualsAndHashCode(callSuper = true)
public class User extends Domain {
  private String username;
  private String password;
}

```

## **@Data**

`@Data`는 위에서 설명한 어노테이션을 한꺼번에 설정해주는 어노테이션이다.

```java
@Data
public class User {
  // ...
}

```

클래스 레벨에서 `@Data` 어노테이션을 붙여주면 모든 필드를 대상으로 접근자와 설정자가 자동으로 생성되고, `final` 또는 `@NonNull`필드 값을 파라미터로 받는 생성자가 만들어지며, `toString`, `equals`, `hashCode` 메소드가 자동으로 만들어진다.

**@Builder**

`@Builder` 를 사용하면 해당 클래스의 빌더 패턴 클래스를 생성해준다. 빌더 패턴이란 객체를 생성할 때 사용하는 패턴을 의미한다. 가급적 클래스 보다는 직접 만든 생성자 혹은 static 객체 생성 메소드에 붙이는 것을 권장

빌더 사용 예시

```java
@Builder
public class NutritionFacts {
    private final int servingSize;
    private final int servings;
    private final int calories;
    private final int fat;
    private final int sodium;
    private final int carbohydrate;
}

```

빌더 패턴 예시

```java
Mebmer customer = Member.build()
                        .name("홍길동")
                        .age(30)
                        .build();

```

**지양해야할 어노테이션**

`@AllArgsConstructor`

- 오류가 발생하지 않아 아무런 문제없이 동작하는 것으로 보이지만 실제로 입력된 값이 바뀌어 들어가는 상황 발생, `@AllargsConstructor` 대신 `@Builder` 를 사용하면 된다.

`@Data`

- 위에 설명한 어노테이션의 주의사항을 모두 포함하기 때문에, `@Data` 대신 주의사항이 적은 `@Getter, @ToString` 으로 명시하는 것을 권장한다.

`@NoArgsConstructor`

- 필드들이 final로 생성되어 있는 경우에는 필드를 초기화할 수 없기 때문에 생성자를 만들 수 없고 에러가 발생한다. `@NonNull` 같이 필드에 제약조건이 설정되어 있는 경우, 추후 초기화를 진행하기 전까지 생성자 내 null-check 로직이 생성되지 않는다. null-check 란 변수가 null일 경우 runtime에서 오류가 나는 에러를 방지하기 위한 방법.

`@Setter`

- 보안에 취약하기 때문에 **절대** 선언하면 안된다.