// lógica de Milei, incluyendo cambios de dirección, inversión de controles, velocidad, y manejo de vidas.
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

<<<<<<< HEAD
    method image() = "Milei.png"
=======
    method image() = "milei.png"
>>>>>>> 37dd6b141222a27fc83a31a0759b86c5ae42049c
}

