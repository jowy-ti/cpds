public class Neighborturn extends Thread {
    private Flags flags;
    private Turn turn;

    public Neighborturn(Flags flags, Turn turn) {
        this.flags = flags;
        this.turn = turn;
    }

    public void run() {
        while (true) {
            try {
                String name = this.getName();
                System.out.println("try again, my name is: "+ name);
                flags.set_true(name);
                turn.setTurn(name);
                Thread.sleep((int)(200*Math.random()));

                while (flags.query_flag(name) && turn.checkTurn(name)) {}

                System.out.println(name + " enter");
                Thread.sleep(400);
                System.out.println(name + " exits");

                Thread.sleep((int)(200*Math.random()));
                flags.set_false(name);;
            } catch (InterruptedException e) {};
        }
    }
}