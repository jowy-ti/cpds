public class Turn {
    private int turn;

    public synchronized boolean checkTurn(String s) {
        if (s.equals("alice")) {
            if (turn == 2) return true;
            else return false;
        }
        else {
            if (turn == 1) return true;
            else return false;
        }
    }

    public synchronized void setTurn(String s) {
        if (s.equals("alice")) turn = 2;
        else turn = 1; 
    }
}