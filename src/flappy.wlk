import manager.*
import wollok.game.*
import obstacles.*
import powerUps.*
import menu.*

object flappyLei {

    var position = game.at(3, 4) // Metodo position devuelve un objeto
    method position() = position
    method position(newPos) {
        position = newPos
    }

    method initialPosition() = game.at(3,4)

    method image() = "mileiChico.png"
    
}

object score{
    var position = game.at(7, 8) 
    method position() = position
    method position(newPos) {
        position = newPos
    }


    var text = 0

    method textNumero()=text

    method text()=text.toString()
    method textColor()="00FF00FF"

    method text(nuevoScore){
        text = nuevoScore
    }
}

class LimitesMapa {
    var position
    method position() = position
    method position(newPos) {
        position = newPos
    }

    method reaccionar(algo) {
    	game.removeTickEvent("movimiento")
        game.removeTickEvent("obstacles movement")
        game.removeTickEvent("powerUp")
        game.removeTickEvent("aparicion obstaculos")
        
        
        
        obstacles.getCollectionArriba().forEach({o=>game.removeVisual(o)})
        obstacles.getCollectionAbajo().forEach({o=>game.removeVisual(o)})
        obstacles.getCollectionArriba().forEach({o=>obstacles.getCollectionArriba().remove(o)})
        obstacles.getCollectionAbajo().forEach({o=>obstacles.getCollectionAbajo().remove(o)})
        menu.render()
        score.text(0)
        flappyLei.position(flappyLei.initialPosition())
        

	}
}

const pisoInvisible = new LimitesMapa(position = game.at(3, -1))
const techoInvisible = new LimitesMapa(position = game.at(3, 9.5))