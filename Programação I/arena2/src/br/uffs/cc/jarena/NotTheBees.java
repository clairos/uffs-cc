/**
 * Um exemplo de agente que anda aleatoriamente na arena. Esse agente pode ser usado como base
 * para a criação de um agente mais esperto. Para mais explicações, veja o AgenteDummy.java.
 * 
 * Fernando Bevilacqua <fernando.bevilacqua@uffs.edu.br>
 */

package br.uffs.cc.jarena;

import java.util.Timer;
import java.util.concurrent.ForkJoinPool.ManagedBlocker;

import javax.xml.namespace.QName;

public class NotTheBees extends Agente
{
	public NotTheBees(Integer x, Integer y, Integer energia) {
		super(x, y, energia);
	}
	//---------------------------------coisas uteis-------------------------------
	//movimento-------------
	int turno=0;
	int dir1;
	int dir2;
	int diratual;
	int x;//X de onde esta o lider
	int y;//Y de onde esta o lider
	String a;//X
	String b;//Y

	//clonagem
	int turno100=0;

	//procurador de cogumelo
	int procurar;//contagem
	int ultdir; //ultima direcao, se nao for util em outras coisas mover para achar cogumelo
	boolean procurando=false;//manter a procura
	int tentativas; //timer

	//coisas de energia-----
	boolean recebenerg=false;//saber se ta recebendo energia (funcao original void)
	int energiaatual=1000;//setando uma var pra nao bugar de inicio

	//luta------------------
	boolean lutando=false;//saber se ta lutando (funcao original void)

	//personagens-----------
	boolean toino=false;//verifica se ja chegou na loc depois de ser chamado
	int coordenando;

	//----------------------------------------------------------------------------
	public void pensa() {
		turno++;
		if (turno>=100){
			turno=turno/10;
			turno100++;
		}
		if ((turno%(getId()*5/2))==0 && toino==false && procurando==false){
			setDirecao(geraDirecaoAleatoria());
			dir2=dir1;
			dir1=diratual;
			diratual=getDirecao();
		}
		if (podeMoverPara(getDirecao())==false || getDirecao()==dir2 || getDirecao()==dir1){
			setDirecao(geraDirecaoAleatoria());
		}
		if (energiaatual<=getEnergia() && lutando==false){
			recebenerg=false;
		}
		energiaatual=getEnergia();

		if (procurando==true){
			procdecog(recebenerg);
		}
		if (toino==true){
			Ino(x,y,toino,turno);
		}
		if (coordenando>=1){
			coordenando++;
		}
		if (coordenando==4){
			coordenando=0;
		}
	}
	
	public void recebeuEnergia() {
		recebenerg=true;
		if (coordenando==0){
			coordenando++;
			String mensagem=(getX()+"-"+getY()+"-sao minhas coordenadas gurizada");
			enviaMensagem(mensagem);
		}
		ultdir=getDirecao();
		System.out.println("Buzz!!! :D");
		if (!procurando){
			procdecog(recebenerg);
			procurando=true;
		}
		if (getEnergia()>=800){
			divide();
		}
	}
	
	public void tomouDano(int energiaRestanteInimigo) {
		if (getEnergia()>=energiaRestanteInimigo){
			System.out.println("Buzz. >:)");
			para();
			String mensagem=(getX()+"-"+getY()+"-sao minhas coordenadas gurizada");
			enviaMensagem(mensagem);
		}
	}
	
	public void ganhouCombate() {
		System.out.println("According to all known laws of aviation,"
		+"there is no way a bee"
		+"should be able to fly."
		+" "
		+" "
		+"Its wings are too small to get"
		+"its fat little body off the ground."
		+" "
		+" "
		+"The bee, of course, flies anyway"
		+" "
		+" "
		+"because bees don't care"
		+"what humans think is impossible.");
	}
	
	public void recebeuMensagem(String msg) {
		String xey []= msg.split("-");
		System.out.println("Buzzing");
		a=xey[0];
		b=xey[1];
		x=Integer.parseInt(a);
		y=Integer.parseInt(b);
		Ino(x, y, toino, turno);
	}	
	
	public String getEquipe() {
		return "NotTheBees";
	}
	public void procdecog(boolean recebenerg){
		if (recebenerg==false){
			if (tentativas>=10){
				procurando=false;
				System.out.println("Buzz... :(");
				return;
			}
			if (tentativas<5) {
				System.out.println("Buzz?");
				tentativas++;
				setDirecao(ultdir);
			}
			if (tentativas>5 && tentativas<7){
				System.out.println("BUZZ?!?!?!?!?!?");
				setDirecao(geraDirecaoAleatoria());
				tentativas++;
			}
			else{
				tentativas++;
			}
		}
		else{
			ultdir=getDirecao();
			System.out.println("Buzz!");
			setDirecao(geraDirecaoAleatoria());
			tentativas=0;
		}
	}

	public void Ino(int x, int y,boolean toino,int turno){
		toino=true;
		if (getX()<x){
			setDirecao(1);
			if (podeMoverPara(1)==false){
				if (getY()<y){
					setDirecao(4);
				}
				if (getY()>y){
					setDirecao(3);
				}
			}
		}
		if (getX()>x){
			setDirecao(2);
			if (podeMoverPara(2)==false){
				if (getY()<y){
					setDirecao(4);
				}
				if (getY()>y){
					setDirecao(3);
				}
			}
		}
		if (getX()==x){
			if (getY()<y){
				setDirecao(4);
			}
			if (getY()>y){
				setDirecao(3);
			}
		}
		if (getX()==x && getY()==y){
			toino=false;
		}
	}
}
