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
    
    method reaccionar(algo) {
        
            game.sound("fanatico.mp3").play()
            score.text(score.textNumero()-30)
            game.removeVisual(self)
            lali.listaLalis().remove(self)
    }

    method moverIzquierda(){
        self.position(game.at(pos.x()-10,pos.y()))

        if (pos.x() <= -30){
            lali.listaLalis().remove(self)
            game.removeVisual(self)
        }
    }

}



 object lali {
    
    var property listaLalis = []

    

    method render () {
        var posY = [30,40,50,60,70,80,90].anyOne()
        var p = game.at(230,posY) 
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


