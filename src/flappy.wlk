import wollok.game.*
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

    method textNumero()=text

    method text()=text.toString()
    method textColor()="00FF00FF"

    method text(nuevoScore){
        text = nuevoScore
    }
}


// Se repite codigo
object pisoInvisible {
   var position = game.at(3, -1) // Metodo position devuelve un objeto
    //method image()= "image"
    method position() = position
    method position(newPos) {
        position = newPos
    }

    method reaccionar(algo) {
    		game.removeTickEvent("movimiento")
    		game.stop()
		}
}
object techoInvisible {
  var position = game.at(3, 9.5)
    //method image()= "img70x70.png"
    method position() = position
    method position(newPos) {
        position = newPos
    }

    method reaccionar(algo) {
    		game.removeTickEvent("movimiento")
    		game.stop()
		}
}

// class PisoInvisible inherits LimitesMapa {
//     override method position() = game.at(3, -1)
// }

// class TechoInvisible inherits LimitesMapa {
//     override method position() = game.at(3, 9.5)
// }

// class LimitesMapa {
//     var position
//     method position() = position
//     method position(newPos) {
//         position = newPos
//     }

//     method reaccionar(algo) {
//     		game.removeTickEvent("movimiento")
//     		game.stop()
// 		}
// }