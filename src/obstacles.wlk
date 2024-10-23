// generación, movimiento y comportamiento de los obstáculos.

import wollok.game.*
import flappy.*
import flappyGame.*
import powerUps.*

class Obstaculo {
	var property position
	var property cA // Area de colision 
    //method position() = position
    // method position(newPos) {
    // position = newPos
    // }

	method image() = "obstaculo.png" 

	
	
}



///////////////////////////////////////////////////////////////////////////////////


class Obstacle {
    var property p // Posicion
	//var property hitbox // Area de colision 

	
	//method image() = "obstaculo.png"
	method position() = p
	method position(newPosition) { p = newPosition }
	//method hitbox() = hitbox
}

class ObstacleArriba inherits Obstacle{
	method image() = "obstaculoInvertido.png"
}

class ObstacleAbajo inherits Obstacle{
	method image() = "obstaculito.png"
}

object obstacles {

    const initialCollection = [[]]
	var collection = initialCollection
	
	// Con esto indico la posicion de la parte de arriba y la parte de abajo de un obstaculo
	// dejando un hueco para que el pajaro pueda pasar.
	const obstaclesPositions = [ 
	//  TOP  BOTTOM en el eje Y 
		[16,  -25],
		[8,    84],
		[84,  -15],
		[13,  -28],
		[18,  -23]
	]


	var coleccionArriba=[]
	var coleccionAbajo=[]

	
	method resetCollection() = { collection = initialCollection }

	


	method render() {
		//const posY = obstaclesPositions.anyOne()
		
		const positionYAbajo = game.at(20, -5.randomUpTo(10))

		//const topPiece = posY.first()
		//const bottomPiece = posY.last()
		
		// const newObstacle = [
		// 	// Parte de arriba
		// 	new Obstacle( p = game.at(25, topPiece), cA = (topPiece..30) ),
			
		// 	// Parte de abajo
		// 	new Obstacle( p = game.at(25, bottomPiece), cA = (bottomPiece..bottomPiece+33) )
		// ]

		const positionsArribaY=[5,6,7,8,9,10]

		var posArribaY = positionsArribaY.anyOne()

		var posAbajoY = posArribaY-10

		//var randomPosAbajo = game.at(5, -5.randomUpTo(10))
		//var posArriba = randomPosAbajo.last()+10

		//const newObstacle = [
		// Parte de abajo
		var obstAbajo = new ObstacleAbajo( p = game.at(5,posAbajoY))
			
		// Parte de abajo
		var obstArriba = new ObstacleArriba( p = game.at(5,posArribaY))
		//]
		
		game.addVisual(obstAbajo)
		game.addVisual(obstArriba)
		
		//collection.add(newObstacle)
		//newObstacle.forEach({ piece => game.addVisual(piece) }) //
	}
	

	method behaviour(piece) {
		const posX = piece.position().x()
		const posY = piece.position().y()
		
		// Realiza el movimiento del obstaculo
		piece.position(game.at(posX - 1, posY))
		
		// Cuando el obstaculo desaparece de la pantalla se lo destruye
		if(posX == -3) {
			game.removeVisual(piece)
		}
		
		// Cuando se detecta la colision del pajaro en una de las partes del obstaculo 
		// o el pajaro sale de la pantalla, se termina el juego
        
		if(flappyLei.position().x() == posX && piece.cA().contains(flappyLei.position().y()) 
			|| (-1 == flappyLei.position().y()) || (flappyLei.position().y() > 25)) {
				game.clear()
				flappyGame.showMenu()
		}
        
	}
	
	// method restart() {
	// 	initialCollection.clear()
	// 	initialCollection.add(
	// 		[
	// 			new Obstacle(p = game.at(25, 16), hitbox = (16..25)), 
	// 			new Obstacle(p = game.at(25, -25), hitbox = (-25..8))
	// 		]
	// 	)
	// }
}