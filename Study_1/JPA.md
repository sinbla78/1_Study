# JPA

## JPA(Java Persistence Api)

- Java 진영에서 ORM기술 표준으로 사용하는 인터페이스 모음이다. 즉, 실제로 동작하는 것이 아니다. 또한 자바 어플리케이션에서 관계형 데이터베이스를 사용하는 방식을 정의한 인터페이스이며, 인터페이스이기 때문에 Hibernate, OpenJPA 등이 JPA를 구현한다.
- JPA는 애플리케이션과 JDBC 사이에서 동작한다. 개발자가 JPA를 사용하면, JPA 내부에서 JDBC API를 사용하여 SQL을 호출하여 DB와 통신한다. 즉, 개발자가 직접 JDBC API를 쓰는 것이 아니다.JPA는 엔티티의 매핑 정보를 바탕으로 적절한 SELECT SQL을 생성하고 DB로부터 결과를 받아온다. 또한 결과(ResultSet)를 객체에 모두 매핑한다.
- ORM(Object-Relational Mapping)이란 우리가 일반 적으로 알고 있는 애플리케이션 Class와 RDB의 테이블을 매핑(연결)한다는 뜻이며, 기술적으로는 어플리케이션의 객체를 RDB 테이블에 자동으로 영속화 해주는 것이라고 보면된다.
- 왜 JPA를 사용할까? JPA는 반복적인 CRUD SQL을 처리해준다. JPA는 매핑된 관계를 이용해서 SQL을 생성하고 실행하는데, 개발자는 어떤 SQL이 실행될지 생각만하면 되고, 예측도 쉽게 할 수 있다. JPA를 사용하여 얻을 수 있는 가장 큰 것은 SQL이 아닌 객체 중심으로 개발할 수 있다는 것이다.
- compile('org.springframework.boot:spring-boot-stater-data-jpa') 이거 하나만 있어도 의존성이 주입된다.