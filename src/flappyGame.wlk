// configuración general del juego, manejará los eventos principales y controlará la aparición de obstáculos.

import wollok.game.*
import flappy.*
import obstacles.*
import powerUps.*

object flappyGame {
	
	var totalScore = 0
	const scoreInGame = new Score(
		position = game.at(0,23),
		image='flappyImages/flappy_score.png'
	)
	const scoreNumber = new Score(
		position = game.at(0, 23),
		image='flappyImages/score_' + totalScore.toString() + '.png'
	)

    method init() {
		game.width(25)
		game.height(25)
		game.cellSize(30)
		game.title('Flappy Bird')
	}

	
	method play() {
		game.clear()
		flappyLei.initialPosition()
		obstacles.resetCollection()
		self.init()
		
		// Background y Flappy
		game.addVisual(background)
		game.addVisual(flappyLei)
		
		// Obstacles
		obstacles.getCollection().forEach({
			obstacle => obstacle.forEach({ 
				piece => game.addVisual(piece)
			})
		})
		
		// Score
		game.addVisual(scoreInGame)
		game.addVisual(scoreNumber)

		// Events
		// keyboard.up().onPressDo({ flappyLei.position(flappyLei.position().up(1)) })
		
		// Puntaje
		game.onTick(1000, 'add score', {
			totalScore = totalScore + 1
			scoreNumber.changeScoreImage(totalScore)			
		})
		
		// Creacion de los obstaculos cada 3 segundos fuera de la pantalla
		game.onTick(3500, 'obstacle appear', {
			obstacles.render()
		})
			
		// Caida del pajaro
		// game.onTick(
		// 1000,
		// // Cada 2 segundos pepita va bajando una posicion en Y
		// "movimiento",
		// { flappyLei.position(flappyLei.position().down(1)) }//es una verga y no puedo poner menos de 1

        // )
		
		// Movimiento de los obstaculos
		game.onTick(250, 'obstacles movement', {
			obstacles.getCollection().forEach({ 
				obstacle => obstacle.forEach({ 
					piece => obstacles.behaviour(piece)
				})
			})
		})
		
	}
	
	method showMenu() {
		
		const scoreOnMenu = new Score(
			position = game.origin(), 
			image='flappyImages/score_'+ totalScore.toString() +'.png'
		)
		game.clear()	
		self.init()
		game.addVisual(menu)
		game.addVisual(scoreOnMenu)
		
		keyboard.c().onPressDo({ 
			game.clear()
			obstacles.restart()
			totalScore = 0
			self.play()
		})
		
		keyboard.r().onPressDo({ self.cerrarJuego() })
		
	}
	
	method totalScore() = totalScore
	
	method cerrarJuego() {
		game.clear()
        self.showMenu()
	}
	
}

object background{
	method image() = "fondo.png"
	method position() = game.origin() 
}

object menu {
	method image() = "menu.png"
	method position() = game.origin()
}

class Score {
	var property position
	var property image	

	method position() = position
	method position(newPosition) = { position = newPosition } 
	method changeScoreImage(newScore) {
		image = 'flappyImages/score_' + newScore + '.png'
	}
}
