# 🌍 FootCarbonPrint — Conoce tu Huella. Cambia tu Mundo.

> *"El primer paso para cambiar el planeta es entender cuánto impacto tienes tú."*

---

> ## 🟢 Estado del producto: **MVP v1.0 (disponible ahora)**
>
> Este documento describe **el producto tal como existe hoy**. Todo lo que aparece
> bajo la sección **"✅ Qué hace el MVP"** está **desarrollado, funcionando y disponible**
> en la aplicación actual. Todo lo que aparece bajo **"🔜 Qué NO hace todavía (v2.0+)"**
> está **planeado para después del MVP** y **aún no existe** en la app.
>
> Si esta documentación se publica en la página web del producto, **la separación
> MVP / futuro debe respetarse**: no anunciar como disponible nada que esté en la
> lista de futuras versiones.
>
> **En una frase:** el MVP es una **app Flutter (desplegada como aplicación web)** que,
> **100% offline y sin cuenta ni registro**, te permite autodiagnosticar tu huella de
> carbono anual con un test visual de 6 módulos, ver resultados y comparativas,
> recibir un plan de acción personalizado, jugar con puntos/niveles/insignias/retos,
> aprender con una guía educativa, calcular tu compensación y compartir tu resultado.

---

## ¿Qué es FootCarbonPrint?

**FootCarbonPrint** es una app de autodiagnóstico de huella de carbono que convierte datos cotidianos en conciencia real y acción concreta. No es un tracker más: es un diagnóstico visual, emocional y personalizado que le dice al usuario exactamente qué está pasando, por qué importa, y qué puede hacer hoy.

En pocos minutos, el usuario conoce su impacto ambiental anual en CO₂, lo compara con promedios locales y globales y recibe un plan de acción ordenado por impacto real — no por culpa, sino por posibilidad.

**Características del MVP como producto:**

| Atributo | Estado actual |
|----------|---------------|
| Plataforma | Flutter · desplegado como **aplicación web** (el mismo código apunta también a iOS/Android) |
| Cuenta / registro | **No requiere** cuenta, login ni conexión |
| Datos | **Locales en el dispositivo** (`SharedPreferences`); nada sale del equipo salvo que el usuario comparta |
| Conectividad | **Funciona 100% offline** |
| Idiomas | **5**: Español, Inglés, Francés, Portugués, Alemán (automático por dispositivo + selección manual) |
| Versión | 1.0.0 |

---

## El Problema que Resuelve

| Problema | Cómo lo resuelve el MVP |
|----------|-------------------------|
| "No sé cuánto contamino" | Test visual de 6 módulos con valores por defecto inteligentes |
| "Los datos ambientales son aburridos" | Equivalencias visuales ("= 70 árboles/año", planeta y aguja que cambian de color) |
| "Sé que debo cambiar, pero no sé por dónde" | Plan de acción **personalizado** ordenado por impacto real de cada acción |
| "Llené el formulario y lo olvidé" | Gamificación (puntos, niveles, insignias), retos semanales e historial de mediciones |
| "No quiero depender de la conexión ni dar mis datos" | Experiencia **totalmente offline y local**, sin cuenta |

---

## Personas Objetivo

| Perfil | Motivación |
|--------|------------|
| 🧑‍🎓 Joven urbano consciente | Quiere saber su impacto sin ser experto |
| 👩‍💼 Profesional ocupado | Prefiere respuestas rápidas y visuales |
| 🌱 Usuario comprometido | Busca metas, seguimiento y retos |
| 🏢 Empresas con ESG *(futuro)* | Panel para equipos — **planeado para v2.5, no está en el MVP** |

---

# ✅ Qué hace el MVP (funcionalidades disponibles hoy)

Esta es la lista **completa y verificada** de lo que la aplicación hace en este momento.

## 1. 🧭 Inicio y Onboarding

- **Splash animado** con logo y tagline al abrir la app.
- **Onboarding de 3 diapositivas** (medir tu impacto → dashboard visual → logros/gamificación), con opción de **saltar**. Se muestra solo la primera vez.
- Tras el onboarding, se entra al **contenedor principal con navegación inferior de 3 pestañas**: **Inicio**, **Mi Huella (Dashboard)** y **Plan de Acción**.

## 2. 📋 Auto-Test por Módulos (el corazón de la app)

Formato **Swipe & Tap**: selectores visuales, sliders y contadores — sin formularios de texto.
El test se divide en **6 módulos independientes** que se pueden completar **en cualquier orden** y **volver a editar** cuando se quiera. Cada módulo muestra una **estimación de CO₂ en vivo** que se actualiza a medida que el usuario responde, y queda marcado como completado al guardar.

Preguntas **realmente implementadas** en cada módulo:

#### 🚗 Transporte
| Pregunta | Input |
|----------|-------|
| Medio principal (gasolina, diésel, híbrido, eléctrico, moto, bus, bici, a pie) | Selector visual (8 opciones) |
| Km recorridos por semana | Slider (0–500) |
| Vuelos al año por tipo (corto / medio / largo radio) | Contadores +/− |

#### 🍔 Alimentación
| Pregunta | Input |
|----------|-------|
| Tipo de dieta (vegana, vegetariana, flexitariana, omnívora, carnívora) | Selector visual |
| Porciones de carne roja por semana | Slider (0–14) |
| Nivel de desperdicio de comida | Selector de 4 niveles |
| ¿Consumes alimentos locales / de temporada? | Interruptor |

#### 🏠 Hogar y Energía
| Pregunta | Input |
|----------|-------|
| Personas en el hogar | Slider (1–10) |
| **País** (ajusta el factor de red eléctrica) | Selector de 10 opciones |
| Fuente de energía (red, solar, gas, mixta) | Selector |
| Consumo mensual (kWh) | Slider (50–800) |
| Aire acondicionado y horas/día | Interruptor + slider |

#### 🛍️ Consumo y Compras
| Pregunta | Input |
|----------|-------|
| Prendas nuevas por mes | Slider |
| Electrónicos nuevos por año | Slider |
| Paquetes de e-commerce por mes | Slider |
| ¿Compras de segunda mano? | Interruptor |

#### ♻️ Residuos
| Pregunta | Input |
|----------|-------|
| Bolsas de basura por semana | Slider |
| ¿Separas residuos para reciclaje? | Interruptor |
| ¿Compostas residuos orgánicos? | Interruptor |

#### 💧 Agua
| Pregunta | Input |
|----------|-------|
| Minutos promedio de ducha | Slider (2–30) |
| Temperatura del agua (fría / tibia / caliente) | Selector |
| ¿Riegas jardín / zonas verdes? | Interruptor |

> **Nota:** al completar los 6 módulos por primera vez, la app abre automáticamente la pantalla de **Resultados**.

## 3. ⚙️ Motor de Cálculo CO₂

- Calcula el CO₂ anual (tCO₂/año) **por categoría** y el total, con **factores de emisión basados en la ciencia** (IPCC · EPA · GHG Protocol — ver *Metodología* más abajo).
- **Factor de red eléctrica seleccionable por país** en tiempo de ejecución: Colombia, EE.UU., México, Brasil, España, Alemania, Argentina, Chile, Perú y **promedio mundial** (fallback). Colombia por defecto.
- **Valores por defecto inteligentes** para completar el test rápido.
- Clasifica la huella en **5 niveles** (Campeón Verde → Consciente → En Camino → Alto Impacto → Crítico), cada uno con emoji y color.

## 4. 🎉 Pantalla de Resultados

- **Avatar de planeta** y **aguja (gauge)** que reflejan tu nivel, con **animación de confeti**.
- Valor total de huella con su **insignia de nivel** y color.
- **Comparativa** en barras: Tú vs Meta París vs Colombia vs Mundo.
- **Top 3 fuentes de emisión** ordenadas, con valor y porcentaje.
- Tarjeta de **logros** (puntos, nivel, insignias ganadas/bloqueadas).
- Botones para ir al Dashboard, al Plan de Acción o **compartir**.

## 5. 📊 Dashboard "Mi Huella"

- Cabecera con huella total, nivel y color.
- **Equivalencias reales:** árboles necesarios, años de bombilla encendida, cargas de smartphone.
- **Gráfico de torta/dona interactivo** de las 6 categorías, con leyenda y toque para expandir.
- **Benchmark** en barras: Tú vs Meta París vs Colombia vs Mundo.
- **Historial temporal:** guarda una medición por día (hasta 52), dibuja una **línea de tendencia** con ≥2 mediciones y muestra la variación % (mejoró/empeoró). Con estados vacío / una medición / varias.
- **Calculadora de compensación:** árboles necesarios y **costo estimado** (USD anual/mensual) para neutralizar tu huella, con advertencia *"reduce primero, luego compensa"* y **enlaces a plataformas certificadas** (Gold Standard, Pachama, atmosfair).
- **Exportar resultado como imagen PNG** y acceso a la **tarjeta de perfil / Eco Card**.

## 6. 💡 Plan de Acción Personalizado

- Genera acciones **calculadas a partir de tus propios datos** (no una lista fija).
- **Omite acciones que ya realizas** (p. ej. si ya reciclas).
- Calcula el **ahorro de CO₂ realista** de cada acción y las ordena por impacto (top ~6).
- Cada acción muestra categoría, color, ahorro estimado (−t) y descripción.
- Cabecera con la **reducción potencial total** y su % sobre tu huella actual.
- Botón **"Me comprometo"** (toggle) que otorga puntos y **se guarda** entre sesiones.
- Lista de **retos** al final del plan.

## 7. 🎮 Gamificación y Retos

- **EcoPoints** calculados por: módulos completados, bonus por completar los 6, terminar la guía educativa, acciones a las que te comprometes, retos completados y bonus por huella baja.
- **5 niveles Eco** (Principiante → Aprendiz → Consciente → Activista → Eco-Campeón) con emoji, color y rangos de puntos.
- **8 insignias** con condiciones de logro (primer paso, explorador, completista, educado, consciente, huella ligera, comprometido, activista); se muestran ganadas o bloqueadas.
- **Reto semanal** en Inicio que **rota automáticamente por semana del año** (4 retos), se puede marcar como cumplido (otorga puntos) y **se persiste por semana**.
- *(Detalle de diseño):* la pantalla de Inicio es **gamificación-primero** y no muestra el número de CO₂; ese valor aparece en Resultados, Dashboard, la vista previa de cada módulo y las tarjetas compartibles.

## 8. 📚 Guía Educativa

- **Guía de 6 lecciones** deslizables: bases del clima → efecto invernadero → huellas → categorías → comparación entre países → acciones.
- Cada lección tiene título, cuerpo, un dato destacado y una **visual gráfica animada** propia.
- Barra de progreso, navegación anterior/siguiente y **marca de completado** (otorga insignia + puntos).
- Accesible desde el Test Hub mediante un banner (copy distinto para primera vez vs. regreso).

## 9. 🔗 Compartir y Exportar

- Compartir el resultado como **texto** vía la hoja de compartir nativa/web (nivel + tCO₂ + enlace).
- Exportar el resultado como **imagen de marca (PNG)**.
- Generar y compartir una **Tarjeta de Perfil / Eco Card** (avatar o **foto** elegida por el usuario, nombre, nivel, puntos y estadísticas) como PNG de alta resolución.
- Las opciones de compartir se ocultan con elegancia donde la plataforma no las soporta.

## 10. ⚙️ Ajustes y Personalización

- **Nombre** de usuario (usado en el saludo y la Eco Card).
- **Tema**: Sistema / Claro / Oscuro (paridad completa light/dark), persistido.
- **Idioma**: **Automático (según el dispositivo)** + selección manual entre **Español, Inglés, Francés, Portugués y Alemán**, persistido.

## 11. 🔒 Datos, Privacidad y Offline

- **Todo se guarda localmente** en el dispositivo (huella, módulos, compromisos, historial, retos, nombre, tema, idioma).
- **Funciona completamente offline**; sin cuenta ni red.
- Serialización segura con recuperación ante datos corruptos.
- **Privacy-first:** ningún dato personal sale del dispositivo salvo que el usuario decida compartir explícitamente. Las fotos de la Eco Card se quedan locales.

---

## Flujo de Usuario (MVP)

```
Splash animado
    ↓
Onboarding (3 diapositivas, se puede saltar)   [solo la primera vez]
    ↓
Inicio (nivel, logros, reto semanal, progreso del test)
    ↓
Test Hub → 6 módulos (Transporte, Alimentación, Hogar, Consumo, Residuos, Agua)
    ↓
Motor de Cálculo CO₂ (IPCC · EPA · GHG Protocol · factor de red por país)
    ↓
Resultados (planeta + aguja + comparativa + top 3 + logros)
    ↓
Dashboard (equivalencias + torta + benchmark + historial + compensación + export)
    ↓
Plan de Acción (acciones personalizadas + compromisos + retos)
    ↓
Seguimiento en el tiempo · Gamificación · Compartir
```

---

# 🔜 Qué NO hace el MVP todavía (planeado para v2.0 y posteriores)

> ⚠️ **Importante para la página web:** las siguientes funcionalidades **no existen aún**
> en la aplicación. Se documentan como visión/roadmap y **no deben presentarse como
> disponibles**.

| Funcionalidad futura | Estado |
|----------------------|--------|
| **OCR de facturas** de luz/gas (foto del recibo → kWh automáticos) | ❌ No implementado |
| **Sincronización GPS / Google Maps / Apple Maps** para transporte automático | ❌ No implementado |
| **Compensación real**: compra de créditos de carbono, "Monedero Verde", donar EcoPoints a proyectos | ❌ Solo existe una **calculadora** + enlaces externos; no hay compra ni monedero |
| **Componente social**: comparar con amigos, retos grupales, comunidad dentro de la app | ❌ No implementado (solo compartir imagen/texto) |
| **Notificaciones push inteligentes** | ❌ No implementado |
| **Cuentas de usuario / login social** (Email, Google, Apple) y sincronización en la nube | ❌ No implementado (la app es local y sin cuenta) |
| **Backend propio** (Spring Boot) + **PostgreSQL** + **Panel admin** (Angular) para factores por región | ❌ No implementado |
| **Integración con apps bancarias** | ❌ No implementado |
| **Analytics de producto** (Mixpanel / Amplitude) | ❌ No implementado |
| **Versión empresarial / ESG** para equipos | ❌ No implementado |
| Preguntas adicionales del test: tipo de vivienda y m², plásticos de un solo uso, lácteos por separado, frecuencia de transporte compartido, selector de perfil Urbano/Rural/Mixto | ❌ No implementadas en el MVP |

---

## Metodología de Cálculo — Fórmulas y Ecuaciones

Todas las categorías del MVP siguen la ecuación base universal que definen las
entidades oficiales — **GHG Protocol** (WRI/WBCSD), **ISO 14064/14067** e **IPCC**:

```
Emisiones = Dato de actividad × Factor de emisión
Huella total = Σ categorías, expresada en toneladas de CO₂e/año

  · Dato de actividad: km, kWh, porciones, minutos de ducha, bolsas, etc.
  · Factor de emisión: kgCO₂e por unidad de actividad (fuentes oficiales).
  · CO₂e: los factores usados ya incorporan CH₄, N₂O y forzamiento radiativo
          cuando aplica (p. ej. vuelos de largo alcance).
```

#### 🚗 Transporte
```
CO₂_transporte (tCO₂) = (factor_vehículo × km_semanales × 52 + Σ vuelos) ÷ 1000

  factor_vehículo [kgCO₂/km]  ←  EEA 2024 / DEFRA 2024 / Our World in Data
  Σ vuelos = n_cortos×255 + n_medios×590 + n_largos×1620  [kgCO₂]
              ↑ ICAO Carbon Emissions Calculator v13 (2024)
```

#### 🍔 Alimentación
```
CO₂_alim (tCO₂) = base_dieta
                  + (Δporciones_res × 0.35 kg × 27 kgCO₂/kg × 52 ÷ 1000)
                  − 0.1 (si alimentos locales)
                  + base_dieta × desperdicio × 0.30

  Δporciones_res = porciones_res/semana − promedio de la dieta
  base_dieta [tCO₂/año]     ←  Springmann et al. (2018), Nature
  factor res: 27 kgCO₂/kg   ←  Poore & Nemecek (2018), Science

  La línea base de cada dieta ya incluye un consumo promedio de res, por lo que
  el factor 27 se aplica solo a las porciones que se DESVÍAN de ese promedio
  (carnívora 6, omnívora 3, flexitariana 1, veg. 0), evitando el doble conteo.
```

#### 🏠 Hogar y Energía
```
CO₂_hogar (tCO₂) = (kWh_mes ÷ personas × 12 × factor_energía) ÷ 1000
                  + horas_AC × 365 × 1.5 kW × factor_energía ÷ 1000

  factor_energía depende de la fuente y del PAÍS seleccionado:
    red/mixto → factor_red[país]  (fallback: mundial 0.459)
    gas       → 2.04 kgCO₂/m³ ÷ 10.55 kWh/m³ = 0.193 kgCO₂/kWh
    solar     → 0.020 kgCO₂/kWh

  factor_red por país [kgCO₂/kWh]  ←  IEA Emission Factors 2023 / UPME-XM
    Colombia 0.175 · EE.UU. 0.369 · México 0.423 · Brasil 0.120 ·
    España 0.156 · Alemania 0.381 · Argentina 0.310 · Chile 0.330 ·
    Perú 0.230 · Mundial 0.459
```

#### 💧 Agua
```
CO₂_agua (tCO₂) = minutos_ducha × 365 × factor_temperatura ÷ 1000
                 + 0.05 (si tiene jardín)

  factor_temperatura [kgCO₂/min]:
    Fría:    0.000   ·   Tibia: 0.030   ·   Caliente: 0.060
  ← SSPD Colombia; UPME 2023; Carbon Trust shower data
```

#### ♻️ Residuos
```
CO₂_residuos (tCO₂) = bolsas/semana × 260 kgCO₂ ÷ 1000
                     × 0.7 (si recicla) × 0.8 (si composta)

  260 = 52 semanas × 5 kgCO₂/bolsa (~10 kg RSU × 0.5 kgCO₂/kg)
  ← IPCC 2006 Vol. 5 (Waste), modelo FOD; EPA WARM Model v16
```

#### 🛍️ Consumo y Compras
```
CO₂_consumo (tCO₂) = ropa/mes × 12 × 10 ÷ 1000
                    + electrónicos/año × 70 ÷ 1000
                    + paquetes/mes × 12 × 0.5 ÷ 1000
                    − 0.1 (si compra segunda mano)

  10 kgCO₂/prenda    ←  Global Fashion Agenda — Pulse 2017
  70 kgCO₂/smartphone ←  Apple Environmental Progress Report 2023
```

---

## Sistema de Niveles e Insignias (MVP)

#### Niveles de Huella (según tCO₂/año)
| Nivel | Rango | Ícono |
|-------|-------|-------|
| Campeón Verde | < 1.5 tCO₂/año | 🌿 |
| Consciente | 1.5 – 3 t | 🌍 |
| En Camino | 3 – 5 t | 🟡 |
| Alto Impacto | 5 – 8 t | 🔴 |
| Crítico | > 8 t | 💀 |

#### Niveles de EcoPoints (gamificación)
| Nivel | Nombre | Requisito |
|-------|--------|-----------|
| 🌱 | Principiante | 0–49 pts |
| 🔎 | Aprendiz | 50–149 pts |
| 💚 | Consciente | 150–299 pts |
| ✊ | Activista | 300–449 pts |
| 🏆 | Eco-Campeón | 450+ pts |

#### Comparativas de referencia
```
Meta París 2050:    2.0 t CO₂/año
Promedio Colombia:  1.9 t CO₂/año
Promedio mundial:   4.7 t CO₂/año
```

---

## Stack Tecnológico

### ✅ En uso hoy (MVP)
| Capa | Tecnología | Rol |
|------|-----------|-----|
| App | **Flutter** | Un solo código para Web (desplegado) + iOS/Android |
| Estado | **provider** | Gestión de estado reactiva |
| Persistencia | **shared_preferences** | Almacenamiento local en el dispositivo |
| Gráficos | **fl_chart** | Torta e historial de tendencia |
| Tipografía | **google_fonts** (Inter) | Sistema tipográfico |
| Fotos / export | **image_picker** + captura de widget a PNG | Foto de la Eco Card y exportación de imágenes |
| i18n | **flutter_localizations** + ARB | 5 idiomas |

### 🔜 Planeado (no está en el MVP)
| Capa | Tecnología prevista | Para |
|------|---------------------|------|
| Backend API | Spring Boot | Cálculo y gestión de usuarios en la nube |
| Base de datos | PostgreSQL | Historial multi-usuario |
| Panel Admin | Angular + PrimeNG | Configurar factores por región |
| Autenticación | Firebase Auth | Login social |
| Notificaciones | Firebase Cloud Messaging | Push |
| OCR | ML Kit / Google Vision | Lectura de facturas |
| Analytics | Mixpanel / Amplitude | Engagement y retención |
| Compensación | APIs Gold Standard / Verra | Compra de créditos verificados |

---

## Roadmap de Desarrollo

### ✅ MVP (v1.0) — **Completado y disponible**
- [x] App Flutter con los **6 módulos de test** + **motor de cálculo** (factor de red por país)
- [x] **Resultados** (planeta, aguja, confeti, comparativa, top 3, logros)
- [x] **Dashboard** (equivalencias, torta, benchmark, historial, calculadora de compensación, export)
- [x] **Plan de acción personalizado** + compromisos
- [x] **Gamificación** (EcoPoints, 5 niveles, 8 insignias, reto semanal)
- [x] **Guía educativa** (6 lecciones)
- [x] **Compartir/exportar** (texto, PNG, Eco Card)
- [x] **Ajustes** (nombre, tema, idioma) + **5 idiomas** con detección automática
- [x] **Offline y local-first** (sin cuenta ni backend)

### 🔜 v2.0 — Datos automáticos y compensación real
- [ ] OCR de facturas de luz/gas
- [ ] Sincronización GPS para transporte automático
- [ ] Módulo de compensación con **compra** de proyectos certificados y Monedero Verde
- [ ] Componente social (retos grupales + comparar con amigos)
- [ ] Notificaciones push inteligentes

### 🔜 v2.5 — Nube, cuentas y empresa
- [ ] Cuentas de usuario / login social + sincronización en la nube
- [ ] Backend (Spring Boot + PostgreSQL) y panel admin (Angular) de factores por región
- [ ] Integración con apps bancarias
- [ ] Versión empresarial / ESG para equipos
- [ ] Analytics de producto

---

## Diferenciadores Clave vs. Competencia

| App Competidora | Qué le falta | Lo que FootCarbonPrint (MVP) agrega |
|----------------|-------------|-------------------------------------|
| Sustainably | Solo tracking básico | Plan de acción personalizado + gamificación + educación |
| Klima | Solo compensación | Diagnóstico + educación + seguimiento + calculadora de compensación |
| WWF Footprint | Test simple, sin seguimiento | Avatar/planeta interactivo + historial + insignias |
| Oroeco | Bancario, sin personalización | Factor de red por país + acciones calculadas con tus datos |

> **FootCarbonPrint no es solo un tracker: en su MVP ya combina diagnóstico + educación + acción personalizada + seguimiento + gamificación, 100% offline y sin cuenta.**

---

## Impacto Esperado

Si 10,000 usuarios reducen su huella un 10%:

```
10,000 usuarios × 3.2 tCO₂/año promedio × 10% = 3,200 tCO₂ evitadas al año

Equivalente a:
  🌲 53,000 árboles plantados
  🚗 700 autos fuera de circulación durante un año
  ✈️  400 vuelos Bogotá-Madrid eliminados
```

---

## Referencias Científicas

Todos los factores de emisión y ecuaciones del motor de cálculo del MVP están
respaldados por fuentes oficiales e internacionalmente reconocidas. La
documentación completa está en
[`lib/core/constants/emission_references.dart`](lib/core/constants/emission_references.dart).

### Transporte

| Referencia | Año | Uso en la app |
|-----------|-----|--------------|
| [DEFRA — UK Greenhouse Gas Conversion Factors 2024](https://www.gov.uk/government/publications/greenhouse-gas-reporting-conversion-factors-2024) | 2024 | Factores kgCO₂/km para auto, moto y metro |
| [Our World in Data — Travel Carbon Footprint (Ritchie)](https://ourworldindata.org/travel-carbon-footprint) | 2020 | Factores bus (0.089) y metro (0.041) kgCO₂/km |
| [ICAO Carbon Emissions Calculator v13](https://icec.icao.int) | 2024 | Emisiones por vuelo: 255 / 590 / 1 620 kgCO₂ (corto/medio/largo) |

### Alimentación

| Referencia | Año | Uso en la app |
|-----------|-----|--------------|
| [Poore & Nemecek — *Science* 360(6392):987](https://doi.org/10.1126/science.aaq0216) | 2018 | Factores por kg de alimento (res 27, cerdo 7.6, pollo 6.9…). El factor de res se aplica sobre la **desviación** respecto al promedio de la dieta |
| [Springmann et al. — *Nature* 562:519](https://doi.org/10.1038/s41586-018-0594-0) | 2018 | Líneas base anuales por tipo de dieta (0.7–2.5 tCO₂/año) |
| [Scarborough et al. — *Nature Food* 4:565](https://doi.org/10.1038/s43016-023-00795-w) | 2023 | Validación de baselines: vegana 0.50 t → carnívora 1.32 t/año |

### Energía

| Referencia | Año | Uso en la app |
|-----------|-----|--------------|
| [XM / UPME — Factor Emisión SIN Colombia](https://www.xm.com.co/noticias/en-colombia-factor-de-emision-de-co2-por-generacion-electrica-del-sistema-interconectado) | 2020–2024 | Red eléctrica Colombia: **0.175 kgCO₂/kWh** |
| [IEA — Emission Factors 2023](https://www.iea.org/data-and-statistics/data-product/emissions-factors-2023) | 2023 | Factor de red **por país** (selector de 10 opciones) |
| [IPCC 2006 Guidelines — Vol. 2 Energy, Tabla 1.4](https://www.ipcc-nggip.iges.or.jp/public/2006gl/vol2.html) | 2006 | Gas natural: 2.04 kgCO₂/m³ → **0.193 kgCO₂/kWh** |
| [IPCC SRREN](https://www.ipcc.ch/report/renewable-energy-sources-and-climate-change-mitigation/) | 2011 | Solar fotovoltaico: 0.020 kgCO₂/kWh (ciclo de vida) |

### Residuos y Agua

| Referencia | Año | Uso en la app |
|-----------|-----|--------------|
| [IPCC 2006 Guidelines — Vol. 5 Waste, Modelo FOD](https://www.ipcc-nggip.iges.or.jp/public/2006gl/vol5.html) | 2006 | RSU en vertedero: ~0.5 kgCO₂/kg → 5 kgCO₂/bolsa de 10 kg |
| [EPA WARM Model v16](https://www.epa.gov/warm) | 2023 | Validación del factor de residuos sólidos |
| SSPD Colombia + UPME 2023 | 2023 | Ducha eléctrica inst.: 0.030 (tibia) / 0.060 (caliente) kgCO₂/min |

### Benchmarks y Compensación

| Referencia | Año | Uso en la app |
|-----------|-----|--------------|
| [IEA — CO₂ Emissions in 2023](https://www.iea.org/reports/co2-emissions-in-2023) | 2023 | Promedio global: **4.7 tCO₂/persona/año** |
| [World Bank / Our World in Data — Colombia](https://ourworldindata.org/co2/country/colombia) | 2023 | Promedio Colombia: **1.9 tCO₂/persona/año** |
| [IPCC Special Report 1.5 °C (SR15)](https://www.ipcc.ch/sr15/) | 2018 | Meta París 2050: **≤ 2.0 tCO₂/persona/año** |
| [EPA — GHG Equivalencies Calculator](https://www.epa.gov/energy/greenhouse-gas-equivalencies-calculator-calculations-and-references) | 2023 | Árbol urbano maduro: **60 kgCO₂/año** → 16.7 árboles/tCO₂ |

---

## Documentación Relacionada

- **Especificación funcional detallada** (inventario requisito-a-requisito de todo lo que hace el MVP):
  [`docs/FUNCTIONAL_SPECIFICATION.md`](docs/FUNCTIONAL_SPECIFICATION.md)
- **Sistema de diseño** (paleta light/dark, tipografía, componentes, listo para Figma/Penpot):
  [`docs/DESIGN_SYSTEM.md`](docs/DESIGN_SYSTEM.md)

---

## Testing y Calidad

El motor de cálculo (funciones puras por categoría en `lib/models/carbon_footprint.dart`)
está cubierto por pruebas unitarias en
[`test/carbon_footprint_test.dart`](test/carbon_footprint_test.dart):

- **Pruebas por categoría** — transporte, alimentación, hogar, consumo, residuos y agua.
- **Alimentación** — el factor de res (27 kgCO₂e/kg) se aplica sobre la desviación del promedio de la dieta.
- **Hogar** — factor de red correcto según el país, gas per-kWh, fallback mundial y round-trip de JSON.
- **Test de conformidad** — fija factores clave a los valores publicados por las fuentes oficiales.

**Quality gates (CI, `.github/workflows/ci.yml`, Flutter 3.32.2):**

```bash
flutter pub get
flutter analyze --no-fatal-infos
flutter test --platform chrome
```

---

## Contribuir

```bash
git clone https://github.com/yesithv/footcarbonprint-app.git
cd footcarbonprint-app
flutter pub get
flutter run   # -d chrome para la web
```

---

<div align="center">

**Hecho con 🌱 para reducir la huella de carbono de Latinoamérica**

*FootCarbonPrint — Conoce tu Huella. Cambia tu Mundo.*

</div>
