# 📦 Guía de Release para MovUni

## 🚀 Cómo generar un Release con APK automáticamente

### Opción 1: Release automático con Tag (RECOMENDADO)

1. **Haz commit de tus cambios:**
   ```bash
   git add .
   git commit -m "feat: nueva funcionalidad lista para release"
   ```

2. **Crea un tag con la versión:**
   ```bash
   git tag v1.0.0
   ```

3. **Sube el tag a GitHub:**
   ```bash
   git push origin v1.0.0
   ```

4. **Automáticamente se ejecutará:**
   - ✅ Build de la APK
   - ✅ Creación del Release en GitHub
   - ✅ APK adjuntada al release

5. **Verifica en GitHub:**
   - Ve a: `https://github.com/Marant7/MOVUNIEXAMEN/releases`
   - Verás tu nuevo release con la APK lista para descargar

### Opción 2: Build manual (sin release)

1. **Ve a GitHub Actions:**
   - `https://github.com/Marant7/MOVUNIEXAMEN/actions`

2. **Selecciona "Build APK (Manual)"**

3. **Click en "Run workflow"**

4. **Ingresa la versión** (ej: 1.0.0)

5. **Descarga la APK** desde los artifacts cuando termine

---

## 📋 Comandos útiles para tags

### Ver todos los tags
```bash
git tag
```

### Crear un tag con mensaje
```bash
git tag -a v1.0.0 -m "Release version 1.0.0"
```

### Eliminar un tag local
```bash
git tag -d v1.0.0
```

### Eliminar un tag remoto
```bash
git push --delete origin v1.0.0
```

### Ver información de un tag
```bash
git show v1.0.0
```

---

## 🏷️ Convención de versionado (Semantic Versioning)

**Formato:** `vMAJOR.MINOR.PATCH`

- **MAJOR** (v**2**.0.0): Cambios incompatibles con versiones anteriores
- **MINOR** (v1.**5**.0): Nueva funcionalidad compatible
- **PATCH** (v1.0.**3**): Corrección de bugs

**Ejemplos:**
```bash
v1.0.0  # Primera versión estable
v1.1.0  # Agregaste mapa en tiempo real
v1.1.1  # Arreglaste un bug en el mapa
v2.0.0  # Rediseño completo de la UI
```

---

## 🔥 Workflow de trabajo recomendado

1. **Desarrollo:**
   ```bash
   git checkout -b feature/nueva-funcionalidad
   # ... haces cambios ...
   git commit -m "feat: agregar nueva funcionalidad"
   git push origin feature/nueva-funcionalidad
   ```

2. **Merge a main:**
   ```bash
   git checkout main
   git merge feature/nueva-funcionalidad
   git push origin main
   ```

3. **Crear release:**
   ```bash
   git tag v1.2.0
   git push origin v1.2.0
   ```

4. **¡Listo!** La APK se genera automáticamente

---

## 📱 Dónde encontrar la APK generada

### En GitHub Releases:
- URL: `https://github.com/Marant7/MOVUNIEXAMEN/releases`
- Descargar directamente desde ahí

### En GitHub Actions (Artifacts):
- URL: `https://github.com/Marant7/MOVUNIEXAMEN/actions`
- Click en el workflow ejecutado
- Sección "Artifacts" al final
- Descarga el ZIP con la APK

---

## 🛠️ Troubleshooting

### Error: "tag already exists"
```bash
# Si el tag ya existe, elimínalo primero
git tag -d v1.0.0
git push --delete origin v1.0.0
# Ahora créalo de nuevo
git tag v1.0.0
git push origin v1.0.0
```

### Error en el build de Flutter
- Verifica que `pubspec.yaml` tenga la versión correcta
- Asegúrate que `flutter test` pase localmente
- Revisa los logs en GitHub Actions

### La APK no se adjunta al release
- Verifica que el workflow tenga permisos de escritura
- Ve a: Settings → Actions → General → Workflow permissions
- Selecciona "Read and write permissions"

---

## 🎓 Para tu examen

**Comandos que debes saber:**

1. Crear tag:
   ```bash
   git tag v1.0.0
   ```

2. Subir tag:
   ```bash
   git push origin v1.0.0
   ```

3. Ver workflows:
   - GitHub → Actions

4. Ver releases:
   - GitHub → Releases

5. Ejecutar workflow manual:
   - Actions → Build APK (Manual) → Run workflow

---

## ✅ Checklist antes del examen

- [ ] He creado al menos un tag de prueba
- [ ] He visto ejecutarse el workflow exitosamente
- [ ] He descargado una APK generada
- [ ] Entiendo qué hace cada step del workflow
- [ ] Sé cómo ver los logs si algo falla
- [ ] Conozco la diferencia entre artifacts y releases
- [ ] Puedo explicar qué es un tag de Git
- [ ] Sé ejecutar un workflow manualmente

---

## 📚 Conceptos clave para explicar

1. **Tag de Git:** Marca un punto específico en el historial (como un commit especial para versiones)

2. **Release de GitHub:** Página pública donde los usuarios pueden descargar versiones de tu app

3. **Artifact:** Archivo generado por GitHub Actions (temporal, solo para el equipo)

4. **Trigger (on: push: tags):** Evento que activa el workflow automáticamente

5. **Runner (ubuntu-latest):** Máquina virtual donde se ejecuta el workflow

6. **Step:** Cada tarea individual del workflow (checkout, build, upload, etc.)

---

¡Suerte en tu examen! 🚀
