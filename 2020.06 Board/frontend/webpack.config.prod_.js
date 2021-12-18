var path = require('path')
var webpack = require('webpack')
const { VueLoaderPlugin } = require('vue-loader')

module.exports = {
	mode: 'production',
	entry: './dist/result.js',
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
	plugins: [ // 효율적인 모듈화를 위해 추가 (압축, 핫리로딩 등)
		new VueLoaderPlugin(),
		// Vue 코드를 자바스크립트 모듈로 변환해줌
	],
}