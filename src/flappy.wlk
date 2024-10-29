import wollok.game.*
import flappyGame.*
import obstacles.*
import powerUps.*


object flappyLei {

    var position = game.at(3, 4) // Metodo position devuelve un objeto
    method position() = position
    method position(newPos) {
        position = newPos
    }

    method initialPosition() { position = game.at(3,10) }

    method image() = "mileiChico.png"

}

object score{
    var position = game.at(7, 8) 
    method position() = position
    method position(newPos) {
        position = newPos
    }


    var text = 0

    method image()="imagenVacia.png"

    method textNumero()=text

    method text()=text.toString()
    method textColor()="00FF00FF"

    method text(nuevoScore){
        text = nuevoScore
    }
}

object pisoInvisible {
   var position = game.at(1, 4) // Metodo position devuelve un objeto
    method position() = position
    method position(newPos) {
        position = newPos
    }

    method reaccionar(algo) {
			game.say(self, "OH OH!!")
    		game.removeTickEvent("movimiento")
    		game.schedule(2000,{game.stop()})
		}
}

