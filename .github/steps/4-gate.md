## 🚦 Paso 4 de 4: La compuerta SDD / Step 4 of 4: The SDD gate

**Objetivo / Goal:** registrar tu consentimiento y ejecutar la validación oficial del SDD Template sobre tu repositorio en CI. / Record your consent and run the official SDD Template validation on your repository in CI.

ES: Antes de implementar, SDD exige un último acto explícito: el consentimiento
del responsable del proyecto, registrado en `spec/.sdd/user-consent.log`.
Con él, la compuerta puede abrirse. En este paso, el workflow ejecuta la
action oficial `juanklagos/spec-driven-development-template@main` sobre tu
repositorio: valida la estructura, la política y la compuerta —exactamente los
mismos tres chequeos que usarías en un proyecto real. Si todo pasa, el curso
queda completado y recibes tu badge.

> **EN:** Before implementing, SDD requires one last explicit act: the project
> owner's consent, recorded in `spec/.sdd/user-consent.log`. In this step the
> workflow runs the official `juanklagos/spec-driven-development-template@main`
> action on your repository: it validates structure, policy and gate — the
> exact three checks you would use in a real project. If everything passes,
> the course is complete and you get your badge.

### :keyboard: Actividad / Activity

1. ES: Crea el archivo / EN: Create the file:

   ```text
   spec/.sdd/user-consent.log
   ```

2. ES: Con una sola línea de consentimiento (adáptala con tu fecha y tu spec): / EN: With a single consent line (adapt it with your date and your spec):

   ```text
   [2026-07-17 12:00:00 +0000] Apruebo la implementación de la spec 001-mi-feature dentro del alcance del MVP. / I approve implementing spec 001-mi-feature within the MVP scope.
   ```

3. ES: Confirma el commit directamente en `main`. / EN: Commit directly to `main`.

> ES: Desde una terminal, el equivalente en un proyecto real es: `./spec/scripts/confirm-user-consent.sh "Apruebo la implementación de la spec 001-mi-feature"`.
> EN: From a terminal, the real-project equivalent is: `./spec/scripts/confirm-user-consent.sh "I approve implementing spec 001-mi-feature"`.

**Qué pasará al completarlo / What happens when you complete it:**
ES: el workflow «Paso 4: Compuerta SDD» ejecutará la validación oficial (estructura + política + compuerta) sobre tu repo. Si sale en verde, este README mostrará el cierre del curso con tu badge de Nivel 1. Si sale en rojo, abre la pestaña **Actions**: el log te dirá exactamente qué corregir; arréglalo y haz push de nuevo.
EN: the "Paso 4" workflow runs the official validation (structure + policy + gate) on your repo. If it is green, this README will show the course finale with your Level 1 badge. If it is red, open the **Actions** tab: the log tells you exactly what to fix; fix it and push again.
