
import manager.*
import wollok.game.*
import flappy.*
import powerUps.*
import menu.*

class Morir {

    method reaccionar() {
        game.removeTickEvent("movimiento")
        game.removeTickEvent("obstacles movement")
        game.removeTickEvent("powerUp")
        game.removeTickEvent("aparicion obstacles")
        /*game.removeTickEvent("Lali render")
        game.removeTickEvent("movimiento lali")
        game.removeTickEvent("BancoCentral render")
        game.removeTickEvent("movimiento bancoCentral")*/
        game.removeTickEvent("Power up render")
        game.removeTickEvent("Power up movimiento")
        game.removeTickEvent("cambiar invertido")

        //game.removeTickEvent("movimiento2")

        obstaclesManager.getCollectionArriba().forEach({o=>game.removeVisual(o)})
        obstaclesManager.getCollectionAbajo().forEach({o=>game.removeVisual(o)})
        obstaclesManager.getCollectionArriba().forEach({o=>obstaclesManager.getCollectionArriba().remove(o)})
        obstaclesManager.getCollectionAbajo().forEach({o=>obstaclesManager.getCollectionAbajo().remove(o)})
        powerUp.vaciarLista()
        lali.lista().forEach({l=>game.removeVisual(l)})
        lali.lista().forEach({l=>lali.lista().remove(l)})
        bancoCentral.lista().forEach({b=>game.removeVisual(b)})
        bancoCentral.lista().forEach({b=>bancoCentral.lista().remove(b)})

        flappyLei.position(flappyLei.initialPosition())
        flappyLei.setInvertido(false)
        // gameManager.stopCancion(cancionLali.cancion())
        menu.render()
        score.text(0)

    }
}



class Obstacle {
    const subs = []
}

class SubObstacle inherits Morir{
    var property p
    var property image
    var scored = false 
    
    method position() = p
    method position(newPosition) { p = newPosition }
    
    method image() = image

    method moverIzquierda(){

        self.position(game.at(p.x()-1,p.y()))

       
        // Verificar si Milei pasó el obstáculo y aumentar el puntaje solo una vez
        if (!scored && flappyLei.position().x() > p.x()) {
            scored = true // Marcamos que este obstáculo ya fue pasado y puntuado
            score.text(score.textNumero() + 1) // Aumentar el puntaje en 1
        }
        // romper obstaculos cuando se vvan del mapa
        if (p.x()<=-4){
            obstaclesManager.getCollectionAbajo().remove(self)
            game.removeVisual(self)
        }

    }
    
}

object obstaclesManager {
    var coleccionArriba = []
    var coleccionAbajo = []

    // Método para crear un obstáculo dividido en 6 partes
    // method que arme columnas genericas
    method inicializarSubObstaculosArriba(posX, posYBase) {
        const partesArriba= []
        [1,2,3,4,5,6].forEach({x =>  partesArriba.add(new SubObstacle(p = game.at(posX, posYBase + x), image = "obstMedio2.png"))})
        partesArriba.add(new SubObstacle(p = game.at(posX, posYBase), image = "obsTechInv2.png"))
        return (partesArriba)
    }

    method inicializarSubObstaculosAbajo(posX, posYBase) {
        const partesAbajo = []
        [0,1,2,3,4,5].forEach({x =>  partesAbajo.add(new SubObstacle(p = game.at(posX, posYBase + x), image = "obstMedio2.png"))})
        partesAbajo.add(new SubObstacle(p = game.at(posX, posYBase + 6), image = "obsTech2.png"))
        return (partesAbajo)

    }

    method render() {
        const posX = 20
        const posYArribaBase = [5, 6, 7, 8, 9, 10].anyOne()
        const posYAbajoBase = posYArribaBase - 10

        // Crear las partes del obstáculo en la parte superior
        const partesArriba = self.inicializarSubObstaculosArriba(posX, posYArribaBase)
        partesArriba.forEach({ parte =>
            coleccionArriba.add(parte)
            game.addVisual(parte)
        })

        // Crear las partes del obstáculo en la parte inferior
        const partesAbajo = self.inicializarSubObstaculosAbajo(posX, posYAbajoBase)
        partesAbajo.forEach({ parte =>
            coleccionAbajo.add(parte)
            game.addVisual(parte)
        })
    }

    method getCollectionArriba() = coleccionArriba
    method getCollectionAbajo() = coleccionAbajo

    // Movimiento de las partes del obstáculo hacia la izquierda y eliminación
    method moverObstaculos() {
        coleccionArriba.forEach({ parte => parte.moverIzquierda() })
        coleccionAbajo.forEach({ parte => parte.moverIzquierda() })
    }
   
}
