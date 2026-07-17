<!--
  ES: Curso interactivo estilo GitHub Skills. Los workflows de .github/workflows
  reescriben la sección entre los marcadores SDD-COURSE-STEP para avanzar de
  paso. No edites esa sección a mano: se sobreescribe.
  EN: GitHub Skills-style interactive course. The workflows in .github/workflows
  rewrite the section between the SDD-COURSE-STEP markers to advance the
  course. Do not edit that section by hand: it gets overwritten.
-->

# 🧭 Aprende SDD / Learn SDD

_Curso interactivo oficial del [Spec-Driven Development Template](https://github.com/juanklagos/spec-driven-development-template) · Official interactive course of the SDD Template_

**Regla de oro / Golden rule:** _No hay código sin spec aprobada y plan consistente. / No code before approved spec and consistent plan._

<!-- SDD-COURSE-STEP-START -->
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
<!-- SDD-COURSE-STEP-END -->

---

### 🛟 ¿Atascado? / Stuck?

- ES: Espera ~30 segundos después de cada push y recarga esta página. Si el README no avanza, abre la pestaña **Actions**: el workflow del paso actual explica en su resumen qué falta. Corrígelo y haz push de nuevo, o lanza el workflow del paso a mano con **Run workflow**.
- EN: Wait ~30 seconds after each push and refresh this page. If the README does not advance, open the **Actions** tab: the current step's workflow explains in its summary what is missing. Fix it and push again, or trigger the step manually with **Run workflow**.

### 🔗 Enlaces / Links

- Template principal / Main template: <https://github.com/juanklagos/spec-driven-development-template>
- Sitio y documentación / Site and docs: <https://juanklagos.github.io/spec-driven-development-template/>
- Tutor conversacional / Conversational tutor: `/sdd:tutor` (Claude Code con las skills del template / Claude Code with the template skills)

---

Licencia MIT / MIT License · © 2026 Juan Klagos
