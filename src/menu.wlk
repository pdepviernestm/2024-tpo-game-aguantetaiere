import main.*
import wollok.game.*
object menu{
    
    method render(){
        game.width(17)
        game.height(10)
        game.cellSize(70)
        game.title('FlappyLei')
        game.boardGround("fondo.png")
        game.addVisual(flappyLeiTexto)
        game.addVisual(instruccionTexto)
    }
    method desRender(){
        game.removeVisual(flappyLeiTexto)
        game.removeVisual(instruccionTexto)
    }
    
    var aparicion=1
    method aparecerDesaparecerTexto(){
        if (aparicion==1){
            game.addVisual(instruccionTexto)
            aparicion=0
        }
        else{
            game.removeVisual(instruccionTexto)
            aparicion=1
        }
    }

    method activarDesactivarTexto(){
        game.onTick(2000,"aparicion_desaparicion",{self.aparecerDesaparecerTexto()})
    }
}

object instruccionTexto{
    method position()=game.at(7,7)
    method text()="Toque el espacio para empezar!"
    method textColor()="00FF00FF"
}

object flappyLeiTexto{

    method position()=game.at(3,7.5)

    method image()="flappyLeiTexto.png"
}