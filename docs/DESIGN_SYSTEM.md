# 🎨 FootCarbonPrint — Design System & Guía de Estilo

> Documento maestro de diseño para entregar a herramientas de diseño (Figma, Sketch, Penpot, Adobe XD).
> Contiene paleta de color, tipografía, iconografía, medidas, componentes, movimiento y accesibilidad.
>
> **Versión:** 1.0 · **Fecha:** Agosto 2026 · **Plataforma:** Flutter (iOS · Android · Web) · **Material 3**

---

## 1. Fundamento del diseño — La "vibra" de la app

FootCarbonPrint no es un tracker frío de datos: es un **diagnóstico emocional, visual y no culpabilizador**. Toda la dirección de arte se apoya en cuatro pilares que deben sentirse en cada pantalla:

| Pilar | Traducción visual |
|-------|-------------------|
| **Esperanzador, no alarmista** | Verde vivo como color base; el rojo se reserva solo para estados críticos, nunca como fondo dominante. |
| **Claro y rápido (≤7 min)** | Jerarquía tipográfica fuerte, mucho espacio en blanco, un solo CTA por pantalla, cero formularios densos. |
| **Emocional y tangible** | Equivalencias visuales ("70 árboles"), avatar planeta que cambia de color, medallas, confeti al completar. |
| **Confiable y científico** | Números grandes y legibles, unidades consistentes (tCO₂e/año), fuentes citadas, estética limpia tipo "dashboard de salud". |

**Metáfora rectora:** *un chequeo médico del planeta.* Serio en el dato, cálido en el tono, accionable en el resultado.

### Referencias de dirección de arte
- Salud/bienestar cuantificado (anillos de actividad, gauges, tarjetas de métrica).
- Apps de sostenibilidad líderes: lenguaje de **verdes + tonos tierra + azules**, minimalismo y alto contraste.
- Tendencia **Sustainable UX 2025-2026**: paletas limitadas y de bajo consumo, dark mode real (ahorro en OLED), iconografía sobre texto, y menos ciclos de animación. *(ver §12, Fuentes)*

---

## 2. Paleta de color

La paleta parte de la identidad verde ya existente en la app y la **formaliza en roles semánticos** con valores validados para contraste WCAG. Todo color tiene su equivalente en **Light** y **Dark**.

### 2.1 Marca / Primarios (verde)

| Rol | Token | Light | Dark | Uso |
|-----|-------|-------|------|-----|
| Primario | `brand/primary` | `#1B5E20` | `#81C784` | CTAs, marca, elementos activos |
| Primario claro | `brand/primaryLight` | `#2E7D32` | `#66BB6A` | Hover/gradientes |
| Secundario | `brand/secondary` | `#66BB6A` | `#66BB6A` | Acentos, íconos de apoyo |
| Acento suave | `brand/accent` | `#A5D6A7` | `#2C3B2E` | Tracks de slider, fondos sutiles |

> **Gradiente de marca (splash, headers hero):** `#1B5E20 → #43A047` a 135°.

### 2.2 Neutros y superficies

| Rol | Token | Light | Dark |
|-----|-------|-------|------|
| Fondo app | `surface/background` | `#F1F8E9` | `#0F1511` |
| Superficie / Card | `surface/card` | `#FFFFFF` | `#1B231C` |
| Borde / divisor | `surface/border` | `#E0E7DA` | `#2C3B2E` |
| Texto primario | `text/primary` | `#1A1A1A` | `#E6EBE4` |
| Texto secundario | `text/secondary` | `#555555` | `#ADB6AC` |
| Texto hint/deshab. | `text/hint` | `#9E9E9E` | `#7F8A7F` |

> El fondo verde muy claro `#F1F8E9` (no blanco puro) refuerza la identidad eco sin cansar la vista. En dark, un verde-carbón `#0F1511` (no negro puro) mantiene calidez.

### 2.3 Escala de estado de huella (el corazón emocional) 🌍

Esta es la escala **más importante** del sistema: alimenta el **avatar-planeta**, la aguja del medidor (gauge), las medallas y las barras del dashboard. Va de verde vibrante (bien) a rojo crítico (mal).

| Estado | Rango (tCO₂/año) | Emoji | Token | Light | Dark |
|--------|------------------|-------|-------|-------|------|
| Campeón Verde | < 1.5 | 🌿 | `state/champion` | `#2E7D32` | `#81C784` |
| Consciente | 1.5 – 3 | 🌍 | `state/aware` | `#7CB342` | `#AED581` |
| En Camino | 3 – 5 | 🟡 | `state/onTrack` | `#F9A825` | `#FBC02D` |
| Alto Impacto | 5 – 8 | 🔴 | `state/high` | `#E65100` | `#FB8C00` |
| Crítico | > 8 | 💀 | `state/critical` | `#B71C1C` | `#EF5350` |

> **Regla de oro:** el rojo `state/critical` **jamás** se usa como fondo de pantalla completa ni como color de un botón primario. Solo tiñe el dato/avatar/aguja. El tono de la app siempre es de posibilidad, no de castigo.

### 2.4 Colores por categoría (los 6 módulos del test)

Cada módulo tiene un color propio, constante en todo el journey (ícono, header, barra del desglose, chip).

| Módulo | Emoji | Token | Light | Dark |
|--------|-------|-------|-------|------|
| 🚗 Transporte | 🚗 | `cat/transport` | `#1565C0` | `#64B5F6` |
| 🍔 Alimentación | 🍔 | `cat/food` | `#6A1B9A` | `#BA68C8` |
| 🏠 Hogar y Energía | 🏠 | `cat/home` | `#E65100` | `#FFA726` |
| 🛍️ Consumo | 🛍️ | `cat/shopping` | `#00695C` | `#4DB6AC` |
| ♻️ Residuos | ♻️ | `cat/waste` | `#4E342E` | `#A1887F` |
| 💧 Agua | 💧 | `cat/water` | `#0277BD` | `#4FC3F7` |

> Sobre cualquier relleno de categoría, el texto/ícono usa `onCategory`: **blanco `#FFFFFF`** en light, **verde-carbón `#0F1511`** en dark.

### 2.5 Colores semánticos (feedback)

| Rol | Light | Dark | Uso |
|-----|-------|------|-----|
| Éxito | `#2E7D32` | `#81C784` | Reto cumplido, ahorro, ✔ |
| Advertencia | `#F9A825` | `#FBC02D` | Alertas de tendencia |
| Error | `#B71C1C` | `#EF5350` | Validación de formularios |
| Info | `#0277BD` | `#4FC3F7` | Tooltips educativos "¿Por qué importa?" |

### 2.6 Contraste / Accesibilidad (WCAG 2.1)

- Texto primario sobre fondo: **≥ 7:1 (AAA)** en ambos modos.
- Texto sobre rellenos de categoría/estado: **≥ 4.5:1 (AA)** garantizado por el par `onCategory`.
- **Nunca** comunicar información solo por color: acompañar siempre con ícono, etiqueta o forma (crítico para daltonismo, ~8% de hombres). Ej: el estado de huella lleva emoji + texto + color.
- El verde falla en contraste más de lo esperado en texto pequeño: no usar `secondary`/`accent` como color de texto sobre fondos claros.

---

## 3. Tipografía

**Familia:** `Inter` (Google Fonts) — ya integrada. Geométrica, altamente legible en tamaños pequeños, excelente para números.
**Alternativa numérica (opcional):** tabular figures activadas en dashboards para que las cifras no "salten".

### Escala tipográfica

| Estilo | Tamaño | Peso | Line-height | Uso |
|--------|--------|------|-------------|-----|
| Display L | 32 | 800 (ExtraBold) | 1.15 | Cifra de huella total en resultados |
| Display M | 26 | 700 (Bold) | 1.2 | Títulos de pantalla / hero |
| Headline | 20 | 700 | 1.25 | Encabezados de sección |
| Title | 18 | 600 (SemiBold) | 1.3 | Títulos de card, AppBar |
| Body L | 16 | 400 (Regular) | 1.5 | Texto principal |
| Body M | 14 | 400 | 1.5 | Texto secundario, descripciones |
| Label | 13 | 600 | 1.2 | Chips, botones pequeños, badges |
| Caption | 12 | 500 (Medium) | 1.4 | Notas, unidades, fuentes citadas |

> **Cifra estrella (huella total):** se puede subir hasta **40–48 px / peso 800** en la pantalla de resultados, teñida con el color del `state/*` correspondiente. Es el momento "wow" del diagnóstico.

---

## 4. Espaciado, rejilla y radios

### Rejilla base — 8pt (con medio-paso de 4pt)

`4 · 8 · 12 · 16 · 20 · 24 · 32 · 40 · 48 · 64`

| Token | Valor | Uso |
|-------|-------|-----|
| `space/xs` | 4 | Gaps internos de chips |
| `space/sm` | 8 | Separación ícono-texto |
| `space/md` | 16 | **Padding estándar** de pantalla y cards |
| `space/lg` | 24 | Separación entre bloques |
| `space/xl` | 32 | Aire alrededor de la cifra hero |

- **Margen de pantalla:** 16 px a cada lado (20 px en tablets).
- **Separación vertical entre cards:** 12–16 px.

### Radios de esquina

| Token | Valor | Uso |
|-------|-------|-----|
| `radius/sm` | 12 | Inputs, chips, diálogos internos |
| `radius/md` | 16 | **Botones**, sliders |
| `radius/lg` | 20 | **Cards**, diálogos, bottom sheets |
| `radius/xl` | 28 | Contenedores hero, gauge |
| `radius/full` | 999 | Avatares, badges circulares, FAB |

### Elevación / Sombras
Diseño **flat con sombras muy suaves** (Material 3, elevación 0 en cards). Cuando se necesite profundidad:
- `shadow/soft`: `y+4, blur 16, color primary @ 8% opacidad`.
- En dark mode se sustituye sombra por borde `surface/border` de 1 px.

---

## 5. Iconografía

| Aspecto | Especificación |
|---------|----------------|
| **Set del sistema** | Material Symbols **Rounded** (coherente con `Icons.*_rounded` ya usados). Trazo redondeado = tono amable. |
| **Grosor** | Weight 400, grade 0, optical size 24. |
| **Tamaños** | 20 (inline), 24 (estándar), 28 (nav bar), 40–48 (hero de módulo). |
| **Color** | Heredan color de categoría o `text/primary`; sobre relleno usan `onCategory`. |
| **Emojis** | Se usan **intencionalmente** para la capa emocional y equivalencias (🌲💡📱🌍💀🌿). No mezclar emoji con ícono de línea en el mismo componente salvo en medallas. |
| **Ilustración** | Estilo flat, esquinas redondeadas, paleta de marca. El **avatar-planeta** es la ilustración clave: una Tierra estilizada cuyo color se interpola en vivo por la escala `state/*` (§2.3). |

**Íconos por módulo (sugeridos):** transporte `directions_car_rounded` · alimentación `restaurant_rounded` · hogar `home_rounded` · consumo `shopping_bag_rounded` · residuos `recycling_rounded` · agua `water_drop_rounded`.

**App icon / logo:** huella (footprint) formada por una hoja, sobre fondo con gradiente de marca. Versión monocroma para adaptive icon Android y tinted icon iOS.

---

## 6. Componentes clave (specs para el diseñador)

### 6.1 Botón primario
- Alto **52 px**, ancho completo, `radius/md` (16).
- Fondo `brand/primary`, texto `onPrimary` (blanco light / `#0C3A10` dark), Label 16/600.
- Estados: hover/pressed −8% luminosidad · disabled `text/hint` @ 40%.

### 6.2 Botón secundario / texto
- Outline 1.5 px `brand/primary`, fondo transparente, mismo alto y radio.

### 6.3 Card
- Fondo `surface/card`, `radius/lg` (20), padding 16, elevación 0 + `shadow/soft` opcional.
- En dark: borde 1 px `surface/border`.

### 6.4 Question Card (Auto-Test "Swipe & Tap")
- Card grande centrada; pregunta en Title 18/600; tooltip "¿Por qué importa?" como `info` chip.
- Inputs visuales: **selector de íconos**, **slider**, **contador ± **. Cero campos de texto libre.
- Indicador de progreso del módulo arriba (barra `brand/primary`, `radius/full`, alto 6 px).

### 6.5 Slider
- Track activo `brand/primary` / track inactivo `brand/accent`, thumb `brand/primary` con halo @ 12%.
- Alto de track 6 px, thumb 24 px, `radius/full`.

### 6.6 Chip / Selector
- Alto 36 px, `radius/full`, padding horizontal 16, Label 13/600.
- No seleccionado: fondo `surface/card`, borde `surface/border`. Seleccionado: fondo color de categoría, texto `onCategory`.

### 6.7 Header de módulo (SliverAppBar)
- Alto expandido **140 px**, fondo = color de la categoría, ícono 40 + título 18/700 + peso ("28–35% de tu huella") en `onCategory`.

### 6.8 Medidor / Gauge de resultados
- Arco semicircular o anillo, grosor 20–24 px, `radius/full` en las puntas.
- Relleno interpolado por la escala `state/*`. Aguja/etiqueta con la cifra hero (40–48/800) al centro.
- Debajo: comparativas contextuales (tú vs. país vs. mundo vs. meta París) como barras horizontales con flechas ↑/↓.

### 6.9 Barra de desglose por categoría
- Barras horizontales apiladas o lista con % + valor; cada segmento en su `cat/*`. Leyenda con emoji + nombre + tCO₂ + %.

### 6.10 Medalla / Badge
- Círculo `radius/full`, fondo tenue del `state/*` (@15%), emoji al centro (🌿🌍🟡🔴💀), aro del color del estado.
- Tamaños: 48 (lista), 96 (perfil), 120 (celebración con confeti).

### 6.11 Card de acción (Plan de Acción)
- Icono de categoría + título + tags: **reducción** (chip verde, ej. "−1.5 tCO₂"), **dificultad** (Baja/Media/Alta como puntos o pill).
- CTA "Me comprometo" (botón secundario) → al cumplir, transición a estado éxito + confeti.

### 6.12 Bottom Navigation (Main Shell)
- 4–5 tabs, íconos rounded 28, activo `brand/primary` + label, inactivo `text/hint`. Fondo `surface/card`, borde superior `surface/border`.

### 6.13 Tooltip educativo
- Fondo `info` @12%, borde `info`, ícono 💡/`lightbulb_rounded`, texto Body M. Título "¿Por qué importa?".

---

## 7. Movimiento y microinteracciones

| Interacción | Especificación |
|-------------|----------------|
| **Duración base** | 200–300 ms, curva `easeOutCubic`. |
| **Avatar-planeta** | Interpola color 800 ms `easeInOut` cuando cambia el resultado — es la reacción "viva". |
| **Gauge/aguja** | Anima de 0 al valor final ~1200 ms `easeOutBack` al revelar resultados (momento wow). |
| **Reto cumplido** | Confeti (paquete `confetti`) + la aguja baja en vivo + contador de ahorro sube. |
| **Transiciones de página** | Slide+fade suave; nunca más de 300 ms para no penalizar el "≤7 min". |
| **Sostenibilidad** | Animaciones intencionales y breves: menos ciclos = menos consumo (Sustainable UX). Sin loops infinitos decorativos. |

---

## 8. Modo oscuro

Dark mode es **de primera clase**, no un afterthought (ahorra energía en OLED y es tendencia clave):
- Fondos verde-carbón, no negro puro; primarios se **aclaran** (`#81C784`) para mantener contraste sobre oscuro.
- Sobre rellenos de color, el texto pasa a `onCategory` oscuro (`#0F1511`).
- Sustituir sombras por bordes sutiles.
- Verificar que los `state/*` y `cat/*` de dark mantengan ≥ 4.5:1.

---

## 9. Localización y contenido

- **Idiomas:** ES (principal), EN, PT, DE. Diseñar con **+30% de holgura** en textos (el alemán y el portugués expanden).
- **Unidades:** siempre `tCO₂e/año` (2 decimales) para totales; `kgCO₂` para acciones. Separador decimal según locale (`intl`).
- **Tono de voz:** posibilidad, no culpa. "Puedes reducir…", nunca "Estás destruyendo…".
- **País:** el selector afecta datos (factor de red), no el diseño; mantener neutralidad cultural en ilustración.

---

## 10. Checklist de entrega a la herramienta de diseño

Para reconstruir el sistema en Figma/Penpot:

- [ ] Crear **estilos de color** con los tokens de §2 (Light + Dark como modos/variables).
- [ ] Crear **estilos de texto** con la escala de §3 (Inter).
- [ ] Definir **variables de espaciado y radio** (§4).
- [ ] Componentizar: Botón, Card, Chip, Slider, Question Card, Gauge, Medalla, Nav, Tooltip (§6) con sus variantes/estados.
- [ ] Armar la **escala de estado de huella** como set de 5 variantes reutilizables (§2.3).
- [ ] Diseñar el **avatar-planeta** con 5 estados de color.
- [ ] Set de **íconos** Material Symbols Rounded + librería de emojis de equivalencia.
- [ ] Duplicar cada pantalla en **Light y Dark**.
- [ ] Validar contraste con plugin WCAG antes de exportar.

---

## 11. Tabla resumen de tokens (copiar/pegar)

```
// MARCA
brand/primary        #1B5E20  (dark #81C784)
brand/primaryLight   #2E7D32  (dark #66BB6A)
brand/secondary      #66BB6A  (dark #66BB6A)
brand/accent         #A5D6A7  (dark #2C3B2E)

// SUPERFICIES
surface/background   #F1F8E9  (dark #0F1511)
surface/card         #FFFFFF  (dark #1B231C)
surface/border       #E0E7DA  (dark #2C3B2E)
text/primary         #1A1A1A  (dark #E6EBE4)
text/secondary       #555555  (dark #ADB6AC)
text/hint            #9E9E9E  (dark #7F8A7F)

// ESTADO DE HUELLA
state/champion       #2E7D32  (dark #81C784)   🌿 <1.5t
state/aware          #7CB342  (dark #AED581)   🌍 1.5–3t
state/onTrack        #F9A825  (dark #FBC02D)   🟡 3–5t
state/high           #E65100  (dark #FB8C00)   🔴 5–8t
state/critical       #B71C1C  (dark #EF5350)   💀 >8t

// CATEGORÍAS
cat/transport        #1565C0  (dark #64B5F6)   🚗
cat/food             #6A1B9A  (dark #BA68C8)   🍔
cat/home             #E65100  (dark #FFA726)   🏠
cat/shopping         #00695C  (dark #4DB6AC)   🛍️
cat/waste            #4E342E  (dark #A1887F)   ♻️
cat/water            #0277BD  (dark #4FC3F7)   💧
onCategory           #FFFFFF  (dark #0F1511)

// SEMÁNTICOS
success #2E7D32 · warning #F9A825 · error #B71C1C · info #0277BD

// TIPOGRAFÍA: Inter — 800/700/600/500/400
// ESPACIADO: 4·8·12·16·20·24·32·40·48·64 (base 8pt)
// RADIOS: 12 / 16 / 20 / 28 / full
```

---

## 12. Fuentes e investigación UX/UI

Recomendaciones fundamentadas en investigación de diseño sostenible 2025–2026:

- [Green Pixels: Sustainable Visual Design Practices for UI/UX — Medium](https://medium.com/@willbdesign/green-pixels-sustainable-visual-design-practices-for-ui-ux-83e02a8bcf38)
- [Sustainable UX Trends 2025 — NetBramha Studios](https://netbramha.com/blogs/sustainable-ux-trends-2025/)
- [Sustainability in UI Design: Green Digital Experiences 2025 — UX Planet](https://uxplanet.org/sustainability-in-ui-design-0c643965c100)
- [Top Design Trends Shaping Green Tech & Clean Energy Apps — Beetroot](https://beetroot.co/greentech/top-design-trends-shaping-green-tech-and-clean-energy-mobile-apps/)
- [Top 10 Green Apps with Exceptional UX (2026) — Wavespace](https://www.wavespace.agency/blog/green-app-ux)
- [Mobile App Color Schemes: What Works in 2026 — GenDesigns](https://gendesigns.ai/blog/mobile-app-color-schemes-2026)
- [Sustainable UI/UX Design Best Practices — Extentia](https://www.extentia.com/sustainable-ui-ux-design-best-practices-future-trends-examples-and-insights/)

**Principios extraídos y aplicados:** paleta limitada y de bajo consumo · verdes + tonos tierra + azules para conexión ambiental · alto contraste (mejora legibilidad ~40%) · verde falla contraste en texto → validar WCAG · íconos sobre texto para velocidad · dark mode real por ahorro OLED · animaciones breves e intencionales · nunca comunicar solo por color.

---

<div align="center">

**FootCarbonPrint — Design System v1.0**
*Conoce tu Huella. Cambia tu Mundo.* 🌱

</div>
