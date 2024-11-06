// Implementará los objetos especiales (power-ups) que afectan a Milei con diferentes efectos.
import wollok.game.*
import flappy.*
import obstacles.*

class PowerUp {

// CAMBIO DE DIFICULTAD A LO 15 SEGUNDOS
    var property position

    method reaccionarPowerUp(algo) {
        game.removeTickEvent("movimiento")
        game.onTick(
		2000,
		"movimiento",
		{ flappyLei.position(flappyLei.position().up(1)) 
    })

    keyboard.up().onPressDo({ flappyLei.position(flappyLei.position().down(2)) })
    }

}
const powerUp = new PowerUp(position = game.at(5, 5))