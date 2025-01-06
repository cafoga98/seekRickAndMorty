# **Rick and Morty Explorer**
Un explorador interactivo de personajes, episodios y ubicaciones de la serie **Rick and Morty**, desarrollado en **Flutter** utilizando **GraphQL**, **Clean Architecture**, y las mejores prácticas de desarrollo móvil.

---

## **Índice**
- [Descripción del Proyecto](#descripción-del-proyecto)
- [Características](#características)
- [Tecnologías Utilizadas](#tecnologías-utilizadas)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Configuración de Flavors](#configuración-de-flavors)
- [Instalación y Ejecución](#instalación-y-ejecución)
- [Capturas de Pantalla](#capturas-de-pantalla)
- [Contribuciones](#contribuciones)

---

## **Descripción del Proyecto**

**Rick and Morty Explorer** es una aplicación móvil diseñada para explorar el universo de la serie Rick and Morty mediante datos obtenidos desde su **API GraphQL oficial**.

El objetivo principal del proyecto es demostrar el dominio en Flutter mediante:
- **GraphQL**: Consultas avanzadas con manejo de errores.
- **Clean Architecture**: Código modular, testeable y mantenible.
- **BloC + Freezed**: Gestión eficiente de estado.
- **Flavors**: Configuración separada para entornos de desarrollo, QA y producción.

Esta aplicación no solo es un explorador, sino un ejemplo de un **stack completo en Flutter**, ideal para proyectos reales y escalables.

---

## **Características**

1. **Exploración de Personajes**
    - Lista de personajes paginada.
    - Búsqueda por nombre.
    - Detalles completos de cada personaje: estado, especie, género, origen, etc.

2. **Exploración de Episodios**
    - Lista de episodios paginada.
    - Búsqueda por nombre.
    - Detalles de cada episodio: personajes participantes, fecha de emisión, etc.

3. **Exploración de Ubicaciones**
    - Lista de ubicaciones paginada.
    - Búsqueda por nombre.
    - Detalles de cada ubicación: tipo y dimensión.

4. **Interfaz Adaptativa**
    - Diseño responsivo para dispositivos móviles y tabletas.
    - Inspirado en aplicaciones modernas de streaming.

---

## **Tecnologías Utilizadas**

- **Flutter**: Desarrollo multiplataforma (iOS y Android).
- **GraphQL**: Manejo eficiente de datos mediante `graphql_flutter`.
- **BloC + Freezed**: Gestión avanzada de estado.
- **GetIt**: Inyección de dependencias.
- **Clean Architecture**: Modularidad y escalabilidad del código.
- **Flutter Flavor**: Configuración separada para entornos (dev, qa, prod).
- **Dartz**: Manejo de errores funcionales con `Either`.
- **Flutter Dotenv**: Manejo de variables de entorno.

---

## **Estructura del Proyecto**

La estructura sigue el enfoque **feature-first** combinado con **Clean Architecture**:

```
lib/
│
├── core/                     # Código compartido y utilidades globales.
├   ├── config/                  # Configuración principal del proyecto
│   │   ├── auto_route/          # Configuración de rutas automáticas
│   │   ├── di/                  # Inyección de dependencias (Dependency Injection)
│   │   ├── error_handle/        # Manejo de errores y excepciones
│   │   ├── flavors/             # Configuración de flavors (dev, qa, prod)
│   │   └── network/             # Configuración de red y GraphQL
│   │  
│   ├── design/                  # Diseño global de la aplicación
│   │   ├── helpers/             # Funciones de ayuda relacionadas con diseño
│   │   ├── themes/              # Definición de temas (colores, tipografía, etc.)
│   │   ├── tokens/              # Tokens de diseño reutilizables
│   └───└── widgets/             # Widgets de diseño compartido
│
├── features/                 # Cada módulo separado por feature.
│   ├── characters/           # Módulo para personajes.
│   │   ├── data/             # Repositorios, modelos y servicios.
│   │   ├── domain/           # Casos de uso y entidades.
│   │   └── presentation/     # Pantallas, widgets y BloC/Cubit.
│   ├── episodes/             # Módulo para episodios (estructura similar a characters).
│   └── locations/            # Módulo para ubicaciones (estructura similar a characters).
│
├── shared/                   # Widgets y componentes reutilizables.
├── app.dart                  # Configuración de la app principal.
├── main_dev.dart             # Entrada para el flavor dev.
├── main_qa.dart              # Entrada para el flavor qa.
└── main_prd.dart             # Entrada para el flavor prod.
```

---

## **Configuración de Flavors**

Este proyecto utiliza **Flavors** para manejar diferentes entornos (dev, qa, prod).

### **Archivos de Flavors**
1. `main_dev.dart`
2. `main_qa.dart`
3. `main_prd.dart`

### **Variables de Entorno**
Los archivos `.env` almacenan configuraciones específicas de cada entorno:

#### **Archivo: `assets/env/dev.env`**
```env
BASE_URL=https://rickandmortyapi.com/graphql
ENV_NAME=development
DEBUG=true
```

#### **Archivo: `assets/env/qa.env`**
```env
BASE_URL=https://rickandmortyapi-qa.com/graphql
ENV_NAME=qa
DEBUG=true
```

#### **Archivo: `assets/env/prd.env`**
```env
BASE_URL=https://rickandmortyapi-prod.com/graphql
ENV_NAME=production
DEBUG=false
```

---

Gracias por señalarlo. Aquí está la sección de **Instalación** corregida para incluir el comando necesario para generar archivos con `build_runner` y evitar conflictos.

---

## **Instalación y Ejecución**

### **Requisitos Previos**
- Tener instalado [Flutter](https://docs.flutter.dev/get-started/install).
- Configurar los dispositivos/emuladores para pruebas.

### **Instalación**
1. Clona el repositorio:
   ```bash
   git clone https://github.com/cafoga98/seekRickAndMorty.git
   ```
2. Ve al directorio del proyecto:
   ```bash
   cd seekRickAndMorty
   ```
3. Instala las dependencias:
   ```bash
   flutter pub get
   ```
4. Genera los archivos necesarios con `build_runner`:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

### **Ejecución**
- **Dev**:
  ```bash
  flutter run -t lib/main_dev.dart
  ```
- **QA**:
  ```bash
  flutter run -t lib/main_qa.dart
  ```
- **Prod**:
  ```bash
  flutter run -t lib/main_prd.dart
  ```

---

## **Capturas de Pantalla**

### **Lista de Personajes**
![Lista de Personajes](https://via.placeholder.com/500x300?text=Lista+de+Personajes)

### **Detalles de un Personaje**
![Detalles de Personaje](https://via.placeholder.com/500x300?text=Detalles+de+Personaje)

### **Lista de Episodios**
![Lista de Episodios](https://via.placeholder.com/500x300?text=Lista+de+Episodios)

---

## **Contribuciones**

Si quieres contribuir al proyecto:
1. Crea un **fork** del repositorio.
2. Crea una rama con tu nueva funcionalidad:
   ```bash
   git checkout -b feature/nueva-funcionalidad
   ```
3. Realiza un **commit**:
   ```bash
   git commit -m "Añadida nueva funcionalidad"
   ```
4. Haz un **push** a tu fork:
   ```bash
   git push origin feature/nueva-funcionalidad
   ```
5. Abre un **pull request**.

---

## **Autor**

**Cesar Camilo Forero Galindo**  
Flutter Senior Developer 🚀  
[GitHub](https://github.com/cafoga98) | [LinkedIn](https://www.linkedin.com/in/cesar-camilo-forero-galindo-578408a1?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app)

---