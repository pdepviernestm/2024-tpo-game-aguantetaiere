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
    var property pos
    method image()  = "LaliChica.png"
    method position() = pos
    method position(newPosition) {pos=newPosition}
    var reaccionado = 0
    method reaccionar(algo) {
        if (reaccionado == 0){
            score.text(score.textNumero()+1)
            reaccionado+=1
        }  
    }

    method moverIzquierda(){
        self.position(game.at(pos.x()-1,pos.y()))

        if (pos.x() <= -3){
            lali.listaLalis().remove(self)
            game.removeVisual(self)
        }
    }

}



 object lali {
    
    var property listaLalis = []

    

    method render () {
        var posY = [3,4,5,6,7,8,9].anyOne()
        var p = game.at(23,posY) 
        var lDeposito = new Lali(pos=p)
        game.addVisual(lDeposito)
        listaLalis.add(lDeposito)
    }
    


    /*method moverIzquierda() {
        self.p(game.at(p.x()-1,p.y()))
        
        lDeposito.pos(game.at(lDeposito.pos().x()-1,lDeposito.pos().y()))

        if (lDeposito.pos().x() <= 3){
            gameManager.eliminar(self)
        }
    }*/   

}


