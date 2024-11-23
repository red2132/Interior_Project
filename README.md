# 인테리어 및 중고 거래 프로젝트

## 프로젝트 배경

 해당 프로젝트는 2021년 쌍용교육센터에서 진행한 팀프로젝트로, 오늘의 집과 중고거래 플랫폼을 합친 플랫폼을 기획했다.

나는 그 중 인테리어 공유 커뮤니티를 담당해서 제작했다.

## 개발 환경
사용 언어: java, javascript, HTML5  
DB: Oracle  
FrameWork: Spring  
화면 관련 기술: Jquery, vueJs  
DB 통신 관련 기술: Ajax, mybatis  

## 요구사항 분석

화면별로 요구사항을 분석했다.

### **메인화면**

- 인테리어 공유 커뮤니티
- 관련 뉴스
- 로그인&회원가입&마이 페이지

### 인테리어 공유 페이지(담당)

- 인테리어 공유 커뮤니티 및  댓글 기능 제작(CURD)
- 게시물을 필터와 태그를 이용해 검색하는 기능 구현

### 중고 인테리어 구매

- 중고거래 개시판
- 채팅

### 마이 페이지

- 내가 쓴 게시글&댓글
- 내 지역 설정
- 관심태그
- 회원정보 수정

## DB설계

분석한 요구사항을 바탕으로 DB를 설계했다

<img src="https://github.com/red2132/interior_project/assets/86100654/d2e584aa-fc94-4709-ad0f-4d88c0e8bd05">

## 담당 화면 구현

#### 1. 게시물 목록

<img src="https://github.com/red2132/interior_project/assets/86100654/0567db83-1b92-40e6-926b-3973dab6ef92">

- 동적 쿼리를 활용, 필터 검색으로 원하는 게시물 선택(복수 옵션 선택 가능)
- 쿠키 정보를 활용해 최근 본 게시물 출력
- sessionscope 안에 들어있는 로그인 정보를 이용, 로그인해야 글쓰기 버튼이 활성화됨

#### 2. 상세 페이지

<img src="https://github.com/red2132/interior_project/assets/86100654/9a02a241-4318-4ebc-b2d5-154e662ef4ed">

- 태그를 통해 연관된 게시물 검색
- sessionscope 안에 들어있는 로그인 정보를 이용, 로그인해야 수정&삭제 버튼 활성화 됨

#### 3. 비밀번호 확인

<img src="https://github.com/red2132/interior_project/assets/86100654/15d3758c-1168-446e-95e9-77f2ee390e67">

- jquery를 활용해 화면전환 없이 비밀번호 확인 창 출력

#### 4. 댓글

<img src="https://github.com/red2132/interior_project/assets/86100654/dfa3bfb2-fc53-4301-97d5-5027acf6e11e">

- 내 댓글만 수정&삭제 가능, 타인 댓글은 답글 달기만 가능
- 로그인 시엔만 댓글 작성 가능

#### 5. 글 작성

<img src="https://github.com/red2132/interior_project/assets/86100654/72605002-0e1e-4b22-b3c6-e6f7494cbc7e">

- sessionScope에 있는 아이디값을 받아와 미리 세팅(임의로 수정 불가)
- jquery를 이용해  파일 추가 및 삭제

#### 6. 글 수정

<img src="https://github.com/red2132/interior_project/assets/86100654/48296363-e812-4bc2-9a6c-ac031e705782">

- DB에 저장되어 있는 기존 게시물의 정보를 받아와서 폼에 세팅
- 비밀 번호 틀릴 시 Alert창 출력, 맞으면 수정 완료

  <img src="https://github.com/red2132/interior_project/assets/86100654/13708c04-dcf3-473e-bf96-78f6e2f444eb">

  ## 마무리
  쌍용 교육 센터에서의 교육을 통해, java언어에 대한 학습, spring과 jsp 사용방법을 이해하고, 그 지식을 활용하여 프로젝트를 제작했다. 추가적으로 동적 쿼리를 이용해, 필터 기능을 구현했다.
  다만 이 당시에는 react와 vue.js는 제대로 활용하지 못해 아쉬움이 남았던 프로젝트다.
