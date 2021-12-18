// webpack-dev-server 시, 사용하는 설정파일

var path = require('path')
const HtmlWebpackPlugin = require('html-webpack-plugin')
const VueLoaderPlugin = require('vue-loader/lib/plugin')
var webpack = require('webpack')
const dotenv = require('dotenv') // .env 파일 인식을 위해 설정
const env = dotenv.config().parsed // .env 파일 내에 설정한 변수 불러오기 위해 설정

module.exports = {
	mode: 'none',
	entry: './src/main.js',// './src/main.js', /* 최초로 진입되는 파일 */
	output: {
		path: path.resolve(__dirname, './dist'),  /* 최종본이 생성될 path 생성 */
		filename: 'result.js', /* 배포되는 파일 이름: entry 파일이 여러개일 때, 각각 맞게  */
		publicPath: '/', /* 브라우저에서 참조될때 출력 파일의 공용 URL 주소를 지정 */
	},
	module: {
	rules: [ // .확장자 파일에 해당 로더를 사용하겠다
			{ test: /\.css$/, use: ['vue-style-loader', 'css-loader'] },
			{ test: /\.js$/, 
				use: { 
						loader: 'babel-loader',
						options: {
							presets: [
								'@babel/preset-env', { 
									// modules: false, // false: 트리 쉐이킹 기능이 됨
									// 트리 쉐이킹: es2015 모듈 시스템 import되지 않은 export들을 정리해주는 기능
								}
							]
						} 
				},
				include: path.resolve(__dirname, 'src'),
				exclude: /node_modules/
			},
			{ test: /\.vue$/, use: 'vue-loader'},
	],
	},
	resolve: {
		extensions: ['*', '.js', '.vue'] // 웹팩이 알아서 경로나 확장자를 처리할 수 있게 도와주는 옵션
	},
	performance : {
		hints : false // WARNING in entrypoint size limit 사라지게 // 적정 용량에 대한 경고문을 없애줌
	},
	devServer: {
		contentBase: path.resolve(__dirname + "/dist"), // 서버가 로딩할 static 파일 경로 지정
		host: 'localhost', // 개발용 host
		port: 9000, // 개발용 포트번호
		overlay: false, /* 브라우저에서 컴파일러 에러나 warning 시, 화면 멈추는 기능 꺼줌 eslint에서도 이 기능 있음 */
		proxy: {
			'/api': { // /api URL 경로는 아래 proxy 서버를 이용한다.
				target: env.VUE_APP_SERVER_URI,
				// changeOrigin: true, // 컨트롤러에서 @crossOrigin 사용시 필요 없고, 
															// @crossOrigin(origins={}) 사용시 필요
															//  배포할 땐 CORS 에러남
				// pathRewrite: {'^/api' : ''} // 대상 경로를 다시 작성하는 기능
			}
		},
		// disableHostCheck: true, // 개발 보안상, 로컬 이외에서 접속을 못하게 함
		historyApiFallback: true, // 히스토리 API를 사용하는 SPA 개발시 설정한다. 404가 발생하면 index.html로 리다이렉트
										// 배포시 새로고침 할 때 문제 생길 경우, nginx설정 필수 try_files $uri $uri/ /index.html;
	},
	plugins: [ // 효율적인 모듈화를 위해 추가 (압축, 핫리로딩 등)
		new HtmlWebpackPlugin({
			template: './src/index.html', // 해당 템플릿 기반으로 빌드 결과물을 추가해준다 (모듈화 된 css, js 파일)
		}),
		new VueLoaderPlugin(),// Vue 코드를 자바스크립트 모듈로 변환해줌
		new webpack.DefinePlugin({ // .env 파일 내에 설정한 변수를 전역으로 쓰기 위해 선언
			VUE_APP_SERVER_URI: JSON.stringify(env.VUE_APP_SERVER_URI),
			USER_LOCALE: JSON.stringify(env.USER_LOCALE),
		}), 
	],
	devtool: 'inline-source-map' // 소스 맵: 배포용으로 빌드한 파일과 원본 파일을 서로 연결시켜주는 기능
										 // 원본 소스 기준으로 에러 표시됨
};