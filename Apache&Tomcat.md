# Apache&Tomcat

날짜: 2023년 7월 3일
발표자: 양희범
주제: 서버

# Apache란?

![Untitled](Apache&Tomcat%203680becd9c45412c810ed5aaa82f10d1/Untitled.png)

- Apache는 세계에서 장 많이 쓰는 웹 서버 중 하나입니다
- Apache는 오픈 소스이기 때문에 누구든지 수정, 재배포가 가능합니다.
- Apache는 다양한 기능을 제공하고 다른 웹 서버들에 구축이 쉽다는 이유로 많이 사용되고 있습니다.

### 웹 서버란?

- 클라이언트가 GET, POST 등의 메소드를 이용해 전송한 요청을 받아 HTML이나 오브젝트를 HTTP 프로토콜을 이용해 전송하는 프로그램입니다.

![출처 : [https://developer.mozilla.org/ko/docs/Learn/Common_questions/What_is_a_web_server](https://developer.mozilla.org/ko/docs/Learn/Common_questions/What_is_a_web_server)](Apache&Tomcat%203680becd9c45412c810ed5aaa82f10d1/Untitled%201.png)

출처 : [https://developer.mozilla.org/ko/docs/Learn/Common_questions/What_is_a_web_server](https://developer.mozilla.org/ko/docs/Learn/Common_questions/What_is_a_web_server)

### 웹 서버가 필요한 이유?

- 웹 프로그램은 클라이언트 – 서버 컴퓨터 사이의 데이터 교환을 목적으로 하기 때문에 네트워크 통신이 반드시 필요합니다.
- 그러나 웹 프로그램마다 네트워크 통신 기능을 매번 직접 구현하는 것은 힘든 일이기 때문에 네트워크 통신을 구현하기 위해 미리 만들어진 프로그램을 사용하는데 웹 서버와 웹 브라우저가 이에 해당됩니다.

---

# Tomcat이란?

- Tomcat이란 아파치 재단에서 만든 오픈 소스 WAS(Web Application Server)입니다.

![출처 : [https://doitnow-man.tistory.com/109](https://doitnow-man.tistory.com/109)](Apache&Tomcat%203680becd9c45412c810ed5aaa82f10d1/Untitled%202.png)

출처 : [https://doitnow-man.tistory.com/109](https://doitnow-man.tistory.com/109)

### WAS란?

- Web Application Server의 약자이다.
- WAS란 웹 서버와 웹 컨테이너의 결합으로 이루어진 소프트웨어입니다.
- 웹 서버를 포함하고 있기 때문에 웹 서버처럼 사용할 수도 있습니다.
- DB 와 연결되어 트랜잭션 처리를 하거나 다른 시스템과의 연동 기능 또한 포함하고 있습니다. 그리고 웹 서버와 달리 요청에 대해 동적인 페이지를 만들 어 유연하게 응답할 수 있습니다.

### **WAS가 필요한 이유**

- 웹 서버는 정적인 컨텐츠만 제공하기 때문에 클라이언트의 요구에 유연하게 대처할 수 없습니다.
- 다양한 클라이언트의 요구에 유연하게 대처하기 위해 DB와 연결해 데이터를 주고받거나 데이터 조작을 하여 동적인 페이지를 생성해 응답하기 위해 WAS를 사용하고 있습니다.

### **Tomcat의 디렉토리 구조**

- Bin: 톰캣 서버의 동작을 제어할 수 있는 스크립트 및 실행 파일
- Conf: 톰캣의 기본적인 설정 파일
- Lib: 아파치와 같은 다른 웹 서버와 톰캣을 연결해주는 바이너리 모듈들
- Webapps: 톰캣이 제공하는 웹 애플리케이션의 기본 위치
- Logs: 서버의 로그 파일이 저장
- Work: jsp 컨테이너와 다른 파일들이 생성하는 임시 디렉토리
- Temp: 임시 저장 폴더