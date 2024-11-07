import flappy.*
import obstacles.*
import powerUps.*

object gameManager{
  method empezar(){
    
    
    

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

    //game.onTick(15000,'powerUp',{ powerUp.reaccionarPowerUp(flappyLei)})
    //game.onTick(30000, name, action)

    // manejo de colisiones
    game.onCollideDo(flappyLei, {cosa => cosa.reaccionar(flappyLei)})


    // Visuales adicionales
    game.addVisual(pisoInvisible)
    game.addVisual(techoInvisible)
    game.addVisual(score)
    //game.addVisual(powerUp)
    game.addVisual(flappyLei)


// Musica
// HACER MUSICA NORMAL DE FONDO HASTA QUE PASEN 15 SEGUNDOS
    const rain = game.sound("flappybird.mp3")
    rain.shouldLoop(true)
    game.schedule(500, { rain.play()} )
  }
}