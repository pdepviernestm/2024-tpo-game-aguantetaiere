import flappy.*
import obstacles.*
import powerUps.*

object gameManager{
  method empezar(){
    game.start()
    game.boardGround("fondo.png")

    // controles
    keyboard.q().onPressDo({game.stop()})
    keyboard.up().onPressDo({ flappyLei.position(flappyLei.position().up(1)) })

    // movimiento de flappy
    game.onTick(
		2000,
		"movimiento",
		{ flappyLei.position(flappyLei.position().down(1)) 
    })

    // Aparicion de los obstaculos
    obstacles.render()
    
    game.onTick(4500,"aparicion obstaculos",{
        obstacles.render()
    })


    // Movimiento de los obstaculos
		game.onTick(500, 'obstacles movement', ({
			obstacles.getCollectionArriba().forEach({ 
				obstacle => obstacle.moverIzquierda()
				})
			}))

		game.onTick(500, 'obstacles movement', {
			obstacles.getCollectionAbajo().forEach({ 
				obstacle => obstacle.moverIzquierda()
				})
			})

    game.onTick(15000,'powerUp',{ powerUp.reaccionarPowerUp(flappyLei)})

    // manejo de colisiones
    game.onCollideDo(flappyLei, {cosa => cosa.reaccionar(flappyLei)})


    // Visuales adicionales
    game.addVisual(pisoInvisible)
    game.addVisual(techoInvisible)
    game.addVisual(score)
    game.addVisual(powerUp)
    game.addVisual(flappyLei)


// Musica
// HACER MUSICA NORMAL DE FONDO HASTA QUE PASEN 15 SEGUNDOS
    const rain = game.sound("light-rain.mp3")
    rain.shouldLoop(true)
    game.schedule(500, { rain.play()} )
  }
}