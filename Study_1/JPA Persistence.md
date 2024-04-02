# JPA Persistence

## Persistence

- 단어의 뜻은 없어지지 않고 오랫동안 지속죈다는 의미이다.
    - JPA에서의 영속성은 위의 단어 해석처럼  Entity를 영구적으로 저장해주는 환경을 의미한다.

## EntityManagerFactory와 EntityManager

- 데이터베이스를 하나만 사용하는 애플리케이션은 보통 EntityMangerFactory를 하나만 생성한다.
- EntityManagerFactory 는 여러 EntityManager 를 생성하는 객체이다. 두 객체의 차이점은 아래와 같다.
    - EntityManagerFactory
        - 생성하는데 비용이 크기 때문에 애플리케이션 전체에서 한 번만 생성해 공유하도록 설계되어 있다.
        - 여러 스레드가 동시에 접근해도 안전하다. 따라서 서로 다른 스레드 간에 공유가 가능하다.
    - EntityManager
        - 생성하는데 비용이 거의 들지 않는다.
        - 여러 스레드가 동시에 접근하면 동시성 문제가 발생하기 때문에 스레드 간에 절대 공유하지 않는다.
        - 데이터베이스 연결이 꼭 필요한 시점까지 (보통 트랜잭션을 시작할 때) 커넥션을 얻지 않는다.
    
    //생성코드
    

```java
EntityManagerFactory emf = Persistence.createEntityManagerFactory("person"); //파라미터는 영속성 단위 이름
EntityManager em = emf.createEntityManager();
```

## 영속성 컨텍스트

영속성 컨텍스트(persistence context)는 '엔티티를 영구 저장하는 환경' 이라는 뜻이다. EntityManager를 이용해 Entity를 저장하거나 조회할 때 EntityManager는 영속성 컨텍스트에 Entity를 보관하고 관리한다. EntityManager객체.persist(Entity객체)를 실행하면 영속성 컨텍스트가 Entity를 관리하게 된다.

- 영속성 컨텍스트는 눈에 보이지 않는 논리적인 개념이다. 또한 EntityManager를 하나 생성할 때 하나가 만들어지며, EntityManager를 통해 접근할 수 있고 관리할 수 있다.
    - 영속성 컨텍스트는 Entity를 식별자 값으로 구분한다.
        - Entity에서 @Id 어노테이션을 통해 지정한 멤버변수가 영속성 컨텍스트에 식별자 값으로 저장된다.
    
    - JPA는 보통 트랜잭션을 커밋하는 순간 영속성 컨텍스트에 새로 저장된 Entity를 데이터베이스에 반영한다.(이런 과정을 flush라 한다.)
    - 1차 캐시를 이용한다.
        - 영속성 컨텍스트 내부에 존재하는 캐시를 1차 캐시라 한다. 영속 상태의 Entity는 모두 이곳에 저장되며 키는 @Id로 매핑한 식별자이며 값은 Entity 인스턴스이다. entityManager.find() 메소드를 호출하면 먼저 1차 캐시에서 Entity를 찾고, 만약 찾는 Entity가 1차 캐시에 없으면 데이터베이스에서 조회한 후 1차 캐시에 저장하고 영속 상태인 해당 객체를 반환한다.
    
    - 객체의 동일성을 보장한다.
    - 트랜잭션을 지원하는 쓰기 지연을 수행한다.
        - EntityManager는 트랜잭션을 commit하기 직전까지 데이터베이스에 Entity를 저장하지 않고 영속성 컨텍스트 내부의 SQL 저장소에 생성 쿼리를 저장해둔다. 이 후 commit을 하게 되면 저장해두었던 쿼리를 데이터베이스에 보냅니다. 이것을 트랜잭션을 지원하는 쓰기 지연이라고 한다.
    - 지연 로딩을 수행한다.
        - 지연 로딩(Lazy Loading)이란 실제 객체 대신 프록시 객체를 로딩해두고 해당 객체를 실제 사용할 때 영속성 컨텍스트를 통해 데이터를 불러오는 방법이다.

**Entity 생명주기**

Entity는 위의 그림과 같이 4가지의 상태가 존재한다.

- 비영속(new)
    - 영속성 컨텍스트와 전혀 관계가 없는 상태
    - 상태 : 객체 생성
- 영속(managed)
    - 영속성 컨텍스트에 저장된 상태
    - 상태 : 객체 생성 후 EntityManager를 통해 영속성 컨텍스트에 저장 entityManager.persist(chicken);
- 준영속(detached)
    - 영속성 컨텍스트에 저장되었다가 분리된 상태
    - 상태 : 영속성 컨텍스트가 영속 상태였던 Entity를 관리하지 않는다.
- 삭제(removed)
    - 삭제된 상태
    - 상태 : 영속성 컨텍스트와 데이터베이스에서 Entity 삭제 entityManager.remove(chicken)