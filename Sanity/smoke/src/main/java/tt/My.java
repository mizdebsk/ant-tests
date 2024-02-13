package tt;

/** Very sophisticated functionality.
    @author Mikolaj Izdebski
*/
public class My {
    /** Some non-trivial code here.
        @param x first substrate
        @param y second substrate
        @return sum of the two
     */
    public int add(int x, int y) {
        return x + y;
    }

    /** Maint entry point.
        @arg args string arguments
    */
    public static void main(String[] args) {
        String s1 = args[0];
        String s2 = args[1];
        int i1 = Integer.parseInt(s1);
        int i2 = Integer.parseInt(s2);
        My adder = new My();
        int result = adder.add(i1, i2);
        System.out.println("RESULT is " + result);
    }
}
