import flappy.*
import main.*
import wollok.game.*
object menu{
    const cancion = game.sound("sonidoMenu.mp3")
    method render(){
        cancion.play()
        cancion.shouldLoop(true)
        cancion.volume(0.1)
        game.width(170)
        game.height(100)
        game.cellSize(7)
        game.title('FlappyLei')
        game.boardGround("fondo.png")
        game.addVisual(flappyLeiTexto)
        game.addVisual(instruccionTexto)
    }
    method desRender(){
        cancion.stop()
        game.removeVisual(flappyLeiTexto)
        game.removeVisual(instruccionTexto)
    }
    
}

object instruccionTexto{
    method position()=game.at(50,10)
    method image() = "TextoMenu4.png"
}

object flappyLeiTexto{

    method position()=game.at(40,74)

    method image()="FlappyTexto1.png"
}