# 🧺 피크닉 용품 예약 및 대여 서비스

텐트 또는 돗자리를 선택하고, 피크닉 테이블·체어·무드등 등의 감성 소품을 추가하여 원하는 날짜에 예약하고 대여할 수 있는 서비스입니다.

## 사용 기술

- Java
- Spring Boot
- Spring Data JPA
- MySQL
- MongoDB
- Gradle

## 주요 기능

- 피크닉 용품 등록 및 조회
- 이용 날짜별 예약 가능 수량 조회
- 기본 용품 및 추가 소품 예약
- 예약 취소
- 예약한 용품 대여 및 반납 처리
- MongoDB를 활용한 예약·대여 활동 로그 저장 및 조회

## 이용 안내

- 기본 용품은 텐트 또는 돗자리 중 한 종류를 1개 선택합니다.
- 추가 소품은 선택 사항이며 용품별 수량을 지정할 수 있습니다.
- 하루 단위로 대여하며, 이용 당일 수령하고 반납합니다.
- 로그인과 프론트엔드 없이 REST API로 이용합니다.

### 추가 소품

- 피크닉 테이블
- 캠핑 랜턴 / 감성 무드등
- 캠핑 체어 / 릴렉스 체어
- 피크닉 웨건
- 라탄 바구니
- 레이어드용 체크 패턴 피크닉 매트
- 와인잔 세트
- 블루투스 스피커
- 담요

## 실행 방법

## 실행 방법

### 1. 실행 환경

- Java 17
- MySQL 8.0
- MongoDB

### 2. 데이터베이스 설정

MySQL에 데이터베이스를 생성합니다.

```sql
CREATE DATABASE picnic;
```

`src/main/resources/application.yml`에 접속 정보를 설정합니다.

```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/picnic
    username: ${DB_USERNAME}
    password: ${DB_PASSWORD}

  jpa:
    hibernate:
      ddl-auto: update

  data:
    mongodb:
      uri: mongodb://localhost:27017/picnic
```

실행 환경에 `DB_USERNAME`, `DB_PASSWORD` 환경 변수를 등록합니다.

### 3. 애플리케이션 실행

MySQL과 MongoDB를 실행한 뒤, 프로젝트 루트에서 실행합니다.

```bash
# macOS / Linux
./gradlew bootRun

# Windows
.\gradlew.bat bootRun
```

실행 후 `http://localhost:8080`을 기준으로 Postman에서 API를 호출할 수 있습니다.
