// generación, movimiento y comportamiento de los obstáculos.

import wollok.game.*
import flappy.*
import flappyGame.*
import powerUps.*


class Obstacle {
    var property p 

	method position() = p
	method position(newPosition) { p = newPosition }


	method moverIzquierda(){
		self.position(game.at(p.x()-1,p.y()))

		// if (flappyLei.position().x()==p.x() && 
		// (-5 >= flappyLei.position().y() && 0 <= flappyLei.position().y()) ||
		// 5 >= flappyLei.position().y() && 10 <= flappyLei.position().y()){
		// 	game.stop()
		// }
	}

	

}

class ObstacleArriba inherits Obstacle{
	method image() = "obstaculoInvertido.png"
}

class ObstacleAbajo inherits Obstacle{
	method image() = "obstaculito.png"
}


object obstacles{


	var coleccionArriba=[]
	var coleccionAbajo=[]

	


	method getCollectionArriba()=coleccionArriba
	method getCollectionAbajo()=coleccionAbajo

	


	method render() {
		//const posY = obstaclesPositions.anyOne()
		
		const positionYAbajo = game.at(20, -5.randomUpTo(10))



		const positionsArribaY=[5,6,7,8,9,10]

		var posArribaY = positionsArribaY.anyOne()

		var posAbajoY = posArribaY-10

		// Parte de abajo
		var obstAbajo = new ObstacleAbajo( p = game.at(20,posAbajoY))

		// Parte de abajo
		var obstArriba = new ObstacleArriba( p = game.at(20,posArribaY))
		//]
		
		coleccionAbajo.add(obstAbajo)
		coleccionArriba.add(obstArriba)

		game.addVisual(obstAbajo)
		game.addVisual(obstArriba)

	}

}