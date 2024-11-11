import manager.*
// Implementará los objetos especiales (power-ups) que afectan a Milei con diferentes efectos.
import wollok.game.*
import flappy.*
import obstacles.*

// object powerUp {

// // CAMBIO DE DIFICULTAD A LO 15 SEGUNDOS

//     method reaccionarPowerUp(algo) {
//         game.removeTickEvent("movimiento")
//         game.onTick(
// 		2000,
// 		"movimiento2",
// 		{ flappyLei.position(flappyLei.position().up(1)) 
//     })
    

//     keyboard.up().onPressDo({ flappyLei.position(flappyLei.position().down(2)) })
//     }

//     method eliminarse(){
        
 //   }

//}

class PowerUps{
    var property pos
    method image()
    method position() = pos
    method position(newPosition) {pos=newPosition}
    
    method reaccionar(algo)

    method moverIzquierda(personaje){
        self.position(game.at(pos.x()-1,pos.y()))

        if (pos.x() <= -3){
            personaje.lista().remove(self)
            game.removeVisual(self)
        }
    }
}

class Lali inherits PowerUps{
    
    override method image()  = "LaliChica.png"
    
    override method reaccionar(algo) {
            const cancion = game.sound("fanatico.mp3")
            cancion.volume(0.1)
            cancion.play()
            score.text(score.textNumero()-3)
            game.removeVisual(self)
            lali.lista().remove(self)
    }

}

object lali {
    
    var property lista = []

    method render () {
        var posY = [3,4,5,6,7,8,9].anyOne()
        var p = game.at(23,posY) 
        var lDeposito = new Lali(pos=p)
        game.addVisual(lDeposito)
        lista.add(lDeposito)
    }

}

class BancoCentral inherits PowerUps{

    override method image()  = "img70x70.png"

    override method reaccionar(algo) {
         game.removeTickEvent("movimiento")
         game.onTick(
 		2000,
 		"movimiento2",
 		{ flappyLei.position(flappyLei.position().up(1)) 
     })

     keyboard.up().onPressDo({ flappyLei.position(flappyLei.position().down(2)) })

     bancoCentral.lista().remove(self)
    }
}

object bancoCentral {
  var property lista = []

    method render () {
        var posY = [3,4,5,6,7,8,9].anyOne()
        var p = game.at(23,posY) 
        var banco = new BancoCentral(pos=p)
        game.addVisual(banco)
        lista.add(banco)
    }
}

/*object powerUp{
    var listaPowerUps=[bancoCentral,lali]
    method render(){
        var personajeActual=listaPowerUps.randomize().first()
        gameManager.personajeActual(personajeActual)
        personajeActual.render()
    }
}*/

 


