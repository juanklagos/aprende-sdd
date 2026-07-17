## 🗺️ Paso 3 de 4: Plan y tareas / Step 3 of 4: Plan & tasks

**Objetivo / Goal:** derivar de la spec un plan con fases, dependencias y riesgos, y una lista de tareas accionables. / Derive from the spec a plan with phases, dependencies and risks, plus an actionable task list.

ES: Con la spec aprobada, todavía no se programa: primero se planifica.
El `plan.md` traduce la spec a fases de implementación, dependencias, hitos
y riesgos; el `tasks.md` la convierte en tareas pequeñas con checkbox, cada
una trazable a la spec. La regla de consistencia es simple: si una tarea no
sirve a ningún criterio de la spec, sobra; si un criterio no tiene tareas,
falta. Ambos archivos viven junto a la spec, en la misma carpeta numerada.

> **EN:** An approved spec still doesn't mean coding: first you plan.
> `plan.md` translates the spec into phases, dependencies, milestones and
> risks; `tasks.md` turns it into small checkbox tasks, each traceable to the
> spec. Consistency rule: a task serving no spec criterion is waste; a
> criterion with no tasks is a gap. Both files live next to the spec.

### :keyboard: Actividad / Activity

1. ES: Crea el archivo / EN: Create the file:

   ```text
   spec/specs/001-mi-feature/plan.md
   ```

   ES: con este contenido, adaptado a tu spec: / EN: with this content, adapted to your spec:

   ```markdown
   # Plan 001 - Marcar artículos como comprados

   ## Resumen / Summary

   Implementar el marcado de artículos como comprados según la spec 001.

   ## Fases de implementación / Implementation phases

   1. Modelo de datos del artículo con estado pendiente/comprado.
   2. Interfaz para marcar y desmarcar artículos.
   3. Persistencia del estado al recargar.

   ## Dependencias / Dependencies

   - Spec 001 aprobada.

   ## Hitos / Milestones

   - Hito 1: demo con marcado y desmarcado funcionando.

   ## Riesgos / Risks

   - Riesgo 1: perder el estado si falla la persistencia local.
   ```

2. ES: Crea el archivo / EN: Create the file:

   ```text
   spec/specs/001-mi-feature/tasks.md
   ```

   ES: con tareas pequeñas y accionables: / EN: with small, actionable tasks:

   ```markdown
   # Tareas 001 - Marcar artículos como comprados

   - [ ] Definir el modelo del artículo con estado pendiente/comprado
   - [ ] Implementar marcar y desmarcar en la interfaz
   - [ ] Guardar y restaurar el estado al recargar
   - [ ] Probar los dos escenarios de aceptación de la spec
   ```

3. ES: Confirma cada commit directamente en `main`. / EN: Commit directly to `main`.

**Qué pasará al completarlo / What happens when you complete it:**
ES: el workflow «Paso 3: Plan y tareas» validará que el plan tenga fases, dependencias y riesgos y que las tareas usen checkboxes. Además añadirá por ti `research.md` e `history.md` desde la plantilla (en un proyecto real los completas tú). Después, este README mostrará el Paso 4.
EN: the "Paso 3" workflow validates that the plan has phases, dependencies and risks and that tasks use checkboxes. It also adds `research.md` and `history.md` for you from the template (in a real project you fill them in). Then this README will show Step 4.
