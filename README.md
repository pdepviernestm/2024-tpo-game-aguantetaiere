# **FlappyLei**

## **Equipo de desarrollo**

- **Lucas Varela**
- **Nehuen Regueira**
- **Franco Benedetti**
- **Geronimo Becker**

---

## **Capturas de Pantalla**

### **Personaje Principal: Milei**
![image](https://github.com/user-attachments/assets/4b88701b-3db3-4b36-90f9-508ba1f803fe)

### **Obstáculo**
![Obstáculo](https://github.com/user-attachments/assets/d002dacb-ae8a-4cf1-bf68-0fe095c14813)

### **Fondo del Juego**
![Fondo](https://github.com/user-attachments/assets/eb500857-81db-46d8-90e6-50cf5d761e37)

---

## Características del Juego

### Obstáculos
- Los obstáculos aparecen de manera constante y cambian de altura de forma aleatoria.
- Se mueven hacia la izquierda y, al llegar al borde izquierdo de la pantalla, su posición se reinicia hacia la derecha con una nueva altura aleatoria.
- Los obstáculos están compuestos de varias partes (subobstáculos).
- **Colisión**: Si Flappylei colisiona, ya sea con algún obstáculo o con los límites del mapa, el juego finaliza.

### Power-Ups
Los **power-ups** afectan directamente a Flappylei, ya sea modificándole su puntaje como su comportamiento.
- **Ubicación Aleatoria**: Se generan en una posición aleatoria en el eje Y, y se mueven hacia la izquierda hasta salir de la pantalla.
- **Audio**: Cuando Flappylei colisiona contra ellos, se reproduce un audio.

1. **Lali Espósito**

   ![image](https://github.com/pdepviernestm/2024-tpo-game-aguantetaiere/blob/master/assets/LaliChica.png)
   - **Efecto**: Disminuye la puntuación en 3 puntos.
   - **Audio**: Fanático, de Lali Espósito.

2. **Banco Central**
   
   ![image](https://github.com/pdepviernestm/2024-tpo-game-aguantetaiere/blob/master/assets/bancoCentralContorno.png)
   - **Efecto**: Invierte los controles de Flappylei durante 6 segundos, haciendo que el jugador deba adaptarse rápidamente para evitar colisiones.
   - **Audio**: Milei antes de golpear una maqueta del Banco Central.

3. **Larreta**

   ![image](https://github.com/pdepviernestm/2024-tpo-game-aguantetaiere/blob/master/assets/Larreta3.png)
   - **Efecto**: Disminuye la puntuación en 5 puntos.
   - **Audio**: Milei insultando a Larreta.
  
4. **Dolar**

   ![image](https://github.com/pdepviernestm/2024-tpo-game-aguantetaiere/blob/master/assets/Dolar3.png)
   - **Efecto**: Aumenta la puntuación en 10 puntos.
   - **Audio**: Milei cantando Panic Show, de La Renga.

> Los power-ups son gestionados por el objeto `powerUp`, que selecciona aleatoriamente entre los power-ups disponibles y los coloca en la pantalla. Cuando un power-up se sale de la pantalla o es activado, se elimina del juego.

### Puntuación
- Cada vez que Flappylei pasa con éxito entre los obstáculos, la puntuación aumenta en 1.
- La puntuación se muestra en pantalla y puede disminuir si Flappylei activa ciertos power-ups.

---

## **Otros**

- **Curso: k2005/UTNfrba**
- **Versión de Wollok: 0.2.7**
- Queremos mantener el repo Privado

---

