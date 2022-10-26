package port;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

// 현재시간을 가져오기 위한 Model
public class Date_Time{

	public String datetime = null;

	public String now_datetime() { // 시/분/초까지 필요할 때

		LocalDateTime lt = LocalDateTime.now();
		DateTimeFormatter fm = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		this.datetime = lt.format(fm);
		
		return this.datetime;
	}

	public String now_date() { // 원/일까지만 필요할 때

		LocalDate lt = LocalDate.now();
		DateTimeFormatter fm = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		this.datetime = lt.format(fm);

		return this.datetime;
	}

}
