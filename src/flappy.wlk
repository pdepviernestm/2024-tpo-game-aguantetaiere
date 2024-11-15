import manager.*
import wollok.game.*
import obstaculos.*
import powerUps.*
import menu.*

object flappyLei {

    var position = game.at(3, 4) // Metodo position devuelve un objeto
    method position() = position

    var property invertido = false

    method setInvertido(bool){
        invertido=bool

        if (!invertido){
            image=imagenInicial
        }
    }

    method saltar(){
        if (!invertido){
            self.position(self.position().up(1))
        }
        else{
            self.position(self.position().down(1))
        }
    }

    method bajar(){
        if (invertido){
            self.position(self.position().up(1))
        }
        else{
            self.position(self.position().down(1))
        }
    }

    method position(newPos) {
        position = newPos
    }

    method initialPosition() = game.at(3,4)

    var property imagenInicial = "mileiChico.png"

    var property image = imagenInicial

    
    method setImagen(nuevaImagen){
        image = nuevaImagen
    }
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
    method reset () {
        self.text(0)
    }

    method text(nuevoScore){
        text = nuevoScore
    
    }    
    
}


object digit0 {
    var  position = game.at(7, 8) 
    var  image = "0.png"
    method position() =position
    method image () = image

}

class LimitesMapa inherits Morir{
    var position
    method position() = position
    method position(newPos) {
        position = newPos
    }

}

const pisoInvisible = new LimitesMapa(position = game.at(3, -1))
const techoInvisible = new LimitesMapa(position = game.at(3, 9.5))