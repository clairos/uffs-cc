public class Empresa {
    //--- I ---- Definição de Variáveis ----//
    private String aNomEmp = "Bodega";
    private String aCodEmp = "758.589.117/0001-17";
    //--- F ---- Definição de Variáveis ----//

    //--- I ---- Construtores --------------//
    public Empresa(String nome, String cnpj) {
        this.aNomEmp = nome;
        this.aCodEmp = cnpj;
    }
    //--- F ---- Construtores --------------//
    
    //--- I ---- Getters & Setters ---------//
    public String getANomEmp() {
        return this.aNomEmp;
    }

    public void setANomEmp(String nome) {
        this.aNomEmp = nome;
    }

    public String getACodEmp() {
        return this.aCodEmp;
    }

    public void setACodEmp(String cnpj) {
        this.aCodEmp = cnpj;
    }
    //--- F ---- Getters & Setters ---------//
}