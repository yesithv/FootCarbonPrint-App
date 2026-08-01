# FootCarbonPrint — Guía de Publicación en Google Play

> **Propósito de este documento.** Reúne, en un solo lugar, **todo lo que Google Play
> exige** para publicar FootCarbonPrint y **todos los datos reales de la app** (extraídos
> del código) necesarios para cumplir cada requisito.
>
> **Para el chat/lector que genere las páginas legales:** las secciones marcadas con
> 🌐 **"PÁGINA A PUBLICAR"** describen, con contenido listo para usar, las páginas web
> que Google Play exige que existan (sobre todo la **Política de Privacidad**). Puedes
> tomar el contenido de la sección 4 y convertirlo en HTML/Markdown publicable. Los
> valores que el propietario debe rellenar están marcados como `«PLACEHOLDER»`.

- **Última revisión de requisitos:** agosto 2026 (verificar siempre contra la ayuda oficial de Play Console, enlazada al final).
- **Estado de la app:** MVP v1.0 (ver `README.md` y `docs/FUNCTIONAL_SPECIFICATION.md`).

---

## 0. Placeholders que el propietario debe definir

Antes de publicar, hay que fijar estos valores. Aparecen referenciados en todo el documento.

| Placeholder | Descripción | Valor sugerido / actual |
|---|---|---|
| `«CONTACT_EMAIL»` | Correo de soporte público (obligatorio en la ficha) | p. ej. `yesithvalencia@gmail.com` |
| `«DEVELOPER_NAME»` | Nombre del desarrollador/editor en Play | p. ej. "Yesith Valencia" |
| `«PRIVACY_URL»` | URL pública de la Política de Privacidad | p. ej. `https://yesithv.github.io/FootCarbonPrint-App/privacy.html` |
| `«TERMS_URL»` | URL de Términos (opcional) | p. ej. `https://yesithv.github.io/FootCarbonPrint-App/terms.html` |
| `«EFFECTIVE_DATE»` | Fecha de entrada en vigor de las páginas legales | fecha de publicación |
| `«APP_ID»` | Application ID en Play | actual: `com.footcarbonprint.foot_carbon_print` |

> **Hosting recomendado:** la app ya se despliega en GitHub Pages
> (`.github/workflows/flutter-web-deploy.yml` → `https://yesithv.github.io/FootCarbonPrint-App/`).
> Las páginas legales pueden publicarse como HTML estático en ese mismo sitio, de modo
> que `«PRIVACY_URL»` sea pública, estable y **no editable por los usuarios** (requisito de Google).

---

## 1. Radiografía de la app (hechos reales, extraídos del código)

Estos hechos son la base para responder el formulario de **Data safety**, la clasificación
de contenido y la Política de Privacidad. **Son verificables en el repositorio.**

| Aspecto | Realidad en el código | Fuente |
|---|---|---|
| Tipo | App Flutter; hoy desplegada como **web**; el proyecto Android está andamiado | `pubspec.yaml`, `android/` |
| Application ID | `com.footcarbonprint.foot_carbon_print` | `android/app/build.gradle.kts` |
| Cuentas / login | **No existen.** No hay registro, autenticación ni perfiles en la nube | Todo el código; no hay Firebase/Auth |
| Backend / red | **Ninguno.** La app funciona 100% offline | No hay llamadas HTTP a APIs propias |
| Almacenamiento de datos | **Solo local**, en el dispositivo, vía `SharedPreferences` | `lib/providers/*` |
| Datos que guarda (locales) | Respuestas del test, huella calculada, historial, compromisos, retos, **nombre** (opcional), tema, idioma | `lib/models/carbon_footprint.dart`, providers |
| Foto | El usuario **puede** elegir una foto para su "Eco Card" vía `image_picker`; **se queda local** y solo se incrusta si el usuario exporta/comparte la tarjeta | `lib/screens/profile_card/profile_card_screen.dart` |
| Compartir | Solo cuando el usuario lo inicia: comparte **texto/imagen** por la hoja nativa/web | `results_screen.dart`, `web_share.dart` |
| Enlaces externos | Abre webs de compensación (Gold Standard, Pachama, atmosfair) en el navegador | `dashboard_screen.dart` |
| Publicidad | **No hay anuncios** ni SDKs de ads | No hay dependencias de ads |
| Analytics / tracking | **Ninguno.** Sin Mixpanel/Amplitude/Firebase Analytics | Sin dependencias de analítica |
| Permisos Android declarados | Solo los del andamiaje Flutter (no hay cámara/ubicación/contactos propios) | `AndroidManifest.xml` |
| Público / niños | App educativa, apta para público general; **no dirigida a niños** | Diseño del producto |

> **Conclusión clave para Data Safety:** la app **no recolecta ni comparte datos del usuario
> con el desarrollador ni con terceros**; todos los datos son locales al dispositivo. Esto
> hace que las respuestas del formulario sean, en su mayoría, "**No se recopilan datos**".

---

## 2. Requisitos de Google Play aplicables — Checklist maestro

### 2.1 🌐 Páginas / URLs que deben existir (las genera el chat legal)

| # | Requisito | ¿Obligatorio aquí? | Detalle |
|---|---|---|---|
| P1 | **Política de Privacidad** (URL pública + idealmente enlace in-app) | **SÍ (obligatorio para todas las apps)** | Contenido listo en §4.1. Debe coincidir con Data Safety |
| P2 | **Términos de Servicio / EULA** | Opcional (recomendado) | Contenido base en §4.2 |
| P3 | **Página de soporte / contacto** | El **correo** es obligatorio en la ficha; la página es opcional | Puede ser una sección de la web o un `mailto:` |
| P4 | **URL de borrado de cuenta y datos** | **NO aplica** (la app no crea cuentas) | Ver §3.3 — se responde el formulario, pero no se exige URL de borrado |

### 2.2 Configuración en Play Console (la hace el propietario con los datos de §3–§5)

- [ ] **Ficha de tienda (Store listing):** nombre, descripción corta, descripción larga, icono, gráfico destacado, capturas → copy listo en §5.
- [ ] **Sección Data safety** (Política > Contenido de la app) → respuestas listas en §3.2.
- [ ] **Preguntas de Borrado de datos** dentro de Data safety → §3.3.
- [ ] **Clasificación de contenido** (cuestionario IARC) → orientación en §3.4.
- [ ] **Público objetivo y contenido** (edad) → no dirigida a niños; §3.5.
- [ ] **Declaración de anuncios:** "La app **no** contiene anuncios".
- [ ] **Categoría de la app** y datos de contacto (`«CONTACT_EMAIL»`).

### 2.3 Requisitos técnicos de compilación (cambios en el repo, tareas futuras)

- [ ] **Formato Android App Bundle (`.aab`)** — obligatorio. `flutter build appbundle --release`.
- [ ] **Firma de release real** — hoy el release usa **la clave de depuración** (`android/app/build.gradle.kts`: *"Signing with the debug keys for now"*). Hay que crear una **upload key** y activar **Play App Signing**. **Bloqueante: no se puede publicar firmado con debug.**
- [ ] **Nivel de API objetivo (targetSdk)** — apps nuevas deben apuntar al nivel exigido vigente (**Android 16 / API 36** según la política 2025; verificar el número actual en la ayuda oficial). Hoy usa `flutter.targetSdkVersion`; fijar/actualizar según toque.
- [ ] **Nombre visible de la app** — `android:label` es hoy `"foot_carbon_print"`; cambiarlo a **"FootCarbonPrint"**.
- [ ] **Versionado** — `versionCode`/`versionName` (hoy `1.0.0+1` vía `pubspec.yaml`). Subir `versionCode` en cada envío.
- [ ] **Assets gráficos** — icono hi-res 512×512, gráfico destacado 1024×500 y capturas (§5.4).
- [ ] *(Recomendado)* **Botón "Borrar todos mis datos"** en Ajustes — el provider ya tiene `resetAll()` sin UI (`FR-14.6`); cablearlo refuerza el cumplimiento de borrado de datos y da un enlace in-app claro.

### 2.4 Requisitos de cuenta y proceso

- [ ] **Cuenta de desarrollador de Google Play** (pago único de 25 USD).
- [ ] **Testing cerrado previo** — las cuentas **personales** creadas después del 13-nov-2023 deben hacer *closed testing* con **mínimo 12 testers opt-in durante 14 días continuos** antes de solicitar acceso a producción (antes eran 20; se redujo a 12 el 11-dic-2024). *(No aplica a cuentas de organización/empresa.)*
- [ ] La info de **Data safety** debe **coincidir** con la Política de Privacidad (Google lo verifica).

---

## 3. Datos listos para el Play Console

### 3.1 Identidad de la app

| Campo | Valor |
|---|---|
| Nombre de la app | **FootCarbonPrint** |
| Application ID | `com.footcarbonprint.foot_carbon_print` |
| Categoría sugerida | **Estilo de vida** (alt.: Educación) |
| Etiquetas | huella de carbono, sostenibilidad, medio ambiente, CO₂ |
| Correo de contacto | `«CONTACT_EMAIL»` |
| Sitio web | `https://yesithv.github.io/FootCarbonPrint-App/` |
| Política de Privacidad | `«PRIVACY_URL»` |

### 3.2 Formulario **Data Safety** — respuestas propuestas

> Basadas en §1. Justificación: la app es local/offline y no envía datos al desarrollador
> ni a terceros.

**¿Tu app recopila o comparte alguno de los tipos de datos de usuario requeridos?**
→ **NO se recopilan datos** y **NO se comparten datos.**

Razonamiento a documentar (por si Google pregunta):
- Todo lo que el usuario introduce (respuestas del test, nombre, foto opcional) **se guarda
  únicamente en el dispositivo** (`SharedPreferences` / almacenamiento local).
- **No hay transmisión** de esos datos a servidores del desarrollador ni a terceros.
- La **foto** de la Eco Card se procesa en local y solo aparece si el **usuario** decide
  exportar/compartir la tarjeta (acción iniciada por el usuario = no cuenta como "recopilación"
  por parte de la app).
- **Compartir** (texto/imagen) es siempre una acción explícita del usuario a través de la
  hoja de compartir del sistema.
- **Sin anuncios, sin analítica, sin identificadores de seguimiento.**

**Prácticas de seguridad:**
- ¿Datos cifrados en tránsito? → **N/A** (no hay tránsito de datos).
- ¿El usuario puede pedir que se borren sus datos? → **Sí** (ver §3.3).

> ⚠️ Si en el futuro se añaden analítica, anuncios, cuentas o backend (ver roadmap v2.0+ del
> README), **estas respuestas cambian** y hay que actualizar Data Safety y la Política de Privacidad.

### 3.3 Preguntas de **Borrado de datos**

- La app **no permite crear cuentas**, por lo que **no se exige** una URL web de borrado de cuenta.
- Aun así, hay que responder el bloque de borrado de datos. Mensaje a comunicar:
  - Los datos son **locales**. El usuario puede **desinstalar la app** para eliminar todos sus datos.
  - *(Recomendado)* Si se cablea el botón "Borrar todos mis datos" (`resetAll()`), indicarlo como
    **ruta in-app de borrado**.

### 3.4 Clasificación de contenido (cuestionario IARC)

- Sin violencia, sexo, lenguaje soez, drogas, apuestas ni contenido de usuario compartido dentro de la app.
- Sin compras dentro de la app. Sin anuncios.
- Resultado esperado: apta para **todo público** (Everyone / 3+ / PEGI 3). Responder el cuestionario con sinceridad según estos hechos.

### 3.5 Público objetivo y contenido

- Público objetivo: **13+ / adultos y adolescentes** (no dirigida a niños).
- No seleccionar grupos de edad infantiles → evita la política **Families**.
- Declarar que **no** está diseñada principalmente para menores.

---

## 4. 🌐 PÁGINAS A PUBLICAR — contenido listo

> El chat legal debe convertir esto en páginas web publicables (HTML o Markdown) en `«PRIVACY_URL»`
> y, opcionalmente, `«TERMS_URL»`. **No inventar prácticas de datos**: el contenido debe reflejar
> exactamente §1 (app local/offline sin recolección). Se ofrece en **Español e Inglés** porque la
> app soporta ambos (y 3 idiomas más); pueden publicarse versiones por idioma o una bilingüe.

### 4.1 PÁGINA A PUBLICAR — Política de Privacidad

**Datos obligatorios que debe contener** (Google exige que la política sea completa y coincida con Data Safety):

1. Nombre de la app y del responsable (`«DEVELOPER_NAME»`) y `«CONTACT_EMAIL»`.
2. Fecha de entrada en vigor (`«EFFECTIVE_DATE»`).
3. Qué datos se recopilan → **ninguno se envía fuera del dispositivo**; enumerar los datos
   locales (respuestas del test, huella, historial, compromisos, retos, nombre opcional, tema,
   idioma, foto opcional de la Eco Card).
4. Cómo se usan → solo para calcular y mostrar la huella y personalizar la experiencia, **en el dispositivo**.
5. Con quién se comparten → **con nadie**; solo el usuario puede compartir manualmente su resultado.
6. Terceros → **no hay** analítica, anuncios ni SDKs de seguimiento. Enlaces externos de
   compensación abren sitios de terceros con sus propias políticas.
7. Almacenamiento y seguridad → datos locales (`SharedPreferences`); se eliminan al desinstalar.
8. Derechos del usuario y borrado → desinstalar la app elimina todo; *(si se implementa)* botón "Borrar mis datos".
9. Menores → no dirigida a niños; no se recopilan datos de menores conscientemente.
10. Cambios en la política y cómo se notifican.

**Borrador en Español (base editable):**

```
Política de Privacidad de FootCarbonPrint
Última actualización: «EFFECTIVE_DATE»

FootCarbonPrint («la App»), desarrollada por «DEVELOPER_NAME», respeta tu privacidad.
Esta política explica cómo se manejan tus datos.

1. No recopilamos tus datos.
La App funciona completamente sin conexión y no requiere cuenta. Toda la información que
introduces (tus respuestas del test, tu huella calculada, tu historial, tus
compromisos y retos, tu nombre si lo indicas, tu tema e idioma, y una foto
opcional para tu "Eco Card") se guarda ÚNICAMENTE en tu dispositivo. No se envía
a nuestros servidores ni a terceros. No tenemos servidores que reciban tus datos.

2. Cómo se usa la información.
Los datos locales se usan solo para calcular y mostrar tu huella de carbono y
personalizar tu experiencia dentro de la App, en tu propio dispositivo.

3. Compartir es decisión tuya.
La App solo comparte contenido (un texto o una imagen con tu resultado) cuando TÚ
lo inicias mediante la función de compartir de tu dispositivo. La foto de la Eco
Card se procesa localmente y solo aparece en la imagen que tú decides exportar.

4. Sin publicidad ni rastreo.
No mostramos anuncios y no usamos herramientas de analítica o seguimiento.

5. Enlaces a terceros.
La App puede enlazar a plataformas externas de compensación de carbono (por
ejemplo Gold Standard, Pachama, atmosfair). Esos sitios tienen sus propias
políticas de privacidad; no somos responsables de ellas.

6. Almacenamiento y borrado.
Tus datos permanecen en el almacenamiento local de tu dispositivo. Puedes
eliminarlos por completo desinstalando la App. [Si aplica: también puedes usar la
opción "Borrar todos mis datos" dentro de Ajustes.]

7. Menores de edad.
La App no está dirigida a niños y no recopilamos conscientemente datos de menores.

8. Cambios.
Podemos actualizar esta política; publicaremos la nueva versión en esta página con
su fecha de actualización.

9. Contacto.
Para cualquier duda sobre privacidad: «CONTACT_EMAIL».
```

**Borrador en Inglés (base editable):**

```
FootCarbonPrint Privacy Policy
Last updated: «EFFECTIVE_DATE»

FootCarbonPrint ("the App"), developed by «DEVELOPER_NAME», respects your privacy.
This policy explains how your data is handled.

1. We do not collect your data.
The App works fully offline and requires no account. Everything you enter (your
test answers, your calculated footprint, your history, your commitments and
challenges, your name if you provide it, your theme and language, and an optional
photo for your "Eco Card") is stored ONLY on your device. It is never sent to our
servers or to third parties. We operate no servers that receive your data.

2. How information is used.
Local data is used only to compute and display your carbon footprint and to
personalize your experience within the App, on your own device.

3. Sharing is your choice.
The App shares content (a text or an image of your result) only when YOU initiate
it through your device's share feature. The Eco Card photo is processed locally
and only appears in the image you choose to export.

4. No ads, no tracking.
We show no advertising and use no analytics or tracking tools.

5. Third-party links.
The App may link to external carbon-offset platforms (e.g., Gold Standard,
Pachama, atmosfair). Those sites have their own privacy policies; we are not
responsible for them.

6. Storage and deletion.
Your data stays in your device's local storage. You can remove it entirely by
uninstalling the App. [If applicable: you can also use "Delete all my data" in
Settings.]

7. Children.
The App is not directed to children, and we do not knowingly collect data from minors.

8. Changes.
We may update this policy; the new version will be posted on this page with its
update date.

9. Contact.
For any privacy questions: «CONTACT_EMAIL».
```

### 4.2 PÁGINA A PUBLICAR (opcional) — Términos de Servicio / EULA

Base mínima a incluir: uso permitido de la app; la App se ofrece "tal cual", sin garantías;
los cálculos de huella son **estimaciones educativas** basadas en factores promedio y no
constituyen asesoría oficial; limitación de responsabilidad; propiedad intelectual; ley
aplicable (`«PLACEHOLDER: jurisdicción»`); contacto `«CONTACT_EMAIL»`.

---

## 5. Copy listo para la ficha de Google Play

### 5.1 Nombre y descripciones (Español)

- **Nombre de la app** (máx. 30 caracteres): `FootCarbonPrint` *(15)*
- **Descripción corta** (máx. 80): `Mide tu huella de carbono y actúa. Test rápido, privado y sin conexión.` *(69)*
- **Descripción completa** (máx. 4000):

```
Conoce tu huella de carbono en minutos y descubre exactamente qué puedes hacer para
reducirla. FootCarbonPrint convierte tus hábitos cotidianos en un diagnóstico claro,
visual y personalizado — sin culpa, con posibilidades.

🌍 100% privado y sin conexión
No necesitas cuenta ni registro. Todos tus datos se quedan en tu dispositivo.

📋 Test visual de 6 áreas
Transporte, Alimentación, Hogar y Energía, Consumo, Residuos y Agua. Solo deslizas y
tocas — sin formularios aburridos — y ves tu estimación de CO₂ actualizarse en vivo.

⚙️ Cálculo con base científica
Motor basado en estándares internacionales (IPCC, EPA, GHG Protocol) con factor de red
eléctrica ajustable por país (Colombia, EE.UU., México, Brasil, España, Alemania,
Argentina, Chile, Perú y promedio mundial).

📊 Resultados que se entienden
Tu huella traducida a equivalencias reales (árboles, bombillas, cargas de móvil),
comparativa con la meta de París y los promedios de tu país y del mundo, y un historial
para seguir tu progreso.

💡 Plan de acción personalizado
Acciones calculadas a partir de tus propios datos y ordenadas por impacto real, con el
ahorro estimado de cada una.

🎮 Gamificación y aprendizaje
Gana EcoPoints, sube de nivel, desbloquea insignias, completa retos semanales y aprende
con una guía interactiva.

🌳 Calculadora de compensación
Estima cuántos árboles y qué costo tendría neutralizar tu huella, con enlaces a
plataformas certificadas.

Idiomas: Español, Inglés, Francés, Portugués y Alemán.

FootCarbonPrint — Conoce tu Huella. Cambia tu Mundo.
```

### 5.2 Nombre y descripciones (Inglés)

- **App name:** `FootCarbonPrint`
- **Short description** (máx. 80): `Measure your carbon footprint and act. Fast, private and fully offline.` *(70)*
- **Full description:** *(traducir el bloque anterior; mismos hechos)*.

### 5.3 Notas de la versión (release notes) — v1.0.0

```
ES: Primer lanzamiento. Test de 6 áreas, resultados visuales, plan de acción
personalizado, gamificación, guía educativa, calculadora de compensación y 5 idiomas.
Todo privado y sin conexión.

EN: First release. 6-area test, visual results, personalized action plan,
gamification, learning guide, offset calculator and 5 languages. Fully private and offline.
```

### 5.4 Assets gráficos requeridos

| Asset | Especificación | Estado |
|---|---|---|
| Icono hi-res | 512×512 PNG 32-bit | Existe base de marca (hoja verde); generar el 512×512 |
| Gráfico destacado | 1024×500 PNG/JPG | Por crear |
| Capturas de teléfono | mín. 2 (recomendado 4–8), PNG/JPG, 16:9 o 9:16 | Por capturar (usar Home, Test, Resultados, Dashboard, Plan) |
| *(Opcional)* Captura de tablet / video | según formato | Opcional |

> El sistema de diseño (colores, tipografía, marca) está en `docs/DESIGN_SYSTEM.md` para
> mantener los assets coherentes.

---

## 6. Orden de trabajo sugerido

1. Definir los `«PLACEHOLDERS»` de §0 (correo, URLs, fecha, nombre del desarrollador).
2. **Generar y publicar** la Política de Privacidad (§4.1) en `«PRIVACY_URL»` — *tarea del chat legal*.
3. *(Opcional)* Publicar Términos (§4.2) y página de soporte.
4. Preparar los assets gráficos (§5.4).
5. Resolver los bloqueantes técnicos (§2.3): renombrar `android:label`, firma de release + Play App Signing, targetSdk, `.aab`.
6. *(Recomendado)* Cablear el botón "Borrar todos mis datos" en Ajustes.
7. Crear la ficha en Play Console con el copy de §5 y las respuestas de §3.
8. Completar Data Safety (§3.2/§3.3), clasificación (§3.4) y público (§3.5) — deben **coincidir** con la Política de Privacidad.
9. Ejecutar el **testing cerrado** (12 testers · 14 días) si la cuenta es personal (§2.4).
10. Enviar a revisión y producción.

---

## 7. Referencias oficiales de Google Play

- Política de privacidad y datos de usuario: https://support.google.com/googleplay/android-developer/answer/10144311
- Sección Data safety (cómo completarla): https://support.google.com/googleplay/android-developer/answer/10787469
- Requisitos de borrado de cuenta/datos: https://support.google.com/googleplay/android-developer/answer/13327111
- Requisitos de nivel de API objetivo: https://support.google.com/googleplay/android-developer/answer/11926878
- Firma de apps (Play App Signing): https://support.google.com/googleplay/android-developer/answer/9842756
- Testing cerrado / acceso a producción (cuentas personales): consulta la Community Guide de Play Console sobre el requisito de testers.

> Verifica siempre los números concretos (nivel de API, nº de testers) en la ayuda oficial,
> ya que Google los actualiza periódicamente.
