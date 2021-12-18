var path = require('path')
var webpack = require('webpack')
const HtmlWebpackPlugin = require('html-webpack-plugin')
const { VueLoaderPlugin } = require('vue-loader')

module.exports = {
	mode: 'development',
	entry: './src/main.js',
	output: {
		path: path.resolve(__dirname, 'dist'),  /* 최종본이 생성될 path 생성 */
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
								// modules: false,
							}
						]
					} 
			},
			include: path.resolve(__dirname, 'src'),
			exclude: /node_modules/
			},
			{ test: /\.vue$/,use: 'vue-loader'},
	],
	},
	resolve: {
		extensions: ['*', '.js', '.vue'] // 웹팩이 알아서 경로나 확장자를 처리할 수 있게 도와주는 옵션
	},
	performance : {
		hints : false // WARNING in entrypoint size limit 사라지게
	},
	devServer: {
		contentBase: path.resolve(__dirname + "/dist"), // 서버가 로딩할 static 파일 경로 지정
		host: 'localhost', // 개발용 host
		port: 9000, // 개발용 포트번호
		overlay: false, /* 브라우저에서 컴파일러 에러나 warning 시, 화면 멈추는 기능 꺼줌 eslint에서도 이 기능 있음 */
		proxy: {
			'/api': { // /api URL 경로는 아래 proxy 서버를 이용한다.
			target: 'http://localhost:8081',
			// changeOrigin: true, // cross origin 허용 -> WebConfig
			// pathRewrite: {'^/api' : ''} // 대상 경로를 다시 작성하는 기능
			}
		},
		// disableHostCheck: true, // 개발 보안상, 로컬 이외에서 접속을 못하게 함
	},
	plugins: [ // 효율적인 모듈화를 위해 추가 (압축, 핫리로딩 등)
		new HtmlWebpackPlugin({
			template: './src/index.html', 
			// 해당 템플릿 기반으로 빌드 결과물을 추가해준다 (모듈화 된 css, js 파일)
		}),
		new VueLoaderPlugin(),
		// Vue 코드를 자바스크립트 모듈로 변환해줌
	],
	devtool: 'inline-source-map' // 소스 맵: 배포용으로 빌드한 파일과 원본 파일을 서로 연결시켜주는 기능
											// 원본 소스 기준으로 에러 표시됨
}