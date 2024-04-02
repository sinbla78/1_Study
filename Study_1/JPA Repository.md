# JPA Repository

## **Repository**

Entity에 의해 생성된 데이터베이스에 접근하는 메소드들을 사용하기 위한 인터페이스이다. 위에서 엔티티를 선언함으로써 데이터베이스 구조를 만들었다면, 여기에 어떤 값을 넣거나, 넣어진 값을 조회하는 등의 CRUD(Create, Read, Update, Delete)를 해야 쓸모가 있는데, 이것을 어떻게 할 것인지 정의해주는 계층이라고 생각하면 된다.

**JpaRepository**를 상속받도록 함으로써 기본적인 동작이 모두 가능해진다. JpaRepository는 어떤 엔티티를 메서드의 상으로 할지를 다음 키워드로 지정한다. **JpaRepository<대상으로 지정할 엔티티, 해당 엔티티의 PK의 타입>.**

```
pubilc interface BoardRepository extends JpaRepository<Board, Long>{
}
```

이렇게 extends를 통해서 상속받고나면, 해당 레포지토리의 객체를 이용해서 기본적으로 제공되는 메서드(save(), findAll(), get()) 등을 사용할 수 있게 된다.

**Entity**

데이터베이스(Database, DB) 에 쓰일 필드와 여러 엔티티간 연관관계를 정의한다.

## **@Entity**

클래스 위에 선언하여 이 클래스가 엔티티임을 알려준다. 이렇게 되면 JPA에서 정의된 필드들을 바탕으로 데이터베이스에 테이블을 만들어준다.

- **findAll()**테이블에서 레코드 전체 목록을 조회한다.
- **findById(id)**테이블에서 기본키 필드 값이 id인 레코드를 조회한다.
- **findOne()**Primary key로 값을 1건 조회할 때 사용한다.
- **save()**객체를 테이블에 저장, 레코드들을 저장할 때 사용한다. insert() 와 update() 기능을 한다.
- **saveAll(list)**객체 목록을 테이블에 저장한다.
- **delete()**객체의 id(기본키) 속성값과 일치하는 레코드를 삭제한다.
- **deleteById(id)**테이블에서 기본키 필드 값이 id인 레코드를 삭제한다.
- **deleteAll(list)**객체 목록을 테이블에서 삭제한다.

**count**()테이블의 전체 레코드 수를 리턴한다.

- **exists(id)**테이블에서 id에 해당하는 레코드가 있는지 true/false를 리턴한다.