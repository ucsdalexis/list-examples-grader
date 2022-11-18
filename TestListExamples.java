import static org.junit.Assert.*;
import org.junit.*;
import java.util.ArrayList;
import java.util.List;

public class TestListExamples {
    @Test
    public void testFiller1(){
        List<String> list = new ArrayList<>();
	list.add("cook");
	list.add("ate");
	list.add("cookie");
	
        List<String> solution = new ArrayList<>();
	solution.add("cook");
	solution.add("cookie");
	assertEquals(solution, ListExamples.filter(list, new StringCheckerClass()));
    }
    @Test
    public void testFiller2(){
        List<String> list = new ArrayList<>();
	list.add("cook");
	list.add("ate");
	
        List<String> solution = new ArrayList<>();
	solution.add("cook");
	assertEquals(solution, ListExamples.filter(list, new StringCheckerClass()));
    }
    @Test
    public void testMerge1(){
	List<String> list = new ArrayList<>();
	list.add("cook");
	list.add("ate");
	list.add("cookie");
	List<String> add = new ArrayList<>();
	list.add("ate");
	list.add("cookie");
	List<String> solution = new ArrayList<>();
	list.add("cook");
	list.add("ate");
	list.add("cookie");
	list.add("ate");
	list.add("cookie");
	assertEquals(solution, ListExamples.merge(list, add));
    }
}

class StringCheckerClass implements StringChecker {
  
  public StringCheckerClass() {

  }

  public boolean checkString(String s) {
    if (s.length() >= 4) {return true;}
    return false;
  }
}
