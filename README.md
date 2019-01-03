# "진짜 설레는 여행" Web Application 프로젝트
"Trip!For Real" Web Application Project
--


## 목적 (Purpose)

이 앱의 목적은 한 지역에 사는 로컬 주민이 자신의 지역 혹은 동네와 연관된 여행 정보를 올리는 것이다.

로컬만이 가질 수 있는 여행 정보를 바탕으로 비로컬 여행객들이 로컬의 진수를 느낄 수 있도록 만들어졌다.

이 앱을 통해 진정한 로컬 여행이 무엇인지 많은 이들이 느끼기를 바란다.

그럼 진정한 로컬 여행을 잠재적 여행자들에게 좀 더 각인시키기 위해 어떤 기능이 사용되었는지 알아보도록 하자.

(The purpose of this web application is to provide a potential tourist with genuine inoformation by the people who actually live in the area.

A potential tourist can access genuine information and it makes the tourist feel real based on the information by the locals.

As a prodiver of this service, I wish you to know what it is like to travel places where the only locals know about.

To provide potential tourists with genuine information, what kinds of functions do we use?

Please follow the development introduction below.)

## 개발 환경(Development Environment)

> Front-End

 * HTML 5
 * CSS/CSS3
 * JavaScript
 * Bootstrap 3.3.2
 * Jquery 3.3.1

> Back-End

 * Spring 4.2
 * JDK 1.8
 * Mysql 8.0
 * Mybatis 3.4
 * Tomcat 9
 * Maven 3.8

## 제작 기간 - 2018/11/12 ~ 2018/11/30

> 1st Week(11/12 ~ 11/16) 주제 설정/ DB 모델 구현/ View 페이지 구현 
  (Design/Implement - Main theme/ DB model/ View Page )
 * 11/12 개발환경 설정 및 프로젝트 주제 설정 (Design - configure / Main Theme design)
 * 11/13 HTML 및 Bootstrap을 이용하여 view 페이지 설계 및 생성 시작 (Implement view pages using HTML/Bootstrap)
 * 11/14 Mysql DB Model 설계 및 생성 (Create DB model)
 * 11/15 View Page(Main) 완성 (Create View Page)
 * 11/16 View Page(login, register) 및 MVC 디자인 패턴을 통한 로그인 및 회원가입 기능 구현 시작 (Implement view page(login, register) based on MVC design pattern)
 
> 2nd Week(11/19 ~ 11/23) 기능 구현/ DB 모델 구현/ View 페이지 구현 (Implement - Functions/ DB model/ View pages)
 * 11/19 Controller 로직 구현(로그인/회원가입) (Define/implement controller logic) 
 * 11/20 View(게시판/유저프로필) 구현 (Develop View(board/profile)) 
 * 11/21 Controller(게시판/유저프로필) 구현 (Develop controller(board/profile)) 
 * 11/22 Controller(검색 기능) 구현 (Develop controller(search)) 
 * 11/23 Controller(팔로우 기능) 구현 (Develop controller(follow)) 

> 3rd Week (11/26 ~ 11/30) 기능 구현/ DB 모델 구현/ View 페이지 구현 (Development - Functions / DB model/ View Page)
 * 11/26 관리자 게시판 CRUD 및 페이징 기능 사용 및 구현 (Develop Admin Board with CRUD pattern and Page index function)
 * 11/27 Controller(로그인/회원가입) 버그 수정 및 View(로그인/회원가입) 업데이트 (Refine Controller(login/register) / debug)
 * 11/28 Controller(팔로우/검색) 버그 수정 및 View(팔로우/검색) 업데이트 (Refine Controller(follow/search) / debug)
 * 11/29 구현 기능 보완 및 코드 정리 (Refine / debug / update)
 * 11/30 마무리 (Wrap up)
 
## 데이터 베이스 모델링
 
 ![table_model](https://user-images.githubusercontent.com/35492393/50624717-3f9f5c00-0f66-11e9-95c4-a4703dc8e17f.png)

## 패키지 구조

![package](https://user-images.githubusercontent.com/35492393/50626154-fb18be00-0f6f-11e9-90d2-f44e75bc41d8.png)

## Front-End 주요 기능
> 메인 페이지 검색(Java Resources/js/user/controller/MainPageController)
 * 키 입력에 따른 회원 검색(View Page와 연동)

![image](https://user-images.githubusercontent.com/35492393/50625661-da9b3480-0f6c-11e9-8278-1e6b3987264d.png)
 
> 로그인 접속 화면(로그인 틀릴시 Ajax로 구현)
![image](https://user-images.githubusercontent.com/35492393/50625725-38c81780-0f6d-11e9-9802-79bc0106affb.png)

> 로그인 완료시 팔로우 회원 출력
![image](https://user-images.githubusercontent.com/35492393/50626250-7e3a1400-0f70-11e9-816f-ff09c3bc9e2c.png)

> 로그인 시 검색화면에 팔로우 회원 표시
![image](https://user-images.githubusercontent.com/35492393/50626302-c5c0a000-0f70-11e9-847d-004c20bfaeaa.png)

>유저 프로필 화면

![image](https://user-images.githubusercontent.com/35492393/50626346-fc96b600-0f70-11e9-881f-2bf3d16235b5.png)

>팔로워 및 팔로우 숫자 표시
![image](https://user-images.githubusercontent.com/35492393/50626356-159f6700-0f71-11e9-8668-701502986d7b.png)

>프로필 편집 
![image](https://user-images.githubusercontent.com/35492393/50626384-3bc50700-0f71-11e9-9714-609738168e15.png)

> 지도 API 사용
>회원가입화면
![image](https://user-images.githubusercontent.com/35492393/50626432-7e86df00-0f71-11e9-8d5e-75e5ecb24344.png)

## 보완점
* 게시판 좋아요 기능 구현
* 페이스북/카카오 로그인 연동 추가
