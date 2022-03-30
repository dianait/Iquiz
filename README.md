# IQuiz

CUESTIONARIO CONTRARRELOJ: Crea una "Quiz app" contrareloj con ranking by [Muredev](https://github.com/mouredev/) 

Aquí teneis toda la información de los retos 👇

[Monthly App Challenge 2022](https://github.com/mouredev/Monthly-App-Challenge-2022)

### 🌟 Cositas

- Las preguntas están en un archivo JSON 
- La persistencia del ranking con UserDefaults
- Las preguntas las he sacado de aquí [OpenTrivialDB](https://opentdb.com/api_config.php) 

## 📚 Checklist:

- ✅ En la pantalla inicial podrás comenzar a jugar o consultar el ranking de puntuaciones.  

- ✅ El juego consistirá en 10 preguntas aleatorias con 3 respuestas y sólo una correcta.

- ✅ Cada vez que se responde a una pregunta, se pasará a la siguiente.
  
- ✅ Disponemos de 30 segundos para responder cada pregunta. El contador deberá aparecer en la pantalla, 

- ❌ y si llega a 0 se tomará como respuesta incorrecta y se pasará a la siguiente pregunta.
   
- ❌ Al marcar una respuesta o finalizar el tiempo, se mostrará si se ha acertado o no la pregunta 

- ✅ dando feedback sobre cuál sería la respuesta correcta y navegando al cabo de un par de segundos a la siguiente pantalla.

- ✅ Contador a 0 o respuesta incorrecta = 0 puntos.
- ✅ Contador mayor 0 y respuesta correcta = [segundos restantes] puntos. 
- ✅ Una vez finalizada la pregunta número 10 se mostrará en una nueva pantalla la puntuación final y se deberá introducir un nombre para guardarla de forma persistente (aunque cerremos la app). Hecho estos se mostrará la pantalla de ranking.

- ✅ La pantalla de ranking muestra ordenados de mayor a menor los 10 mejores resultados y el nombre guardado. Desde esta pantalla siempre se podrá navegar a la pantalla inicial.

