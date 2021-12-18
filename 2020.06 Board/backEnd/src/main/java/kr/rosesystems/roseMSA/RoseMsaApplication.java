package kr.rosesystems.roseMSA;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
// 해당 클래스가 설정 클래스임을 나타내고, @bean으로 빈 정의,
// 이 클래스를 포함한 하위 패키지의 컴포넌트를 탐색 범위로 함
public class RoseMsaApplication {

	public static void main(String[] args) {
		SpringApplication.run(RoseMsaApplication.class, args);
	}

}
