# HttpServlet

## HttpServlet

- HTTP 프로토콜을 사용하는 웹 브라우저에서 서블릿 기능을 수행한다.
- 개발자는 HttpServlet을 상속받아 많은 기능을 사용할 수 있다.
- WAS가 웹브라우저로부터 Servlet 요청을 받으면
    - 요청 받을 때 전달 받은 정보를 HttpServletRequest 객체를 생성해서 저장한다.
    - 웹브라우저에 응답을 반환할 HttpServletResponse 객체를 생성한다. (응답을 담기 전 빈 객체)
    - 생성된 HttpServletRequest, HttpServletResponse 객체를 Servlet에 전달한다.

## **Servlet**

- WAS에서 동적 웹페이지 구현을 할 수 있도록 도와주는 자바 클래스의 일종 (프로그래밍 기술)
- 서블릿 관련 추상 메서드를 제공하는 인터페이스
- Servlet 덕분에 개발자는 의미있는 비즈니스 로직에 집중할 수 있다.
- EX) `init()`, `service()` 등

## **HttpServletRequest**

- HTTP 응답 정보(요청 처리 결과)를 제공하는 인터페이스
- Servlet은 HttpServletResponse객체에 content-type, 응답 코드, 응답 메세지 등을 담아서 전송한다.
- Servlet으로 들어온 요청은 텍스트(HTML)로 응답을 보내기 때문에 출력 스트림을 받기 위해 주로 response로부터 writer 객체를 얻어서 내보낸다.
- 메서드 예시
    - `setContentType()` : 요청에 대해 클라이언트에게 돌려줄 content-type 결정
    - `setCharacterEncoding()`