public class Fieldturn {
    public static void main(String args[]) {
        Turn turn = new Turn();
        Flags flags = new Flags();
        Thread a = new Neighborturn(flags, turn);
        a.setName("alice");
        Thread b = new Neighborturn(flags, turn);
        b.setName("bob");

        a.start();
        b.start();
    }
}