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
        game.removeTickEvent("Lali render")
        game.removeTickEvent("movimiento lali")

        obstacles.getCollectionArriba().forEach({o=>game.removeVisual(o)})
        obstacles.getCollectionAbajo().forEach({o=>game.removeVisual(o)})
        obstacles.getCollectionArriba().forEach({o=>obstacles.getCollectionArriba().remove(o)})
        obstacles.getCollectionAbajo().forEach({o=>obstacles.getCollectionAbajo().remove(o)})
        lali.listaLalis().forEach({l=>game.removeVisual(l)})
        lali.listaLalis().forEach({l=>lali.listaLalis().remove(l)})
        flappyLei.position(flappyLei.initialPosition())
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
            new SubObstacle(p = game.at(posX, posYBase + 330), image = "obstMedio2.png"),
            new SubObstacle(p = game.at(posX, posYBase + 10), image = "obstMedio2.png"),
            new SubObstacle(p = game.at(posX, posYBase + 20), image = "obstMedio2.png"),
            new SubObstacle(p = game.at(posX, posYBase + 30), image = "obstMedio2.png"),
            new SubObstacle(p = game.at(posX, posYBase + 40), image = "obstMedio2.png"),
            new SubObstacle(p = game.at(posX, posYBase + 50), image = "obstMedio2.png"),
			new SubObstacle(p = game.at(posX, posYBase + 60), image = "obstMedio2.png")
        ]
    }

    method inicializarSubObstaculosAbajo(posX, posYBase) {
        return [
            new SubObstacle(p = game.at(posX, posYBase), image = "obstMedio2.png"),
            new SubObstacle(p = game.at(posX, posYBase + 10), image = "obstMedio2.png"),
            new SubObstacle(p = game.at(posX, posYBase + 20), image = "obstMedio2.png"),
            new SubObstacle(p = game.at(posX, posYBase + 30), image = "obstMedio2.png"),
            new SubObstacle(p = game.at(posX, posYBase + 40), image = "obstMedio2.png"),
            new SubObstacle(p = game.at(posX, posYBase + 50), image = "obstMedio2.png"),
			new SubObstacle(p = game.at(posX, posYBase + 330), image = "obstMedio2.png"),
            new SubObstacle(p = game.at(posX, posYBase + 60), image = "obsTech2.png")
        ]
    }


    method render() {
        const posX = 200
        const posYArribaBase = [50, 60, 70, 80, 90, 100].anyOne()
        const posYAbajoBase = posYArribaBase - 100

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
