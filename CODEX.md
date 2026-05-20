# Retro Horde — Godot 4.6 TPS Horde Survival Shooter

> **Engine**: Godot 4.6.2 | **Language**: GDScript | **Path**: `D:\Godot Projects\retro-horde-tps\`
> **Base**: godotengine/tps-demo master | **AI Framework**: WorkBuddy + CCGS + Godot MCP

## Technology Stack

- **Engine**: Godot 4.6.2.stable (WinGet)
- **Language**: GDScript 2.0 (statically typed)
- **Rendering**: Forward+, SDFGI / VoxelGI / LightmapGI
- **Physics**: GodotPhysics 3D (CharacterBody3D)
- **Animation**: AnimationTree + Root Motion
- **Multiplayer**: ENet MultiplayerPeer + RPC (`@rpc("call_local")`)
- **Files**: 15 `.gd` scripts, 17 `.tscn` scenes
- **Quick Launch**: `run_game.bat` (play) | `run_editor.bat` (edit, F5 for live preview)

## Project Architecture

```
main/main.gd          → Root: scene switching (menu ↔ level)
  ├── menu/menu.gd    → Main menu: Play/Settings/Online/Quit
  ├── menu/settings.gd → Autoload: graphics settings persistence
  └── level/level.gd  → Level: enemy spawn, player spawn, GI setup

player/
  ├── player.gd       → Player (CharacterBody3D): anim, shoot, camera shake
  ├── player_input.gd → Input sync (MultiplayerSynchronizer): keys/mouse/gamepad
  └── bullet/bullet.gd → Bullet physics, collision, explosion

enemies/red_robot/
  ├── red_robot.gd    → Enemy AI: APPROACH→AIM→SHOOTING FSM (5HP)
  └── parts/part.gd   → Death part physics

door/door.gd          → Area3D auto-door
level/debug.gd        → Debug HUD (FPS/memory/online status)
```

## Godot Agents (8 specialists)

Available under `.workbuddy/agents/`:

**CCGS (5)**: `godot-specialist`, `godot-gdscript-specialist`, `godot-shader-specialist`, `godot-csharp-specialist`, `godot-gdextension-specialist`

**Agency-Agents (3)**: `godot-gameplay-scripter` (signals/EventBus/composition), `godot-multiplayer-engineer` (ENet/WebRTC/RPC), `godot-shader-developer` (shaders/VFX/post-processing)

## CCGS Game Dev Skills (72 skills)

Under `.workbuddy/skills/`:

**Workflow**: `start`, `help`, `project-stage-detect`, `onboard`
**Design**: `brainstorm`, `quick-design`, `design-system`, `design-review`, `reverse-document`, `create-architecture`, `architecture-decision`, `architecture-review`, `map-systems`, `ux-design`, `ux-review`, `art-bible`
**Development**: `setup-engine`, `adopt`, `create-stories`, `create-epics`, `dev-story`, `story-done`, `story-readiness`, `sprint-plan`, `sprint-status`, `prototype`, `code-review`, `perf-profile`, `estimate`, `scope-check`, `tech-debt`, `consistency-check`
**Testing**: `smoke-check`, `gate-check`, `regression-suite`, `soak-test`, `bug-report`, `bug-triage`, `test-setup`, `test-helpers`, `test-evidence-review`, `test-flakiness`
**Balance**: `balance-check`, `playtest-report`
**Assets**: `asset-audit`, `asset-spec`, `content-audit`, `create-control-manifest`
**Teams**: `team-combat`, `team-level`, `team-ui`, `team-polish`, `team-audio`, `team-narrative`, `team-qa`, `team-release`, `team-live-ops`
**Release**: `changelog`, `patch-notes`, `release-checklist`, `launch-checklist`, `day-one-patch`, `hotfix`, `retrospective`, `milestone-review`, `localize`
**Meta**: `qa-plan`, `security-audit`, `review-all-gdds`, `propagate-design-change`, `skill-improve`, `skill-test`

**Superpowers (13)**: `brainstorming`, `writing-plans`, `executing-plans`, `test-driven-development`, `systematic-debugging`, `subagent-driven-development`, `dispatching-parallel-agents`, `requesting-code-review`, `receiving-code-review`, `verification-before-completion`, `using-git-worktrees`, `writing-skills`, `finishing-a-development-branch`

## MCP Configuration

**Godot MCP** (Coding-Solo/godot-mcp v0.1.1):
```json
{
  "godot": {
    "command": "node",
    "args": ["C:\\Users\\FJL03\\tools\\godot-mcp\\build\\index.js"],
    "env": {
      "GODOT_PATH": "C:\\Users\\FJL03\\AppData\\Local\\Microsoft\\WinGet\\Links\\godot.exe"
    }
  }
}
```
**Pro upgrade**: Godot MCP Pro ($15, 169 tools) — https://godot-mcp.abyo.net/

## Coding Standards (GDScript)

**Mandatory**: Static typing everywhere. `class_name` for custom types. `@export` for inspector. Signals for decoupled comms.

**File order**: class_name → extends → const/enum → signals → @export → public vars → private vars → @onready → virtual methods → public methods → private methods → signal callbacks (`_on_`).

**Performance**: `set_process(false)` when idle. Cache node refs in `@onready`. Use `Tween` instead of manual interpolation. Object pool for frequent spawns.

## Game Assets

**Existing**: 15 GLB models, 100+ PBR textures, 4 WAV sounds.
**Free CC0 sources**: Poly Haven, Quaternius (low-poly enemies/weapons), Kenney (prototype assets), freepbr.com (sci-fi PBR), ambientCG (1000+ materials).

See `.workbuddy/ASSETS.md` for full inventory and download links.

## Working Memory

- **Long-term**: `.workbuddy/memory/MEMORY.md`
- **Daily log**: `.workbuddy/memory/YYYY-MM-DD.md`
- **Roadmap**: `.workbuddy/ROADMAP.md` (v0.0.1 → v0.1.0)
- **Assets**: `.workbuddy/ASSETS.md`

## Quick Start

```bash
# Windows — double-click:
run_editor.bat    → Godot Editor (press F5 for live preview)
run_game.bat      → Run game directly

# CLI:
./run_game.bat --editor    → Editor mode
./run_game.bat --headless  → Headless server
```

## Roadmap

- ✅ v0.0.1 — Project setup, Godot MCP, CCGS agents/skills, launch scripts
- 🔜 v0.0.2 — Wave system, bullet hell, score system, player HP
- 📋 v0.0.3 — Enemy variety (melee/ranged/Boss)
- 📋 v0.0.4 — Weapon system (switch/drop/ammo)
- 📋 v0.0.5 — Levels & maps
- 🎯 v0.1.0 — Complete playable build

---

*AI-assisted Godot 4.x game development. Session memory restored from `.workbuddy/memory/`.*
