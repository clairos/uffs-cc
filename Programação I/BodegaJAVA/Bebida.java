public class Bebida implements java.io.Serializable{

    //--- I ---- Definição de Variáveis ----//
    private int nCodPro;
    private String aDesPro;
    private int nQtdMls;
    private float fPreBas;
    private int nQtdEst;
    private int nEntEst;
    private int nSaiEst;
    private boolean bAlcOol;
    //--- F ---- Definição de Variáveis ----//

    //--- I ---- Construtores --------------//
    public Bebida(int produto, String descricao, int mls, float preco, int estoque, boolean alcool) {
        this.nCodPro = produto;
        this.aDesPro = descricao;
        this.nQtdMls = mls;
        this.fPreBas = preco;
        this.nQtdEst = estoque;
        this.bAlcOol = alcool;
    }
    //--- F ---- Construtores --------------//

    //--- I ---- Getters & Setters ---------//
    public int getNCodPro() {
        return this.nCodPro;
    }

    public void setNCodPro(int produto) {
        this.nCodPro = produto;
    }

    public String getADesPro() {
        return this.aDesPro;
    }

    public void setADesPro(String descricao) {
        this.aDesPro = descricao;
    }

    public int getNQtdMls() {
        return this.nQtdMls;
    }

    public void setNQtdMls(int mls) {
        this.nQtdMls = mls;
    }

    public float getFPreBas() {
        return this.fPreBas;
    }

    public void setFPreBas(float preco) {
        this.fPreBas = preco;
    }

    public int getNQtdEst() {
        return this.nQtdEst;
    }

    public void setNQtdEst(int estoque) {
        this.nQtdEst = estoque;
    }

    public int getNEntEst() {
        return this.nEntEst;
    }

    public void setNEntEst(int entrada) {
        this.nEntEst = entrada;
    }

    public int getNSaiEst() {
        return this.nSaiEst;
    }

    public void setNSaiEst(int saida) {
        this.nSaiEst = saida;
    }

    public boolean isBAlcOol() {
        return this.bAlcOol;
    }

    public boolean getBAlcOol() {
        return this.bAlcOol;
    }

    public void setBAlcOol(boolean alcool) {
        this.bAlcOol = alcool;
    }
    //--- F ---- Getters & Setters ---------//

    //--- I ---- Definição de Métodos ------//
    public void compraBebida(int entrada){
        this.nEntEst = entrada;
        nQtdEst = nQtdEst + entrada;
    }

    public void vendeBebida(Clientes cliente, int saida){
        if (nQtdEst > 0 && nQtdEst >= saida){
            if (bAlcOol == true){
                if(cliente.isBCliMai() == true){
                this.nSaiEst = saida;
                nQtdEst = nQtdEst - saida;
                }

                else{
                    System.out.println("tente de novo daqui uns anos, kiddo.");
                }
            }
            else{
                nQtdEst = nQtdEst - saida;
            }
        }
        else{
            System.out.println("num tem estoque fi");
        }
    }
    //--- F ---- Definição de Métodos ------//
}
