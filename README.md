# 🌍 FootCarbonPrint — Conoce tu Huella. Cambia tu Mundo.

> *"El primer paso para cambiar el planeta es entender cuánto impacto tienes tú."*

---

## ¿Qué es FootCarbonPrint?

**FootCarbonPrint** es una app de autodiagnóstico de huella de carbono que convierte datos cotidianos en conciencia real y acción concreta. No es un tracker más: es un diagnóstico visual, emocional y personalizado que le dice al usuario exactamente qué está pasando, por qué importa, y qué puede hacer hoy.

En menos de **7 minutos**, el usuario conoce su impacto ambiental anual en CO₂, lo compara con promedios globales y recibe un plan de acción ordenado por impacto real — no por culpa, sino por posibilidad.

---

## El Problema que Resuelve

| Problema | Cómo lo resuelve FootCarbonPrint |
|----------|----------------------------------|
| "No sé cuánto contamino" | Test inteligente en ≤7 min con valores por defecto |
| "Los datos ambientales son aburridos" | Equivalencias visuales e interactivas ("70 árboles talados/año") |
| "Sé que debo cambiar, pero no sé por dónde" | Plan de acción ordenado por impacto y dificultad |
| "Llené el formulario y lo olvidé" | Gamificación, retos semanales y seguimiento en el tiempo |
| "No quiero pagar datos si no los uso" | Modo offline básico disponible |

---

## Personas Objetivo

| Perfil | Motivación |
|--------|------------|
| 🧑‍🎓 Joven urbano consciente | Quiere saber su impacto sin ser experto |
| 👩‍💼 Profesional ocupado | Prefiere respuestas rápidas y visuales |
| 🌱 Usuario comprometido | Busca metas, seguimiento y comunidad |
| 🏢 Empresas con ESG | Panel para medir impacto de equipos |

---

## Flujo de Usuario Principal

```
Bienvenida (30s)
    ↓
Perfil inicial → País / Ciudad / Personas en hogar
    ↓
Auto-Test por Módulos (≤35 preguntas · ≤7 minutos)
    ↓
Motor de Cálculo CO₂ (IPCC · EPA · GHG Protocol)
    ↓
Dashboard de Resultados → Huella total + desglose + comparativa
    ↓
Plan de Acción Personalizado → Top 5 acciones por impacto
    ↓
Seguimiento + Retos + Gamificación
    ↓
Compensación (Opcional / Premium)
```

---

## Módulos Funcionales

### 1. 🧭 Onboarding Inteligente
- Bienvenida con analogía visual: *"Tu huella = árboles que necesitarías plantar para compensarla"*
- Selector de perfil: **Urbano / Rural / Mixto** (ajusta factores de emisión locales)
- Selector de país/región → Colombia, con factor de emisión de red eléctrica propio (≠ Alemania)
- Meta inicial opcional: *¿Qué te motivó? → Ahorrar dinero / Cuidar el planeta / Compensar*
- Registro en 1 tap: Email, Google o Apple ID

---

### 2. 📋 Auto-Test Dinámico (Corazón de la App)

Formato **Swipe & Tap**: sliders, selectores visuales, iconos — sin formularios aburridos.  
Dividido en **6 módulos independientes** que el usuario puede completar por separado:

#### 🚗 Transporte *(28–35% de la huella)*
| Pregunta | Input |
|----------|-------|
| Medio principal (auto, moto, bus, bici, pie) | Selector visual |
| Tipo de combustible | Selector |
| Km recorridos por semana | Slider |
| Vuelos al año (corto / medio / largo radio) | Contador por tipo |
| Uso de transporte compartido | Frecuencia |

> Cálculo: `kgCO₂/km × distancia semanal × 52 semanas`

#### 🍔 Alimentación *(25–30% de la huella)*
| Pregunta | Input |
|----------|-------|
| Tipo de dieta (omnívora, flexitariana, vegetariana, vegana) | Selector visual |
| Consumo de carne roja (veces/semana) | Slider |
| Consumo de lácteos | Frecuencia |
| % de alimentos locales / de temporada | Slider estimado |
| Desperdicio de comida | Selector |

> Dato clave: La carne de res emite ~27 kgCO₂/kg producido. El desperdicio duplica la huella de ese alimento.

#### 🏠 Hogar y Energía *(20–25% de la huella)*
| Pregunta | Input |
|----------|-------|
| Tipo de vivienda y m² | Selector + número |
| Fuente de energía (red eléctrica, solar, gas, leña) | Selector |
| Consumo mensual (kWh o valor factura) | Input + **OCR de factura** |
| Climatización AC / calefacción (horas/día) | Slider |
| Personas en el hogar | Contador |

> **OCR Inteligente:** El usuario puede fotografiar su recibo de luz/gas y la app extrae los kWh automáticamente.

#### 🛍️ Consumo y Compras *(10–15% de la huella)*
| Pregunta | Input |
|----------|-------|
| Prendas nuevas por mes | Slider |
| % de ropa de segunda mano | Slider |
| Electrónicos nuevos por año | Contador |
| Paquetes de e-commerce por mes | Contador |
| Uso de plásticos de un solo uso | Frecuencia |

#### ♻️ Residuos *(5–8% de la huella)*
| Pregunta | Input |
|----------|-------|
| ¿Separas residuos para reciclaje? | Sí / No / Parcial |
| Bolsas de basura por semana | Selector |
| ¿Compostas residuos orgánicos? | Sí / No |
| Disposición de electrónicos (e-waste) | Frecuencia |

#### 💧 Agua *(módulo diferenciador)*
| Pregunta | Input |
|----------|-------|
| Minutos promedio de ducha | Slider |
| Temperatura del agua (fría / tibia / caliente) | Selector |
| Riego de jardín / zonas verdes | Sí/No + frecuencia |

---

### 3. ⚙️ Motor de Cálculo CO₂

- Algoritmo basado en estándares internacionales: **IPCC · EPA · GHG Protocol**
- Factor de emisión **ajustado por país** (la red eléctrica de Colombia, basada en hidroeléctrica, es muy diferente a la de Alemania)
- Valores por defecto inteligentes para usuarios que no conocen sus consumos exactos

**Output:**
```
Huella total: 3.2 tCO₂eq/año

Desglose:
  🚗 Transporte    → 45%   (1.44 t)
  🍔 Alimentación  → 25%   (0.80 t)
  🏠 Hogar         → 20%   (0.64 t)
  🛍️ Consumo       → 10%   (0.32 t)
```

---

### 4. 📊 Dashboard de Resultados

#### Visualización del Impacto Real
Los datos fríos no mueven emociones. FootCarbonPrint traduce toneladas de CO₂ en imágenes que impactan:

- 🌲 *"Tu impacto equivale a talar **70 árboles** al año"*
- 💡 *"O a dejar una bombilla encendida durante **15 años**"*
- 📱 *"O a cargar **847 smartphones** sin parar"*

#### Avatar Interactivo
Un planeta Tierra (o huella visual) que **cambia de color en tiempo real** según el resultado: de verde vibrante a rojo crítico.

#### Sistema de Medallas
| Nivel | Rango | Ícono |
|-------|-------|-------|
| Campeón Verde | < 1.5 tCO₂/año | 🌿 |
| Consciente | 1.5 – 3 t | 🌍 |
| En Camino | 3 – 5 t | 🟡 |
| Alto Impacto | 5 – 8 t | 🔴 |
| Crítico | > 8 t | 💀 |

#### Comparativa Contextual
```
Tu huella:          3.2 t CO₂/año
Promedio Colombia:  1.8 t CO₂/año   ↑ +78%
Promedio mundial:   4.7 t CO₂/año   ↓ -32%
Meta París 2050:    2.0 t CO₂/año   ↑ +60%
```

---

### 5. 💡 Plan de Acción Personalizado

La app no solo mide — **dice qué hacer y calcula el impacto exacto de cada acción.**

Top 5 recomendaciones ordenadas por impacto, con su dificultad y ahorro estimado:

| Acción | Reducción | Dificultad |
|--------|-----------|------------|
| Eliminar 1 vuelo largo al año | −1.5 tCO₂ | Media |
| Adoptar dieta flexitariana | −0.8 tCO₂/año | Media |
| Dejar de comer carne 3 días/semana | −0.4 tCO₂/año | Baja |
| Usar transporte público 2 días/semana | −0.3 tCO₂/año | Baja |
| Instalar ducha de bajo flujo | −0.1 tCO₂/año | Baja |

Cada acción incluye: descripción, recurso externo y botón **"Me comprometo"** con recordatorio automático.

**Calculadora en tiempo real:** Al marcar un reto como cumplido, el usuario ve cómo baja su aguja de emisiones — y cuánto dinero ahorra.

---

### 6. 🎮 Gamificación y Seguimiento

#### Sistema de Puntos — EcoPoints
- Cada reto cumplido suma puntos
- Los puntos desbloquean niveles y badges

| Nivel | Nombre | Requisito |
|-------|--------|-----------|
| 🌱 | Novato Verde | Completar el test |
| 🌍 | Consciente | 100 EcoPoints |
| 🌳 | Experto Verde | 500 EcoPoints + reducir 10% huella |
| 🦋 | Transformador | 1000 EcoPoints + completar 1 módulo de compensación |

#### Retos Semanales
- *"Semana sin plástico de un solo uso"*
- *"7 días sin carne roja"*
- *"Viaja en bici o caminando 3 días esta semana"*
- *"Ducha de máximo 5 minutos por 5 días"*

#### Seguimiento Temporal
- Gráfico de línea de tendencia mensual/anual
- Alertas inteligentes: *"Tu huella aumentó un 12% este mes en transporte"*
- Diario de acciones: registra acciones concretas y ve el CO₂ acumulado ahorrado
- Test recurrente: mensual / trimestral / anual con comparativa histórica

---

### 7. 🤖 Automatización Pasiva (Nivel Avanzado)

Para el usuario que no quiere registrar todo manualmente:

- **Sincronización GPS / Google Maps / Apple Maps** → detecta si caminó, usó bici o auto → calcula el impacto del transporte del día sin intervención manual
- **OCR de facturas** → foto del recibo de luz o gas → extracción automática de kWh
- **Integración con apps bancarias** → análisis de patrones de consumo (con consentimiento)
- **Notificaciones eco-inteligentes:**
  - *"Esta semana usaste más el carro. ¿Puedes combinar viajes?"*
  - *"Con el calor de esta semana, el AC puede representar el 40% de tu consumo"*

---

### 8. 🌳 Módulo de Compensación *(Opcional / Premium)*

Para lo que no se puede reducir, se puede compensar:

- Calculadora de cuántos árboles necesitas plantar para ser carbono neutro
- **Monedero Verde:** Los EcoPoints ganados se pueden donar a proyectos verificados
- Integración con iniciativas certificadas:
  - 🇨🇴 Colombia: Visión Amazonía, Fondo Acción
  - 🌐 Global: Gold Standard, Verra VCS, atmosfair
- Cálculo del costo estimado para neutralizar tu huella completamente

---

### 9. 📚 Módulo Educativo

- **Tooltips contextuales** en cada pregunta: *"¿Por qué importa esto?"*
- **Micro-contenidos** por categoría:
  - *"¿Por qué la carne genera más CO₂ que el pollo?"*
  - *"El impacto real de un vuelo transatlántico"*
  - *"Cómo la matriz energética de Colombia afecta tu huella"*
- Tips diarios en el home
- Equivalencias visuales y emotivas que contextualizan los datos

---

### 10. 🌐 Componente Social *(Opcional)*

- Compararte con amigos de forma anónima o consensuada
- Retos grupales: *"Este mes, el grupo reduce un 10% en transporte"*
- Compartir tu progreso en redes con gráfico generado por la app

---

## Principios de Diseño UX

| Principio | Implementación |
|-----------|----------------|
| **Rápido** | ≤7 min, ≤35 preguntas totales, valores por defecto inteligentes |
| **Visual** | Sliders, iconos, animaciones — cero formularios |
| **Emocional** | Equivalencias en la vida real, no solo números fríos |
| **No culpabilizador** | Lenguaje de posibilidades, no de juicio |
| **Privacy First** | Datos sensibles, opción de uso completamente offline |
| **Accesible** | Diseño inclusivo, lenguaje simple, sin jerga técnica |
| **Local** | Datos calibrados para Colombia (altitud, red eléctrica, clima, cultura) |

---

## Stack Tecnológico

| Capa | Tecnología | Razón |
|------|-----------|-------|
| **App Móvil** | Flutter | Multiplataforma (iOS + Android + Web) |
| **Backend API** | Spring Boot | API REST de cálculo y gestión de usuarios |
| **Base de datos** | PostgreSQL (multi-tenant) | Historial de tests aislado por usuario |
| **Panel Admin** | Angular + PrimeNG | Configuración de factores de emisión por región |
| **Autenticación** | Firebase Auth | Login social rápido |
| **Notificaciones** | Firebase Cloud Messaging | Push notifications multiplataforma |
| **OCR Facturas** | ML Kit / Google Vision | Extracción de datos de recibos |
| **Factores de emisión** | Base propia (IPCC + Ecoinvent) | Actualizable por región sin redespliegue |
| **Analytics** | Mixpanel / Amplitude | Seguimiento de engagement y retención |
| **Compensación** | APIs Gold Standard / Verra | Proyectos certificados |

---

## Diferenciadores Clave vs. Competencia

| App Competidora | Qué le falta | Lo que FootCarbonPrint agrega |
|----------------|-------------|-------------------------------|
| Sustainably | Solo tracking básico | Plan de acción + gamificación + OCR |
| Klima | Solo compensación | Diagnóstico + educación + seguimiento |
| WWF Footprint | Test simple, sin seguimiento | Avatar interactivo + tracker temporal |
| Oroeco | Bancario, sin personalización | Contexto local Colombia + factores regionales |

> **FootCarbonPrint no es solo un tracker: es diagnóstico + educación + acción + seguimiento + comunidad.**

---

## Roadmap de Desarrollo

### MVP (v1.0) — 3 meses
- [x] Especificación funcional completa
- [ ] App Flutter (5 módulos de test + motor de cálculo)
- [ ] Dashboard básico con gráficos
- [ ] Plan de acción personalizado
- [ ] Autenticación y perfil de usuario

### v1.5 — Mes 4-5
- [ ] Gamificación (EcoPoints + niveles + retos semanales)
- [ ] Seguimiento temporal (gráfico de tendencia)
- [ ] Notificaciones push inteligentes
- [ ] Módulo educativo (tooltips + micro-contenidos)

### v2.0 — Mes 6-8
- [ ] OCR de facturas de luz/gas
- [ ] Sincronización GPS para transporte automático
- [ ] Módulo de compensación con proyectos certificados
- [ ] Componente social (retos grupales + compartir)

### v2.5 — Mes 9-12
- [ ] Panel admin (Angular) para configurar factores de emisión
- [ ] Integración con apps bancarias
- [ ] Versión empresarial / ESG para equipos
- [ ] Internacionalización (Latam primero, luego global)

---

## Métricas de Éxito

| Métrica | Objetivo (6 meses) |
|---------|-------------------|
| Tests completados | > 10,000 |
| Retención D30 | > 25% |
| Reducción promedio huella (usuarios activos) | > 8% |
| NPS | > 50 |
| Conversión a Premium (compensación) | > 5% |

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

## Síntesis de Inteligencias Artificiales

Este documento consolida las especificaciones generadas por **cuatro modelos de IA** consultados en la fase de ideación:

| Modelo | Aporte Principal |
|--------|----------------|
| **Claude (Anthropic)** | Metodología de cálculo por categoría, contexto colombiano, módulo de compensación con organizaciones certificadas, arquitectura Spring Boot + Flutter + Angular |
| **GitHub Copilot** | Gamificación con EcoPoints y niveles, OCR de facturas, integración con Google Maps y apps bancarias, modo offline, datos calibrados para Bogotá |
| **Google Gemini** | UX "Swipe & Tap", avatar/planeta interactivo con cambio de color, equivalencias emocionales de la vida real, "Monedero Verde", automatización pasiva por GPS |
| **Claude Sonnet** | Módulo de Agua como categoría adicional, límite de 7 min / 35 preguntas, estándares IPCC/EPA/GHG Protocol, badge system (🌿🟡🔴💀), privacy-first, stack técnico detallado |

---

## Contribuir

Este proyecto está en fase de especificación y desarrollo activo.

```bash
git clone https://github.com/yesithv/footcarbonprint-app.git
cd footcarbonprint-app
# Ver CONTRIBUTING.md para instrucciones de setup
```

---

<div align="center">

**Hecho con 🌱 para reducir la huella de carbono de Latinoamérica**

*FootCarbonPrint — Conoce tu Huella. Cambia tu Mundo.*

</div>
