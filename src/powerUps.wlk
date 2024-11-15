import manager.*
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

        if (pos.x() <= -3){ // Cuando el power up se va de la pantalla
            powerUp.lista().remove(powerUp.lista().first()) // Sabemos que el primero de la lista es el que debe salir
            game.removeVisual(self)
        }
    }
}

class Lali inherits PowerUps{
    
    override method image()  = "LaliChica.png"
    
    override method reaccionar() {
            game.sound(lali.cancion()).volume(0.1)
            game.sound(lali.cancion()).play()
            score.text(score.textNumero()-3) // Quitamos 3 puntos
            game.removeVisual(self) 
            powerUp.lista().remove(self)
    }

}


class BancoCentral inherits PowerUps{

    override method image()  = "bancoCentralContorno.png"

    override method reaccionar() {
        game.sound(bancoCentral.cancion()).play()
        flappyLei.setInvertido(true)
        game.removeVisual(self)
        powerUp.lista().remove(self)
        flappyLei.setImagen("mileiChicoInv.png")
        game.onTick(6000, 'cambiar invertido', {flappyLei.setInvertido(false)}) // Que a los 6 segs dejen de estar invertidos los controles
    }
}

class Larreta inherits PowerUps{

    override method image()  = "Larreta3.png"

    override method reaccionar() {
        game.sound(larreta.cancion()).play()
        score.text(score.textNumero()-5)
        game.removeVisual(self)
            
        powerUp.lista().remove(self)
    }
}

class Dolar inherits PowerUps{
    override method image()  = "Dolar4.png"

    override method reaccionar() {
        game.sound(dolar.cancion()).play()
        score.text(score.textNumero()+10)
        game.removeVisual(self)
            
        powerUp.lista().remove(self)
    }

}


object lali {
    
    var property cancion = "fanatico.mp3"

    method render () {
        var posY = [4,5,6,7,8].anyOne()
        var p = game.at(23,posY) 
        var lDeposito = new Lali(pos=p)
        game.addVisual(lDeposito)
        powerUp.lista().add(lDeposito)
    }

}


object dolar{

    var property cancion = "panicShow.mp3"

    method render () {
        var posY = [4,5,6,7,8].anyOne()
        var p = game.at(23,posY) 
        var verde = new Dolar(pos=p)
        game.addVisual(verde)
        powerUp.lista().add(verde)
    }
}

object bancoCentral {

  var property cancion = "mileiBancoCentral.mp3"

    method render () {
        var posY = [4,5,6,7,8].anyOne()
        var p = game.at(23,posY) 
        var banco = new BancoCentral(pos=p)
        game.addVisual(banco)
        powerUp.lista().add(banco)
    }
}

object larreta{

    var property cancion ="mileiLarreta.mp3"

    method render () {
        var posY = [4,5,6,7,8].anyOne()
        var p = game.at(23,posY) 
        var pelado = new Larreta(pos=p)
        game.addVisual(pelado)
        powerUp.lista().add(pelado)
    }
}


object powerUp{
    var property lista=[]
    var property personajeActual =lali // Para inicializar la variable
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



