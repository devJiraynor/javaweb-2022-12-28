package chapter03;

// 제어자
// - 클래스, 변수, 메서드의 선언부에 함께 사용되는 부가적인 조건
// 1. 접근 제어자
//    - public, protected, default(package), private 
// 2. 일반 제어자
//    - static, final, abstract, synchronized...
public class Example02 {
	
	// public 접근 제어자
	// 프로젝트 어디서든 접근이 가능하도록 함
	public int number1;
	
	// protected 접근 제어자
	// 같은 패키지 내에 있거나 해당 클래스를 상속받은 sub 클래스에서만 접근이 가능
	protected int number2;
	
	// default(package) 접근 제어자
	// 같은 패키지 내에서만 접근이 가능
	int number3;
	
	// private 접근 제어자
	// 같은 클래스 내에서만 접근이 가능
	private int number4;

	public static void main(String[] args) {
		
		// Modifier 클래스의 경우 public으로 선언되었기 때문에
		// 모든 위치에서 사용 가능
		Modifier modifier = new Modifier("John doe", "Busan");
		
		modifier.setName("James");
		modifier.getName();
		
		// The field Modifier.name is not visible
		// Modifier 클래스의 멤버 변수들을 private으로 선언했기 때문에
		// 클래스 외부에서 접근이 불가능
//		modifier.name;
		
	}

}




