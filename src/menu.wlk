import main.*
import wollok.game.*
object menu{
    
    method render(){
        game.width(17)
        game.height(10)
        game.cellSize(70)
        game.title('FlappyLei')
        game.boardGround("MENUgrande.png")
        game.addVisual(flappyLeiTexto)

        
    }
    method desRender(gameManager){
        game.removeVisual(flappyLeiTexto)
        game.boardGround("fondo.png")
        gameManager.manager()
    }
}

object flappyLeiTexto{

    method position()=game.at(3,7.5)

    method image()="flappyLeiTexto.png"
}