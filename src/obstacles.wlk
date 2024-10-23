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
	var property cA // Area de colision 

	
	method image() = "obstaculo.png"
	method position() = p
	method position(newPosition) { p = newPosition }
	method cA() = cA
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
	
	method getCollection() = collection
	method resetCollection() = { collection = initialCollection }
		
	method render() {
		const posY = obstaclesPositions.anyOne()
		const topPiece = posY.first()
		const bottomPiece = posY.last()
		
		const newObstacle = [
			// Parte de arriba
			new Obstaculo( position = game.at(5, 5), cA = (topPiece..30) ),
			
			// Parte de abajo
			new Obstaculo( position = game.at(10, 10), cA = (bottomPiece..bottomPiece+33) )
		]
		
		collection.add(newObstacle)
		newObstacle.forEach({ piece => game.addVisual(piece) }) //
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
	
	method restart() {
		initialCollection.clear()
		initialCollection.add(
			[
				new Obstacle(p = game.at(25, 16), cA = (16..25)), 
				new Obstacle(p = game.at(25, -25), cA = (-25..8))
			]
		)
	}
}