// src/powerUps.wlk
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
    
    method reaccionar()

    method moverIzquierda(personaje){
        self.position(game.at(pos.x()-1,pos.y()))

        if (pos.x() <= -3){
            powerUp.lista().remove(powerUp.lista().first())
            personaje.lista().remove(self)
            game.removeVisual(self)
        }
    }
}

class Lali inherits PowerUps{
    
    override method image()  = "LaliChica.png"
    
    override method reaccionar() {
            const cancion = game.sound("fanatico.mp3")
            cancion.volume(0.1)
            cancion.play()
            score.text(score.textNumero()-3)
            game.removeVisual(self)
            
            //powerUp.lista().remove(self)
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
        powerUp.lista().add(lDeposito)
    }

}

class BancoCentral inherits PowerUps{

    override method image()  = "img70x70.png"

    override method reaccionar() {
        flappyLei.setInvertido(true)
         //game.removeTickEvent("movimiento")
         /*game.onTick(
 		2000,
 		"movimiento2",
 		{ flappyLei.position(flappyLei.position().up(1)) 
     })*/

     //keyboard.up().onPressDo({ flappyLei.position(flappyLei.position().down(2)) })

     game.removeVisual(self)
     //powerUp.lista().remove(self)
     bancoCentral.lista().remove(self)

    game.onTick(6000, 'cambiar invertido', {flappyLei.setInvertido(false)}) // Que a los 6 segs dejen de estar invertidos los controles

    }
}

object bancoCentral {
  var property lista = []
    method vaciarLista(){
        lista=[]
    }
    method render () {
        var posY = [3,4,5,6,7,8,9].anyOne()
        var p = game.at(23,posY) 
        var banco = new BancoCentral(pos=p)
        game.addVisual(banco)
        lista.add(banco)
        powerUp.lista().add(banco)
    }
}

object powerUp{
    var property lista=[]
    var property personajeActual =lali
    var listaPowerUps=[bancoCentral,lali]

    method vaciarLista(){
        lista=[]
    }

    method render(){
        personajeActual=listaPowerUps.anyOne()
        personajeActual.render()
    }
    
    method moverIzquierda(){
        lista.forEach({p=>p.moverIzquierda(p)})
    }
}

 


