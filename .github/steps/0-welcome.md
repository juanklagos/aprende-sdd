## 👋 Bienvenida / Welcome

**Objetivo / Goal:** aprender Spec-Driven Development (SDD) practicando el ciclo completo: idea → spec aprobada → plan y tareas → compuerta de validación. / Learn SDD by practicing the full cycle: idea → approved spec → plan and tasks → validation gate.

ES: Este es un curso interactivo de ~30–40 minutos. Crearás tu propia copia de
este repositorio y avanzarás creando archivos reales de SDD. Después de cada
push, un workflow de GitHub Actions valida tu avance y reescribe este README
con el siguiente paso. El curso usa el layout *sidecar*: todos los artefactos
SDD viven en la carpeta `spec/` y tu código (en un proyecto real) vive en la
raíz. Al final, la validación oficial del SDD Template se ejecuta sobre tu
repositorio en CI y, si pasa, obtienes el badge de Nivel 1.

> **EN:** This is a ~30–40 minute interactive course. You create your own copy
> of this repository and progress by creating real SDD files. After each push,
> a GitHub Actions workflow validates your work and rewrites this README with
> the next step. The course uses the *sidecar* layout: all SDD artifacts live
> in `spec/`, your code (in a real project) lives at the root. At the end, the
> official SDD Template validation runs on your repo in CI and awards the
> Level 1 badge.

**Los 4 pasos / The 4 steps**

| Paso / Step | Creas / You create | Aprendes / You learn |
|---|---|---|
| 1. Idea | `spec/idea/IDEA_GENERAL.md` | Definir el qué y el porqué / Define the what and the why |
| 2. Spec | `spec/specs/001-mi-feature/spec.md` | Historias, escenarios y criterios EARS / Stories, scenarios and EARS criteria |
| 3. Plan y tareas / Plan & tasks | `plan.md` + `tasks.md` | Plan consistente con la spec / Plan consistent with the spec |
| 4. Compuerta / Gate | `spec/.sdd/user-consent.log` | Validación real en CI / Real CI validation |

### :keyboard: Actividad: crea tu copia / Activity: create your copy

1. ES: Pulsa **Use this template → Create a new repository** (arriba a la derecha).
   EN: Click **Use this template → Create a new repository** (top right).
2. ES: Elige tu cuenta como propietaria, nombre sugerido `aprende-sdd`, visibilidad **Public**.
   EN: Choose your account as owner, suggested name `aprende-sdd`, **Public** visibility.
3. ES: En **tu copia**, espera ~30 segundos y recarga esta página: el Paso 1 aparecerá aquí.
   EN: In **your copy**, wait ~30 seconds and refresh this page: Step 1 will appear here.

> ES: ¿Tu copia sigue mostrando esta bienvenida? Abre la pestaña **Actions** y comprueba que el workflow «Paso 0: Bienvenida» terminó en verde.
> EN: Your copy still shows this welcome? Open the **Actions** tab and check that the "Paso 0" workflow finished green.
