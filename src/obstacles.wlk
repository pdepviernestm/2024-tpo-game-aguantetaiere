import wollok.game.*
import flappy.*
import flappyGame.*
import powerUps.*

class SubObstacle {
    var property p
    var property image
    
    method position() = p
    method position(newPosition) { p = newPosition }
    
    method image() = image

    method moverIzquierda(){
        self.position(game.at(p.x()-1,p.y()))

        if (flappyLei.position().x() == (p.x()+3)){
            score.text(score.textNumero()+0.1) // eso por las 10 img da 1
        }


        // if (p.x()<=-4){
        //     obstacles.getCollectionAbajo().remove(self)
        //     game.removeVisual(self)
        // }

    }

    method reaccionar(algo) {
        game.removeTickEvent("movimiento")
         game.schedule(1000, { game.stop() })
    }
}

object obstacles {
    var coleccionArriba = []
    var coleccionAbajo = []

    // Método para crear un obstáculo dividido en 6 partes
    method inicializarSubObstaculosArriba(posX, posYBase) {
        return [
            new SubObstacle(p = game.at(posX, posYBase), image = "obsTechInv.png"),
            new SubObstacle(p = game.at(posX, posYBase + 1), image = "obsMedio.png"),
           // new SubObstacle(p = game.at(posX, posYBase + 2), image = "obstMedio.png"),
            new SubObstacle(p = game.at(posX, posYBase + 3), image = "obsMedio.png"),
            //new SubObstacle(p = game.at(posX, posYBase + 4), image = "obstMedio.png"),
            new SubObstacle(p = game.at(posX, posYBase + 5), image = "obstMedio.png"),
			new SubObstacle(p = game.at(posX, posYBase + 6), image = "obsPisoInv.png")
        ]
    }

    method inicializarSubObstaculosAbajo(posX, posYBase) {
        return [
            new SubObstacle(p = game.at(posX, posYBase), image = "obsPiso.png"),
            new SubObstacle(p = game.at(posX, posYBase + 1), image = "obsMedio.png"),
            //new SubObstacle(p = game.at(posX, posYBase + 2), image = "obstMedio.png"),
            new SubObstacle(p = game.at(posX, posYBase + 3), image = "obsMedio.png"),
           // new SubObstacle(p = game.at(posX, posYBase + 4), image = "obstMedio.png"),
            new SubObstacle(p = game.at(posX, posYBase + 5), image = "obstMedio.png"),
			new SubObstacle(p = game.at(posX, posYBase + 6), image = "obsTech.png")
        ]
    }

    method render() {
        const posX = 17
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
