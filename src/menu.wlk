import flappy.*
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
    
}

object instruccionTexto{
    method position()=game.at(5,1)
    method image() = "TextoMenu4.png"
}

object flappyLeiTexto{

    method position()=game.at(4,7.4)

    method image()="FlappyTexto1.png"
}