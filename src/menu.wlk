import flappy.*
import main.*
import wollok.game.*
object menu{
    const cancion = game.sound("sonidoMenu.mp3")
    method render(){
        cancion.play()
        cancion.shouldLoop(true)
<<<<<<< Updated upstream
        cancion.volume(0.1)
        game.width(17)
        game.height(10)
        game.cellSize(70)
        
=======
        cancion.volume(0.5)
        game.width(170)//17
        game.height(100) //10
        game.cellSize(7) //70
        game.title('FlappyLei')
        game.boardGround("fondo.png")
>>>>>>> Stashed changes
        game.addVisual(flappyLeiTexto)
        game.addVisual(instruccionTexto)
        game.removeVisual(flappyLei)
    }
    method desRender(){
        cancion.stop()
        game.removeVisual(flappyLeiTexto)
        game.removeVisual(instruccionTexto)
    }
    
}

object instruccionTexto{
    method position()=game.at(2,-2)
    method image() = "TextoMenu8.gif"
}

object flappyLeiTexto{

    method position()=game.at(4,7.4)

    method image()="FlappyTexto1.png"
}