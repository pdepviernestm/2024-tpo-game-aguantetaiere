import menu.*
import flappy.*
import obstaculos.*
import powerUps.*

object gameManager{

  method empezar(){
    game.addVisual(flappyLei)
    // Caída de flappylei
    game.onTick(1000,"movimiento",{flappyLei.bajar()})

<<<<<<< Updated upstream
    game.onTick(500,'obstaculos movement',{obstaculosManager.moverIzquierda()})
=======
    // movimiento de flappy
    game.onTick(
		100,
		"movimiento",
		{ flappyLei.position(flappyLei.position().down(1)) 
    })
>>>>>>> Stashed changes

    game.onTick(8000,'Power up render',{powerUp.render()})
    game.onTick(500,'Power up movimiento',{powerUp.moverIzquierda()})
    
<<<<<<< Updated upstream
=======
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

    game.onTick(10000, 'Lali render', {lali.render()})
    game.onTick(500, 'movimiento lali', {lali.listaLalis().forEach({l=>l.moverIzquierda()})})

>>>>>>> Stashed changes
    // manejo de colisiones
    game.onCollideDo(flappyLei, {cosa => cosa.reaccionar()})

    // Visuales adicionales
    game.addVisual(pisoInvisible)
    game.addVisual(techoInvisible)
    game.addVisual(score)
    game.addVisual(flappyLei)
    game.addVisual(digit0)


  }
  method terminarJuego (){
         game.removeTickEvent("movimiento")
        game.removeTickEvent("obstaculos movement")
        game.removeTickEvent("powerUp")
        game.removeTickEvent("aparicion obstaculos")
        game.removeTickEvent("Power up render")
        game.removeTickEvent("Power up movimiento")
        game.removeTickEvent("cambiar invertido")
        game.removeTickEvent("Frenar cancion")

        obstaculosManager.resetPosition()
        powerUp.lista().forEach({p=>game.removeVisual(p)})
        
        
        if (powerUp.cancionSonando()){
            powerUp.cancionActual().stop()
            powerUp.terminaCancion() // Para setear el bool de cancion sonando en false
        }
        powerUp.vaciarLista()

        flappyLei.position(flappyLei.initialPosition())
        flappyLei.setInvertido(false)
        
        menu.render()
        score.text(0)
  }
}