package tt;

import static org.junit.Assert.assertEquals;
import org.junit.Test;

public class MyTest {
    @Test
    public void testMy() {
        My my = new My();
        int sum = my.add(3, 5);
        assertEquals(8, sum);
    }
}
