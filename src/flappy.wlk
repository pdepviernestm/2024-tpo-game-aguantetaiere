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

    method image() = "Milei.png"

}

