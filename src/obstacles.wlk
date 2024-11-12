import manager.*
import wollok.game.*
import flappy.*
import powerUps.*
import menu.*

class Moricion {

    method reaccionar(algo) {
        game.removeTickEvent("movimiento")
        game.removeTickEvent("obstacles movement")
        game.removeTickEvent("powerUp")
        game.removeTickEvent("aparicion obstaculos")
        /*game.removeTickEvent("Lali render")
        game.removeTickEvent("movimiento lali")
        game.removeTickEvent("BancoCentral render")
        game.removeTickEvent("movimiento bancoCentral")*/
        game.removeTickEvent("Power up render")
        game.removeTickEvent("Power up movimiento")

        //game.removeTickEvent("movimiento2")

        obstacles.getCollectionArriba().forEach({o=>game.removeVisual(o)})
        obstacles.getCollectionAbajo().forEach({o=>game.removeVisual(o)})
        obstacles.getCollectionArriba().forEach({o=>obstacles.getCollectionArriba().remove(o)})
        obstacles.getCollectionAbajo().forEach({o=>obstacles.getCollectionAbajo().remove(o)})
        lali.lista().forEach({l=>game.removeVisual(l)})
        lali.lista().forEach({l=>lali.lista().remove(l)})
        powerUp.lista().forEach({p=>p.lista().remove(p)})
        bancoCentral.lista().forEach({b=>game.removeVisual(b)})
        bancoCentral.lista().forEach({b=>bancoCentral.lista().remove(b)})

        flappyLei.position(flappyLei.initialPosition())
        // gameManager.stopCancion(cancionLali.cancion())
        menu.render()
        score.text(0)

    }
}

class SubObstacle inherits Moricion{
    var property p
    var property image
    
    method position() = p
    method position(newPosition) { p = newPosition }
    
    method image() = image

    method moverIzquierda(){

        self.position(game.at(p.x()-1,p.y()))

        // conteo de puntuacion
        if (flappyLei.position().x() == (p.x() + 1)){
            score.text(score.textNumero()+0.0625) // eso por las 10 img da 1, 0.1
        }

        // romper obstaculos cuando se vvan del mapa
        if (p.x()<=-4){
            obstacles.getCollectionAbajo().remove(self)
            game.removeVisual(self)
        }

    }
    
}

object obstacles {
    var coleccionArriba = []
    var coleccionAbajo = []

    // Método para crear un obstáculo dividido en 6 partes
    // method que arme columnas genericas
    method inicializarSubObstaculosArriba(posX, posYBase) {
        return [
            new SubObstacle(p = game.at(posX, posYBase), image = "obsTechInv2.png"),
            new SubObstacle(p = game.at(posX, posYBase + 33), image = "obstMedio2.png"),
            new SubObstacle(p = game.at(posX, posYBase + 1), image = "obstMedio2.png"),
            new SubObstacle(p = game.at(posX, posYBase + 2), image = "obstMedio2.png"),
            new SubObstacle(p = game.at(posX, posYBase + 3), image = "obstMedio2.png"),
            new SubObstacle(p = game.at(posX, posYBase + 4), image = "obstMedio2.png"),
            new SubObstacle(p = game.at(posX, posYBase + 5), image = "obstMedio2.png"),
			new SubObstacle(p = game.at(posX, posYBase + 6), image = "obstMedio2.png")
        ]
    }

    method inicializarSubObstaculosAbajo(posX, posYBase) {
        return [
            new SubObstacle(p = game.at(posX, posYBase), image = "obstMedio2.png"),
            new SubObstacle(p = game.at(posX, posYBase + 1), image = "obstMedio2.png"),
            new SubObstacle(p = game.at(posX, posYBase + 2), image = "obstMedio2.png"),
            new SubObstacle(p = game.at(posX, posYBase + 3), image = "obstMedio2.png"),
            new SubObstacle(p = game.at(posX, posYBase + 4), image = "obstMedio2.png"),
            new SubObstacle(p = game.at(posX, posYBase + 5), image = "obstMedio2.png"),
			new SubObstacle(p = game.at(posX, posYBase + 33), image = "obstMedio2.png"),
            new SubObstacle(p = game.at(posX, posYBase + 6), image = "obsTech2.png")
        ]
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
