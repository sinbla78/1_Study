# Log, Logging이란?

## Log, Logging이란?

- 로깅(logging)이란 시스템 동작시 시스템의 상태와 작동 정보를 시간의 경과에 따라 기록하는 것을 말한다. 그리고 그 기록을 로그라고 한다.
    
    로깅을 하는 이유는 소프트웨어의 동작 상태를 파악하고 문제가 발생했을 때, 그 동작을 파악해 소프트웨어의 문제를 찾아내고 해결하기 위해서 이다. 즉, 소프트웨어의 디버깅이나 모니터링을 위하여 정보를 기록하는 곳에 사용되는데, 기존의 Debugger나 println에 비해 로그가 가지는 장점은 아래와 같다.
    
- 상황별 Level 지정하여 Level별 메시지를 선택 가능
- 응용 프로그램의 실행에 대한 흐름과 에러 확인 가능
- 프레임워크를 이용하여 간단하고 쉬운 사용 환경 조성 가능
- 모듈 별로 유연하게 메세지 출력 가능
- 자유로운 출력 위치 및 다양한 출력 형식 지원

####로깅 관련 프레임워크 log4j, logback, log4j2 그리고 slf4j

로깅 관련 프레임워크는 대표적으로 log4j, logback, log4j2가 있다.

- log4j -> logback -> log4j2 순서로 등장했고, logback, log4j2는 둘 다 log4j를 기반으로 하고 있어 설정하는 방법이나 사용 방법이 유사하다.

### logback

log4j보다 향상된 성능과 필터링 옵션을 제공한다. slf4j도 지원하며, 자동 리로드 기능도 지원한다.

- 자동 리로드
logback은 서버를 재가동할 필요 없이 즉각 자동 리로드를 지원한다.
- spring boot 환경의 경우 spring-boot-starter-web > spring-boot-starter-logging에 기본적으로 logback 구현체가 포함되어 있다. 그렇기 때문에 spring boot 환경에서 로깅 프레임워크를 따로 설정하지 않으면 logback이 기본으로 적용된다.

### log4j2

logback과 마찬가지로 필터링 기능과 자동 리로드 기능 지원. 비동기 로거의 경우 log4j, logback보다 처리량이 더 높고, 대기시간이 훨씬 짧다.

- 비동기 로거는 로그 발생과 로그 쓰기를 분리시킨다.
- 추가적으로 람다 표현식과 사용자 정의 로그 레벨도 지원한다.
- **spring boot에서 log4j2를 사용하기 위해서는 dependency에서 logback을 제거해주는 작업이 필요하다.**
스프링 부트는 기본 설정으로 logback을 사용하기 때문에 log4j2 의존성을 추가하더라도 기본 설정으로 잡힌 logback이 동작하게 된다.

### slf4j (Simple Logging Facade For Java)

slf4j는 로깅에 대한 추상 레이어로 위에서 본 logback, log4j2 같은 로깅 프레임워크의 인터페이스 역할을 하며, slf4j를 이용하면 코드를 일정하게 유지하면서 구현체의 전환(다른 프레임워크로의 전환)을 쉽고 간단하게 할 수 있다.

- logback, log4j2는 slf4j의 구현체이다.

```
// 전체 레벨 지정
	logging.level.root=info

	// 패키지별로 로깅 레벨 지정
	logging.level.com.example.controller=info
	logging.level.com.example.service=debug

```

log에 대한 세부적인 설정을 하려면 logback.xml 파일을 통한 설정이 필요하고, 간단하게 콘솔 로그만 확인하기 위해서는 application.properties (또는 .yml) 파일에 로그 레벨을 설정하는 것만으로 로그를 확인할 수 있다.

- 세부적인 설정을 위해서는 .xml 파일이 필요하다.

로그 레벨은 TRACE < DEBUG < INFO < WARN < ERROR 총 5가지가 있으며, ERROR부터 높은 레벨을 가진다.

.xml 설정은 크게 Appender, Logger 두 가지 설정으로 나뉜다.

### Appender

이벤트마다 로그를 기록하는 기능을 처리하는 객체로 로그의 출력위치, 출력 형식 등을 설정한다.

- ConsoleAppender : 로그를 콘솔에 출력
- FileAppender : 로그를 지정 파일에 기록
- RollingFileAppender : FileAppender를 상속받아 날짜, 용량 등을 설정하여 패턴에 따라 로그가 각기 다른 파일에 기록
- SMTPAppender : 로그를 메일로 발송
- DBAppender : 로그를 Database에 기록

### 세부 설정 옵션

- Property : 설정 파일에서 사용될 변수 값
- layout, encoder : 시간과 내용을 제어하는 옵션으로 encoder가 layout에 비해 제어할 수 있는 범위가 넓다.
- pattern : 패턴에 사용되는 요소
- file : log를 기록할 파일명과 경로 설정
- rollingPolicy :
ch.qos.logback.core.rolling.TimeBasedRollingPolicy - 일자별 적용
    
    ch.qos.logback.core.rolling.SizeAndTimeBasedFNATP - 일자별 + 크기별 적용
    
- fileNamePattern : 파일 쓰기가 종료된 log 파일명의 패턴 지정 (.gz, zip 으로 설정 시 자동으로 압축됨)
- maxFileSize : 최대 파일 용량 (log 내용의 크기도 성능에 영향을 줄 수 이기 때문에 10MB 이내로 저장하는 것이 권장된다.)
- maxHistory : 일자별 로그 파일 최대 보관 주기
- root, logger : root의 경우 전역 설정, logger의 경우 특정 패키지 로깅 레벨 설정
(지역적 선언 우선 적용)

log 사용법

```
@RestController
public class TestController {

    private static Logger logger = LoggerFactory.getLogger(this.getClass());

    @GetMapping("/log")
    public logTest() {

        logger.trace("trace log");
        logger.debug("debug log");
        logger.info("info log");
        logger.warn("warn log");
        logger.error("error log");
    }
}

```