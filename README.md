# QUINTA PRÁCTICA DEL BOOTCAMP MOBILE EN *KEEPCODING*
## Fundamentos iOS

<details>
  <summary>Contenidos</summary>
  <ol>
    <li><a href="#tecnologías-utilizadas">Stack - Tecnologías utilizadas</a></li>
    <li><a href="#qué-he-aprendido">Qué he aprendido</a></li>
    <li><a href="#objetivo">Objetivo práctica</li>
    <li><a href="#mockups">Mockups</li>
    <li><a href="#agradecimientos">Agradecimientos</a></li>
  </ol>
</details>

---
### Tecnologías utilizadas
![Static Badge](https://img.shields.io/badge/swift%20-%20white?style=for-the-badge&logo=swift&logoColor=white&color=f05038)
![Static Badge](https://img.shields.io/badge/UIKIT-%232396F3?style=for-the-badge&logo=framework&logoColor=white)
![Static Badge](https://img.shields.io/badge/XCODE-%23147EFB?style=for-the-badge&logo=xcode&logoColor=white)

---
### Qué he aprendido

Ideas clave:

- Crear aplicaciones nativas en iOS usando XCode, el framework UIKit y el patrón MVC.

- Crear proyectos con Storyboards
  - Cambiar el punto de entrada
  - Agregar elementos como Tab Bars, Navigation Bars, Stack Views, Scroll Views...
  - Usar Autolayout para que las vistas se ajusten adecuadamente al tamaño del dispositivo
  - Crear IBOutlets y IBAcctions para personalizar y navegar por las vistas

- Crear proyectos con XiBs y UIKit
  - Crear vistas y elementos de forma programática
  - Hacer la navegación entre vistas de forma programática pasando los datos necesarios a la siguiente vista
  - Crear Table Views y Collection Views
  - Añadir alertas para dar mensajes al usuario
  - Inyectar imágenes descargadas de la web dentro de Image Views, uso de Web Views
  - Uso de UserData para almacenar datos, uso de Singletones
 
- Uso de XCTest para pruebas unitaras.
  - Mockear protocolos de llamada a red.

- Uso del Debug Navigator y el stepping para depurar errores.
 
- Usar una API de la academia para hacer llamadas asíncronas, obtener sus datos y filtrarlos para pintarlos en la aplicación.

- Ordenar funcionalidades y ficheros en base al patrón MVC.

---
### Objetivo

En esta práctica debo realizar una aplicación nativa usando:
1. la API de Dragon Ball proporcionada por la academia
2. XiBs (no Storyboards)
3. Seguir la arquitectura MVC
4. La aplicación debe tener las siguientes vistas:
   - Login
   - Lista héroes
   - Detalle héroe (botón transformaciones oculto si no las hay)
   - Lista transformaciones
   - Detalle transformación
5. Testing para la capa de modelo

#### Contiene

- Vista de Login
  - Login haciendo llamada de red a la API con usuario y contraseña registrado
  - Campos con placeholders y el campo contraseña con entrada de texto seguro
- Vista de lista de héroes
  - Table View con imagen, nombre y parte de descripción
  - UI acorde con la estética aplicación, transparencia de las celdas al ser seleccionadas cambiada
- Vista de detalle héroe
  - Botón de transformaciones oculto si no las hay
  - Scroll View en descripciones para cuando son largas
- Vista de lista transformaciones
  - Lista ordenada y filtrada de transformaciones
- Vista de detalle transformación
  - Scroll View en descripciones para cuando son largas

---
### Mockups

![Mockup1](https://github.com/Marcnava/Practica-UX-UI/blob/main/Images/Captura%20de%20pantalla%202023-07-21%20a%20las%201.41.22.png?raw=true)

![Mockup2](https://github.com/Marcnava/Practica-UX-UI/blob/main/Images/Captura%20de%20pantalla%202023-07-21%20a%20las%201.45.16.png?raw=true)

![Mockup3](https://github.com/Marcnava/Practica-UX-UI/blob/main/Images/Captura%20de%20pantalla%202023-07-21%20a%20las%201.47.24.png?raw=true)

---
### Agradecimientos

Agradecer al profesor por sus excelentes clases.

- **Adri**

<a href="https://www.linkedin.com/in/adri4silva/" target="_blank"><img alt="Static Badge" src="https://img.shields.io/badge/linkedin-0072b1?style=for-the-badge&logo=linkedin&logoColor=white"></a>
<a href="https://github.com/adri4silva?tab=overview&from=2024-07-01&to=2024-07-29" target="_blank"><img alt="Static Badge" src="https://img.shields.io/badge/GITHUB-black?style=for-the-badge&logo=github&logoColor=white"></a>


