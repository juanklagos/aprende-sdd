## 📐 Paso 2 de 4: La spec / Step 2 of 4: The spec

**Objetivo / Goal:** convertir tu idea en una especificación verificable y aprobarla formalmente. / Turn your idea into a verifiable specification and approve it formally.

ES: Una spec describe UNA funcionalidad concreta de tu idea en términos
comprobables: una historia de usuario (quién quiere qué y para qué),
escenarios de aceptación en formato Dado/Cuando/Entonces, y criterios EARS
(«CUANDO [disparador], EL SISTEMA DEBERÁ [comportamiento observable]»).
La sección de aprobación es la clave de SDD: mientras el estado sea
`Pendiente`, la compuerta está cerrada y no se escribe código. Hoy tú eres
quien aprueba: pon el estado en `Aprobado`, con fecha y tu nombre.

> **EN:** A spec describes ONE concrete feature in verifiable terms: a user
> story, Given/When/Then acceptance scenarios, and EARS criteria ("WHEN
> [trigger], THE SYSTEM SHALL [observable behavior]"). The approval section is
> the heart of SDD: while it says `Pendiente` (pending), the gate is closed and
> no code gets written. Today you are the approver: set it to `Aprobado`, with
> date and your name.

### :keyboard: Actividad / Activity

1. ES: Pulsa **Add file → Create new file** y escribe como nombre: / EN: Click **Add file → Create new file** and type this name:

   ```text
   spec/specs/001-mi-feature/spec.md
   ```

2. ES: Pega esta spec y adáptala a la funcionalidad principal de TU idea. Usa la fecha de hoy y tu nombre. / EN: Paste this spec and adapt it to YOUR idea's main feature. Use today's date and your name:

   ```markdown
   # Especificación 001 - Marcar artículos como comprados

   ## Estado de aprobación / Approval status

   - Estado / Status: `Aprobado`
   - Fecha de aprobación / Approval date: `2026-07-17`
   - Aprobado por / Approved by: `Tu Nombre`
   - Evidencia de aprobación / Approval evidence: Revisé la spec completa y apruebo este alcance para el MVP.

   ## Historia de usuario principal / Main user story

   Como usuario de la lista de compras, quiero marcar artículos como comprados,
   para saber qué me falta mientras estoy en la tienda.

   ## Escenarios de aceptación / Acceptance scenarios

   1. Dado que tengo una lista con 3 artículos, cuando marco uno como comprado, entonces la lista muestra 2 pendientes y 1 comprado.
   2. Dado que un artículo está marcado como comprado, cuando lo desmarco, entonces vuelve a la lista de pendientes.

   ## Criterios de aceptación (formato EARS) / Acceptance criteria (EARS format)

   - CUANDO el usuario marque un artículo, EL SISTEMA DEBERÁ moverlo a la sección de comprados de forma inmediata.
   - CUANDO el usuario desmarque un artículo comprado, EL SISTEMA DEBERÁ devolverlo a la lista de pendientes conservando su nombre y cantidad.

   ## Requisitos / Requirements

   - La lista distingue artículos pendientes y comprados.
   - El estado se conserva al recargar la página.

   ## Criterios de éxito / Success criteria

   - Un usuario completa una compra sin artículos olvidados.
   ```

3. ES: Confirma el commit directamente en `main`. / EN: Commit directly to `main`.

> ES: Importante: no dejes placeholders como `YYYY-MM-DD` o `Nombre o rol`; la compuerta del Paso 4 los rechaza en una spec aprobada.
> EN: Important: do not leave placeholders like `YYYY-MM-DD` or `Nombre o rol`; the Step 4 gate rejects them in an approved spec.

**Qué pasará al completarlo / What happens when you complete it:**
ES: el workflow «Paso 2: Spec» comprobará el estado `Aprobado`, al menos un escenario Dado/Cuando/Entonces y al menos 2 criterios EARS, y este README mostrará el Paso 3.
EN: the "Paso 2: Spec" workflow checks the `Aprobado` status, at least one Given/When/Then scenario and at least 2 EARS criteria, then this README will show Step 3.
