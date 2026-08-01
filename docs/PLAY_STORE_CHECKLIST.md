# Checklist de publicación en Google Play — FootCarbonPrint

Guía accionable para llevar la app a producción. Los ítems de **código** ya están
resueltos en el repositorio; los de **Play Console** los completas tú desde
[play.google.com/console](https://play.google.com/console).

---

## 1. Preparación técnica (repositorio) — ✅ resuelto en código

- [x] **Firma de release**: `android/app/build.gradle.kts` lee de `android/key.properties`.
- [x] **Nombre visible**: `FootCarbonPrint` en el `AndroidManifest.xml`.
- [x] **Target API 35** (Android 15), requisito de Play para apps nuevas.
- [x] **Advertising ID (AD_ID)** removido del manifest (la app no tiene anuncios).
- [x] **Minificación R8 + ProGuard** activadas en release.

### Pasos que debes ejecutar tú (requieren tu keystore)

1. Genera tu keystore de subida (guárdalo seguro, **no lo subas a git**):
   ```bash
   keytool -genkey -v -keystore ~/footcarbonprint-upload.jks \
     -keyalg RSA -keysize 2048 -validity 10000 -alias upload
   ```
2. Crea `android/key.properties` a partir de `android/key.properties.example`.
3. Genera el App Bundle firmado:
   ```bash
   flutter build appbundle --release
   ```
   Salida: `build/app/outputs/bundle/release/app-release.aab`.

> ⚠️ **Ícono de la app (pendiente de arte):** actualmente usa el ícono por defecto
> de Flutter. Aporta un PNG cuadrado (≥1024×1024) y se puede generar con el paquete
> `flutter_launcher_icons` (añadir a `pubspec.yaml` cuando exista el arte).

---

## 2. Cuenta de desarrollador

- [ ] Crear cuenta en Google Play Console (**pago único de $25 USD**).
- [ ] Completar la **verificación de identidad** (documento + dirección). Para
      cuentas personales nuevas puede tardar varios días.

---

## 3. Requisitos obligatorios de la app

- [ ] **Política de privacidad (URL pública)**: publica `docs/PRIVACY_POLICY.md`
      (p. ej. GitHub Pages) y pega la URL en Play Console → *Política de privacidad*.
- [ ] **Formulario de Seguridad de los datos (Data safety)** — respuestas sugeridas:
  - ¿Tu app recopila o comparte datos de usuario? → **No** (todo se procesa en el
    dispositivo y no se transmite).
  - Tipos de datos: foto y nombre se manejan **solo localmente** → no cuentan como
    "recopilados" según la definición de Play (no salen del dispositivo).
  - ¿Cifrado en tránsito? → No aplica (sin transmisión).
  - ¿Los usuarios pueden solicitar borrado? → Sí, borrando datos/desinstalando.
- [ ] **Clasificación de contenido (IARC)**: cuestionario → app educativa/estilo de
      vida, sin contenido sensible → apta para todos.
- [ ] **Público objetivo y contenido**: seleccionar rango de edad (recomendado 13+).
- [ ] **Anuncios**: declarar **"No contiene anuncios"**.
- [ ] **App access**: la app no tiene login → marcar que todo el contenido es
      accesible sin credenciales.

---

## 4. Ficha de Play Store (store listing)

- [ ] **Nombre** (≤30 caracteres): `FootCarbonPrint`.
- [ ] **Descripción corta** (≤80). Sugerencia (es):
      > Conoce tu huella de carbono y actúa. Test, resultados y plan, 100% offline.
- [ ] **Descripción completa** (≤4000). Base sugerida:
      > FootCarbonPrint te ayuda a conocer tu huella de carbono con un test rápido
      > por categorías (transporte, hogar, comida, agua, compras y residuos),
      > basado en factores de emisión oficiales (DEFRA, EPA, GHG Protocol).
      > Recibe tus resultados, compáralos con promedios y sigue un plan de acción
      > personalizado. Funciona completamente sin conexión: tus datos nunca salen
      > de tu dispositivo. Disponible en español, inglés, francés, alemán y portugués.
- [ ] **Ícono** 512×512 PNG 32-bit.
- [ ] **Gráfico destacado (feature graphic)** 1024×500.
- [ ] **Capturas de pantalla**: mínimo 2 de teléfono (recomendado 4–8);
      opcional tablet 7" y 10".
- [ ] **Categoría**: Educación o Estilo de vida.
- [ ] **Email de contacto** del desarrollador.
- [ ] **Países** de distribución.

---

## 5. Publicación

- [ ] Subir el `.aab` a un canal (interno → cerrado → producción).
- [ ] Aceptar **Play App Signing** (Google gestiona la clave de firma de la app;
      tú conservas el *upload key*).
- [ ] **Prueba cerrada obligatoria (cuentas personales nuevas):** Google exige
      **20 testers** que hayan estado inscritos y **14 días** de prueba continua
      antes de poder solicitar acceso a producción. Planifícalo con antelación.
- [ ] Enviar a revisión. La primera revisión puede tardar de unas horas a varios días.

---

### Resumen de "qué nos hace falta" (rápido)

| Bloqueante | Tipo | Responsable |
|-----------|------|-------------|
| Keystore + `key.properties` | Técnico | Tú (local, fuera de git) |
| Ícono de marca de la app | Arte | Tú (aportar PNG) |
| Cuenta Play Developer ($25) + verificación | Cuenta | Tú |
| Publicar URL de política de privacidad | Config | Tú (texto ya listo) |
| Data safety + clasificación + público | Formularios | Tú (respuestas sugeridas arriba) |
| Assets de ficha (feature graphic, screenshots, textos) | Marketing | Tú (base sugerida arriba) |
| Prueba cerrada 20 testers / 14 días | Proceso | Tú |
