import flappy.*
import obstacles.*
import powerUps.*

object gameManager{
  var property personajeActual=lali
  method empezar(){
    
    // movimiento de flappy
    game.onTick(
		1000,
		"movimiento",
		{ flappyLei.bajar() 
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

    /*game.onTick(20000, 'Lali render', {lali.render()})
    game.onTick(1000, 'BancoCentral render', {bancoCentral.render()})
    game.onTick(500,'movimiento bancoCentral',{bancoCentral.lista().forEach({b => b.moverIzquierda(b)})})
    game.onTick(500, 'movimiento lali', {lali.lista().forEach({l => l.moverIzquierda(l)})})*/

    game.onTick(8000,'Power up render',{powerUp.render()})
    game.onTick(500,'Power up movimiento',{powerUp.moverIzquierda()})

    // manejo de colisiones
    game.onCollideDo(flappyLei, {cosa => cosa.reaccionar(flappyLei)})

    // Visuales adicionales
    game.addVisual(pisoInvisible)
    game.addVisual(techoInvisible)
    game.addVisual(score)
    game.addVisual(flappyLei)


  }

  method eliminar(objeto){
    game.removeVisual(objeto)
  }

  method crear(objeto){
    game.addVisual(objeto)
  }
}