#!/usr/bin/env bash
# ============================================================================
# Motor del curso "Aprende SDD" / "Aprende SDD" course engine
#
# ES: Avanza el curso paso a paso. Lee el paso actual desde
#     .github/steps/-step.txt, valida los archivos que el alumno creó y, si
#     son correctos, reescribe la sección del README entre los marcadores
#     SDD-COURSE-STEP y hace commit. Encadena avances: si el alumno ya creó
#     archivos de pasos posteriores, sigue avanzando en la misma ejecución.
# EN: Advances the course step by step. It reads the current step from
#     .github/steps/-step.txt, validates the files the learner created and,
#     when valid, rewrites the README section between the SDD-COURSE-STEP
#     markers and commits. It chains advances: if the learner already created
#     files for later steps, it keeps advancing in the same run.
#
# Uso / Usage:
#   course-engine.sh run     -> valida y avanza desde el paso actual / validate and advance from the current step
#   course-engine.sh finish  -> marca el curso como completado / mark the course as completed
# ============================================================================
set -euo pipefail

STEP_FILE=".github/steps/-step.txt"
STEPS_DIR=".github/steps"
README="README.md"
SUMMARY="${GITHUB_STEP_SUMMARY:-/dev/null}"
ADVANCED=0

current_step() { tr -d '[:space:]' < "$STEP_FILE"; }

say() {
  echo "$1"
  echo "$1" >> "$SUMMARY"
}

fail_with() {
  echo "::error::$1"
  {
    echo ""
    echo "### ❌ $1"
  } >> "$SUMMARY"
  push_if_needed
  exit 1
}

# Reemplaza la sección del README entre los marcadores con el contenido del
# archivo de paso indicado. / Replaces the README section between the markers
# with the given step content file.
render_step() {
  local content_file="$1"
  awk -v cf="$content_file" '
    /<!-- SDD-COURSE-STEP-START -->/ {
      print
      while ((getline line < cf) > 0) print line
      close(cf)
      skip = 1
      next
    }
    /<!-- SDD-COURSE-STEP-END -->/ { print; skip = 0; next }
    skip == 0 { print }
  ' "$README" > "$README.tmp" && mv "$README.tmp" "$README"
}

advance_to() {
  local new_step="$1"
  local content_file="$2"
  render_step "$STEPS_DIR/$content_file"
  printf '%s\n' "$new_step" > "$STEP_FILE"
  git config user.name "github-actions[bot]"
  git config user.email "41898282+github-actions[bot]@users.noreply.github.com"
  git add -A
  git commit -q -m "docs(curso): avanzar al paso $new_step / advance to step $new_step"
  ADVANCED=1
  say "✅ Avanzado al paso $new_step / Advanced to step $new_step"
}

push_if_needed() {
  if [ "$ADVANCED" = "1" ] && [ "${GITHUB_ACTIONS:-}" = "true" ]; then
    git push origin HEAD:main || {
      git pull --rebase origin main
      git push origin HEAD:main
    }
  fi
}

# Primera carpeta de spec numerada / First numbered spec folder (001-*, ...)
spec_dir() {
  find spec/specs -mindepth 1 -maxdepth 1 -type d -name '[0-9][0-9][0-9]-*' 2>/dev/null | sort | head -n 1
}

# ----------------------------------------------------------------------------
# Paso 1: la idea / Step 1: the idea
# ----------------------------------------------------------------------------
step1_present() { [ -f spec/idea/IDEA_GENERAL.md ]; }

step1_validate() {
  local f="spec/idea/IDEA_GENERAL.md"
  local real_content
  real_content=$(sed -e 's/<!--.*-->//g' "$f" \
    | grep -vE '^[[:space:]]*$|^[[:space:]]*#|^[[:space:]]*>|^[[:space:]]*-[[:space:]]*$' \
    | wc -c | tr -d ' ')
  if [ "$real_content" -le 50 ]; then
    fail_with "Paso 1: IDEA_GENERAL.md parece vacío; describe tu idea con tus palabras. / Step 1: IDEA_GENERAL.md looks empty; describe your idea in your own words."
  fi
  if ! grep -qiE 'nombre|name' "$f" || ! grep -qiE 'problema|problem' "$f" \
    || ! grep -qiE 'objetivo|goal|objective' "$f" || ! grep -qiE 'alcance|scope' "$f"; then
    fail_with "Paso 1: faltan secciones en IDEA_GENERAL.md (nombre, problema, objetivo, alcance MVP). / Step 1: IDEA_GENERAL.md is missing sections (name, problem, goal, MVP scope)."
  fi
  say "✔ Paso 1: idea válida / Step 1: valid idea"
}

# ----------------------------------------------------------------------------
# Paso 2: la spec / Step 2: the spec
# ----------------------------------------------------------------------------
step2_present() {
  local d
  d="$(spec_dir)"
  [ -n "$d" ] && [ -f "$d/spec.md" ]
}

step2_validate() {
  local f
  f="$(spec_dir)/spec.md"
  if ! grep -qiE 'Estado */ *Status' "$f"; then
    fail_with "Paso 2: falta la sección de aprobación (Estado / Status) en spec.md. / Step 2: spec.md is missing the approval section (Estado / Status)."
  fi
  if ! grep -qE 'Estado */ *Status:.*`(Aprobado|Approved)`' "$f"; then
    fail_with "Paso 2: marca el estado como \`Aprobado\` en la sección de aprobación. / Step 2: set the status to \`Aprobado\` (or \`Approved\`) in the approval section."
  fi
  if grep -q 'YYYY-MM-DD' "$f"; then
    fail_with "Paso 2: reemplaza el placeholder YYYY-MM-DD por la fecha real de aprobación. / Step 2: replace the YYYY-MM-DD placeholder with the real approval date."
  fi
  if grep -q 'Nombre o rol' "$f"; then
    fail_with "Paso 2: reemplaza 'Nombre o rol' por tu nombre en 'Aprobado por'. / Step 2: replace 'Nombre o rol' with your name in 'Approved by'."
  fi
  if ! grep -qiE 'dado|given' "$f" || ! grep -qiE 'cuando|when' "$f" || ! grep -qiE 'entonces|then' "$f"; then
    fail_with "Paso 2: añade al menos un escenario Dado/Cuando/Entonces. / Step 2: add at least one Given/When/Then scenario."
  fi
  local ears
  ears=$(grep -ciE 'DEBERÁ|DEBERA|SHALL' "$f" || true)
  if [ "${ears:-0}" -lt 2 ]; then
    fail_with "Paso 2: se necesitan al menos 2 criterios EARS (CUANDO ..., EL SISTEMA DEBERÁ ...). / Step 2: at least 2 EARS criteria are required (WHEN ..., THE SYSTEM SHALL ...)."
  fi
  say "✔ Paso 2: spec aprobada y verificable / Step 2: approved, verifiable spec"
}

# ----------------------------------------------------------------------------
# Paso 3: plan y tareas / Step 3: plan & tasks
# ----------------------------------------------------------------------------
step3_present() {
  local d
  d="$(spec_dir)"
  [ -n "$d" ] && [ -f "$d/plan.md" ] && [ -f "$d/tasks.md" ]
}

step3_validate() {
  local d plan tasks hits
  d="$(spec_dir)"
  plan="$d/plan.md"
  tasks="$d/tasks.md"
  hits=0
  grep -qiE 'Riesgo|Risk' "$plan" && hits=$((hits + 1))
  grep -qiE 'Dependenc' "$plan" && hits=$((hits + 1))
  grep -qiE 'Hito|Milestone|Fase|Phase' "$plan" && hits=$((hits + 1))
  if [ "$hits" -lt 2 ]; then
    fail_with "Paso 3: plan.md necesita fases/hitos, dependencias y riesgos. / Step 3: plan.md needs phases/milestones, dependencies and risks."
  fi
  if ! grep -qE '^- \[( |x|X)\]' "$tasks"; then
    fail_with "Paso 3: tasks.md necesita tareas con checkbox, por ejemplo '- [ ] Tarea'. / Step 3: tasks.md needs checkbox tasks, e.g. '- [ ] Task'."
  fi
  # ES: Archivos de apoyo que la validación oficial exige en cada spec numerada.
  # EN: Support files the official validation requires in every numbered spec.
  if [ ! -f "$d/research.md" ]; then
    cp spec/specs/_template/research.md "$d/research.md"
    say "ℹ️ Añadido $d/research.md desde la plantilla / Added from template"
  fi
  if [ ! -f "$d/history.md" ]; then
    sed "s/YYYY-MM-DD/$(date +%F)/" spec/specs/_template/history.md > "$d/history.md"
    say "ℹ️ Añadido $d/history.md desde la plantilla / Added from template"
  fi
  say "✔ Paso 3: plan y tareas consistentes / Step 3: consistent plan and tasks"
}

# ----------------------------------------------------------------------------
# Bucle principal / Main loop
# ----------------------------------------------------------------------------
run_loop() {
  local tries=0 s
  while [ "$tries" -lt 5 ]; do
    tries=$((tries + 1))
    s="$(current_step)"
    case "$s" in
      0)
        advance_to 1 1-idea.md
        ;;
      1)
        if step1_present; then step1_validate && advance_to 2 2-spec.md; else
          say "⏳ Paso 1 pendiente: crea spec/idea/IDEA_GENERAL.md. / Step 1 pending: create spec/idea/IDEA_GENERAL.md."
          break
        fi
        ;;
      2)
        if step2_present; then step2_validate && advance_to 3 3-plan-tasks.md; else
          say "⏳ Paso 2 pendiente: crea spec/specs/001-mi-feature/spec.md. / Step 2 pending: create spec/specs/001-mi-feature/spec.md."
          break
        fi
        ;;
      3)
        if step3_present; then step3_validate && advance_to 4 4-gate.md; else
          say "⏳ Paso 3 pendiente: crea plan.md y tasks.md junto a tu spec. / Step 3 pending: create plan.md and tasks.md next to your spec."
          break
        fi
        ;;
      *)
        say "ℹ️ Paso actual: $s. Nada que avanzar aquí. / Current step: $s. Nothing to advance here."
        break
        ;;
    esac
  done
  push_if_needed
}

finish_course() {
  local s
  s="$(current_step)"
  if [ "$s" != "4" ]; then
    say "ℹ️ El curso no está en el paso 4 (actual: $s); no se puede completar aún. / Course is not at step 4 (current: $s); cannot finish yet."
    return 0
  fi
  advance_to X X-finish.md
  push_if_needed
}

case "${1:-run}" in
  run) run_loop ;;
  finish) finish_course ;;
  *)
    echo "Usage: $0 [run|finish]"
    exit 2
    ;;
esac
