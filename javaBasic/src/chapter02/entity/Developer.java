package chapter02.entity;

public class Developer extends People {
	public String languageSkill;
	String company;
	String developPosition;
	
	public Developer(String name, String gender, String company) {
		// super() : 슈퍼 클래스의 생성자
		super(name, gender);
		this.company = company;
	}
	
	void eatBreakfast(int time) {
		System.out.println(super.name + "는 " + time + "시에 아침 밥을 먹습니다.");
	}
}