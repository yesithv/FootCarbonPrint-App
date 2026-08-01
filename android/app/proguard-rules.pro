# Reglas ProGuard/R8 para el build de release.
# Flutter y sus plugins usan reflexión/JNI; estas reglas evitan que R8
# elimine clases necesarias en tiempo de ejecución.

# --- Flutter engine ---
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# --- image_picker ---
-keep class androidx.lifecycle.DefaultLifecycleObserver

# Silenciar warnings de código opcional referenciado por dependencias.
-dontwarn io.flutter.embedding.**
