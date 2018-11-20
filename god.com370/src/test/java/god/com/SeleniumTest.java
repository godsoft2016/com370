package god.com;

import org.junit.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class SeleniumTest {

	@Test
	public void test() {

		System.out.println("이백행");

		System.setProperty("webdriver.chrome.driver", "C:/Users/god/Downloads/chromedriver_win32/chromedriver.exe");

		// // WebDriver driver = new FirefoxDriver();
		WebDriver driver = new ChromeDriver();

		driver.get("http://www.google.com");

	}

}
