# #
# npm init -y
# ######
루프 폴더 하위에 package.json 생성됨 (해당 폴더를 NodePackageManager로 관리하겠다.)
-y : 프로젝트 정보를 default 값으로 설정하겠다.

# #
# npm i webpack webpack-cli webpack-dev-server -D
# ######
webpack: 배포 시 모듈화 시켜주는 것 -> network 탭에서 확인 시, 해당 서비스 올렸을 때 
			 로딩시간/파일 개수 등 효율적이게 됨 ("dev": "webpack-dev-server")
webpack-cli : webpack을 command-line 도구
webpack-dev-server : 빌드 명령어 실행 없이, 재빌드 및 브라우저 새로고침 시켜줌 
							("dev": "webpack-dev-server"), devServer 설정
-D : 개발 시에만 필요한 dependency는 개발할 때만 사용하겠다는 축약어 (--save-dev) 
		<-> 배포용 (--save-prod)
		package.json 내에 devDependencies : {} 내에 의존성이 추가됨

# #
# npm i vue
# npm i vue-loader vue-template-compiler css-loader vue-style-loader -D
# #####
vue: vue 프레임워크 사용을 위해 install
vue-loader: Vue 컴포넌트를 일반적인 자바스크립트 모듈로 변환할 수 있는 					webpack에서 사용하는 로더 
				<style>과 <template>에서 참조된 정적 Asset 파일(css 등)을 모듈로 취급
					vue-template-compiler와 함께 쓰인다.
					css-loader와 함께 쓰인다.
vue-style-loader: css-loader로 가져온 css를 스타일 태그로 html 내에 삽입해줌

# #
# npm i html-webpack-plugin -D
# ####
html-webpack-plugin: 모듈화 된 css, js 파일은 html에 수동으로 추가해야하는데, 자동으로 해줌

# #
# npm i babel-loader @babel/core @babel/preset-env -D
# #####
전체적인 트랜스파일
ES6 문법, 브라우저 호환
@babel/core: transpile 시, 이용되는 모듈
@babel/preset-env: 최신 JS 이용할 수 있게 해줌 ...mapGetter 같이 ... 사용하기 위해 추가
						   browserlist 선언으로 해당 브라우저에서 문법 등을 사용할 수 있게 해준다
babel-loader: babel과 webpack을 사용하여 JS file로 변환해줌

# #
# npm i vue-router
# ####
SPA에서 URL로 페이지 변환

# #
# npm i axios
# ####
백 단과 비동기 통신을 하는 api
프로미스 기반: 비동기통신 후 .then() 사용하는 객체

# #
# npm i vuex
# ####
중앙 집중식 저장소 역할
데이터 변환 시, 여러 페이지에서 변환할 시 추적이 어렵고 코드가 복잡해짐 (emit 등)
단방향으로 데이터를 변환시키고 중앙에서 데이터를 관리하기 때문에 가독성 높아짐

# #
# npm install --save @babel/polyfill
# ####
ie에서 blank가 뜨지 않게 해줌
presets: [ '@babel/preset-env', {}] 설정 필수



# #
# npm install vuex-persist --save
# ####
ie11 먹통됨 쓰지 말기 -> 다른 거 알아보기
localStorage에 store 값을 담아, 새로고침 시 localStorage에서 데이터를 꺼내옴


# #
# npm install dotenv
# ####
.env 라는 환경변수 파일을 인식하게 하고, 
해당 파일에 정의한 환경 변수들을 불러와 사용할 수 있다.
현재 axios.create 시, baseURL: `${VUE_APP_SERVER_URI}`, 사용중


# #
# npm install jquery
# ####
// main.js
window.$ = window.jQuery = require('jquery') // jquery 전역 설정


# #
# npm install vee-valdate
# ####


# #
# npm i vue-sidebar-menu
# ####
https://www.npmjs.com/package/vue-sidebar-menu
https://yaminncco.github.io/vue-sidebar-menu/#/
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous"> 추가해줘야함

# eslint
문법 검사 : 에러 시, 브라우저에 overlay:false -> vue.config.js
# prettier로 문법 정형화 시킬 수도 있음