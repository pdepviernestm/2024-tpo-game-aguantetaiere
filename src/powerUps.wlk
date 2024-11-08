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

class Lali{
    
}



 object lali {
    const posY = [3,4,5,6,7,8,9].anyOne()
    var property p= game.at(23,posY)
    method image()  = "LaliChica.png"

     method position() = p
    method position(newPosition) {p=newPosition}

    var property laliActivada = 0
    method render () {
        new Lali()
        game.addVisual(lali)
    }
    
    method laliActivada(num){
        laliActivada=num
    } 

    method reaccionarLali(algo) {
        self.laliActivada(1)
        score.text(score.textNumero()-1)
        self.laliActivada(0)
    }
    method moverIzquierda() {
        self.p(game.at(p.x()-1,p.y()))
        if (p.x() <= 3){
            gameManager.eliminar(self)
        }
    }

   
}

