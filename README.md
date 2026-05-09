Voilà le README complet et final :

```markdown
# claude-dev-workflow

A structured documentation system for working efficiently with Claude on web projects.

---

## The problem

Every new Claude session starts from zero.
No memory. No context. No project history.

Without a system, you spend the first 10 minutes re-explaining everything —
and waste most of your tokens before the real work begins.

---

## The solution

A set of structured markdown files that give Claude exactly what it needs,
exactly when it needs it.

One file per topic. No noise. No waste.

---

## How it works

```
Start of session →
"Read docs/CLAUDE.md then docs/PROGRESS.md"

Working on a page →
"Read docs/PAGES.md section Login and docs/STYLE.md"

End of session →
"Update docs/PROGRESS.md for session [number]"
```

Claude reads only what is relevant.
Tokens go to the actual work — not to rebuilding context.

---

## Structure

```
docs/
├── CLAUDE.md        → entry point, rules, file index
├── CONTEXT.md       → product vision
├── PROGRESS.md      → numbered sessions, progression
├── DECISIONS.md     → technical choices and why
├── STACK.md         → technologies and commands
├── STYLE.md         → design system
├── DATABASE.md      → tables and relations
├── PAGES.md         → each page described
├── COMPONENTS.md    → reusable components
└── ERRORS.md        → resolved bugs and solutions
```

---

## Installation

Copy the `docs/` folder into the root of your project.

```bash
cp -r docs/ your-project/docs/
```

Or clone directly :

```bash
git clone https://github.com/ud20-dev/claude-dev-workflow
```

---

## Usage

**1. Fill in CONTEXT.md first**
Project name, description, what it does, what it does not do.

**2. Fill in STYLE.md before touching any interface**
Colors, fonts, spacing, breakpoints — defined once, applied everywhere.

**3. Start every session with**
```
"Read docs/CLAUDE.md then docs/PROGRESS.md
and tell me where we are in 5 lines"
```

**4. End every session with**
```
"Update docs/PROGRESS.md for session [number]"
```

---

## Rules

- Never let Claude read the entire docs/ folder at once
- One question = one targeted file
- Every resolved bug → add to ERRORS.md
- Every technical decision → add to DECISIONS.md
- Never modify main branch directly

---

## Why this works

| Without this system | With this system |
|---------------------|------------------|
| 10 min re-explaining context | 30 seconds to resume |
| Tokens wasted on context | Tokens used on real work |
| Inconsistent design across pages | One STYLE.md applied everywhere |
| Lost progress between sessions | Numbered sessions in PROGRESS.md |
| Project abandoned when lost | Clear next step every session |

---

## Contributing

Found a way to improve the system ?
Open an issue or submit a pull request.
All contributions are welcome.

---

## Built by

[UD20-dev](https://github.com/ud20-dev) — We build digital products.
```
