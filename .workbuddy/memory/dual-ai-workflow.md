---
name: dual-ai-workflow
description: Claude=审查+路线把控, Codex=主力开发, Beta_dev分支
metadata:
  type: project
---

# Dual-AI Development Workflow

**Rule**: Claude does cross-review & roadmap oversight; Codex does implementation on `Beta_dev`.

**Why**: User wants dual-AI mutual review to prevent drift — Codex writes the code, Claude audits it for correctness, architecture alignment, and scope discipline. Both sides check each other.

**How to apply**:
- When reviewing Codex changes: check against ROADMAP.md Project Contract scope, GDScript coding standards in CLAUDE.md/CODEX.md, architectural constraints (composition over inheritance, EventBus, static typing)
- Don't do implementation work yourself — flag issues and let Codex fix them
- Track scope creep aggressively per the ai-dev-guardrails M1-M9 framework
- Check CODEX.md stays in sync with CLAUDE.md (both should reflect same project reality)
- Branch: `Beta_dev` is the active development branch; `Alpha_dev` is the baseline archive; `release_dev` is for future release prep
