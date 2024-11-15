// src/powerUps.wlk
import manager.*
// Implementará los objetos especiales (power-ups) que afectan a Milei con diferentes efectos.
import wollok.game.*
import flappy.*
import obstaculos.*

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
            //personaje.lista().remove(self)
            game.removeVisual(self)
        }
    }
}

class Lali inherits PowerUps{
    
    override method image()  = "LaliChica.png"
    
    override method reaccionar() {
            game.sound(lali.cancion()).volume(0.1)
            game.sound(lali.cancion()).play()
            score.text(score.textNumero()-3)
            game.removeVisual(self)
            
            powerUp.lista().remove(self)
            //lali.lista().remove(self)
    }

}


class BancoCentral inherits PowerUps{

    override method image()  = "bancoCentralContorno.png"

    override method reaccionar() {
        game.sound(bancoCentral.cancion()).play()
        flappyLei.setInvertido(true)
         //game.removeTickEvent("movimiento")
         /*game.onTick(
 		2000,
 		"movimiento2",
 		{ flappyLei.position(flappyLei.position().up(1)) 
     })*/
    
     //keyboard.up().onPressDo({ flappyLei.position(flappyLei.position().down(2)) })

     game.removeVisual(self)
     powerUp.lista().remove(self)
     //bancoCentral.lista().remove(self)
     flappyLei.setImagen("mileiChicoInv.png")
     

    game.onTick(6000, 'cambiar invertido', {flappyLei.setInvertido(false)}) // Que a los 6 segs dejen de estar invertidos los controles

    }
}

class Larreta inherits PowerUps{

    override method image()  = "Larreta3.png"

    override method reaccionar() {
        game.sound(larreta.cancion()).play()
        //cancion.volume(0.1)
        score.text(score.textNumero()-5)
        game.removeVisual(self)
            
        powerUp.lista().remove(self)
        //larreta.lista().remove(self)

    }
}

class Dolar inherits PowerUps{
    override method image()  = "Dolar4.png"

    override method reaccionar() {
        game.sound(dolar.cancion()).play()
        //cancion.volume(0.1)
        score.text(score.textNumero()+10)
        game.removeVisual(self)
            
        powerUp.lista().remove(self)
        //dolar.lista().remove(self)

    }

}


object lali {
    
    var property cancion = "fanatico.mp3"
    var property lista = []

    method render () {
        var posY = [4,5,6,7,8].anyOne()
        var p = game.at(23,posY) 
        var lDeposito = new Lali(pos=p)
        game.addVisual(lDeposito)
        //lista.add(lDeposito)
        powerUp.lista().add(lDeposito)
    }

}


object dolar{
    var property lista = []
    var property cancion = "panicShow.mp3"
    method vaciarLista(){
        lista=[]
    }
    method render () {
        var posY = [4,5,6,7,8].anyOne()
        var p = game.at(23,posY) 
        var verde = new Dolar(pos=p)
        game.addVisual(verde)
        //lista.add(verde)
        powerUp.lista().add(verde)
    }
}

object bancoCentral {
  var property lista = []
  var property cancion = "mileiBancoCentral.mp3"
    method vaciarLista(){
        lista=[]
    }
    method render () {
        var posY = [4,5,6,7,8].anyOne()
        var p = game.at(23,posY) 
        var banco = new BancoCentral(pos=p)
        game.addVisual(banco)
        //lista.add(banco)
        powerUp.lista().add(banco)
    }
}

object larreta{
    var property lista = []
    var property cancion ="mileiLarreta.mp3"
    method vaciarLista(){
        lista=[]
    }
    method render () {
        var posY = [4,5,6,7,8].anyOne()
        var p = game.at(23,posY) 
        var pelado = new Larreta(pos=p)
        game.addVisual(pelado)
        lista.add(pelado)
        powerUp.lista().add(pelado)
    }
}


object powerUp{
    var property lista=[]
    var property personajeActual =lali
    var property listaPowerUps=[bancoCentral,lali,larreta,dolar]

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



