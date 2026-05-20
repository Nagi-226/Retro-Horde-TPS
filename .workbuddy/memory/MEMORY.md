# Retro Horde - 项目记忆

## 项目概述
- **名称**: Retro Horde（复古尸潮）
- **引擎**: Godot 4.6
- **类型**: TPS视角复古弹幕生存射击
- **路径**: `D:\Godot Projects\retro-horde-tps\`
- **基线**: Godot 官方 TPS Demo（godotengine/tps-demo master分支）
- **主场景**: `res://main/main.tscn`

## 架构概览

```
main/main.gd          → 根节点，场景切换（菜单↔关卡）
  ├── menu/menu.gd    → 主菜单：Play/Settings/Online/Quit
  ├── menu/settings.gd → Autoload单例，图形设置持久化
  └── level/level.gd  → 关卡管理：敌人生成、玩家生成、GI设置
  
player/
  ├── player.gd       → 玩家角色 (CharacterBody3D)：动画、射击、相机震动
  ├── player_input.gd → 输入同步 (MultiplayerSynchronizer)：键鼠/手柄
  └── bullet/bullet.gd → 子弹（子弹飞行、碰撞检测、爆炸效果）

enemies/red_robot/
  ├── red_robot.gd    → 敌人AI：APPROACH→AIM→SHOOTING状态机，5HP
  └── parts/part.gd   → 死亡部件物理

door/door.gd          → 自动门（玩家接近开启）
level/debug.gd        → FPS/HUD调试标签
```

## 核心机制
- **玩家**: WASD移动、鼠标瞄准、左键射击、空格跳跃、右键瞄准切换
- **敌人**: 红机器人，射线检测玩家，瞄准后发射激光，15秒重生
- **多人**: 支持ENet在线多人（Host/Client模式）
- **图形**: SDFGI/VoxelGI/LightmapGI三选一，MetalFX/FSR2缩放，完整画面设置菜单

## 关键文件清单（15个.gd）
| 文件 | 类/扩展 | 职责 |
|------|---------|------|
| `main/main.gd` | Node | 场景切换 |
| `menu/menu.gd` | Node | 主菜单UI |
| `menu/settings.gd` | Node (Autoload) | 设置持久化 |
| `level/level.gd` | Node3D | 关卡管理 |
| `level/debug.gd` | Label | HUD |
| `level/forklift/flying_forklift.gd` | - | 叉车物理 |
| `player/player.gd` | Player (CharacterBody3D) | 玩家角色 |
| `player/player_input.gd` | PlayerInputSynchronizer | 输入处理 |
| `player/bullet/bullet.gd` | CharacterBody3D | 子弹 |
| `player/camera_noise_shake_effect.gd` | - | 相机震动 |
| `enemies/red_robot/red_robot.gd` | CharacterBody3D | 敌人AI |
| `enemies/red_robot/parts/part.gd` | - | 部件物理 |
| `enemies/red_robot/parts/part_disappear_effect/part_disappear.gd` | - | 消失效果 |
| `enemies/red_robot/laser/impact_effect/blast.gd` | - | 激光爆炸 |
| `door/door.gd` | Area3D | 自动门 |

## 技术要点
- Godot 4.x MultiplayerSynchronizer 同步机制
- AnimationTree + Root Motion 动画系统
- RPC (`@rpc("call_local")`) 用于多人同步
- 物理层：`move_and_slide()` / `move_and_collide()` 
- 射线检测：`intersect_ray()` 用于射击和激光

## 开发工具链
- **Godot**: 4.6.2.stable（WinGet安装，路径 `C:/Users/FJL03/AppData/Local/Microsoft/WinGet/Links/godot`）
- **快速启动**: `run_game.bat`（桌面双击直接运行）
- **Godot MCP**: Coding-Solo/godot-mcp v0.1.1 已安装于 `C:/Users/FJL03/tools/godot-mcp/`
- **WorkBuddy MCP配置**: `C:/Users/FJL03/.workbuddy/mcp.json` — godot MCP已连接

## 可用AI资源
| 资源 | 位置 | 用途 |
|------|------|------|
| Claude-Code-Game-Studios | `E:\Open-Source Projects by others\Claude-Code-Game-Studios\` | 48 agents + 71 skills 游戏开发工作流 |
| agency-agents Godot | `E:\Open-Source Projects by others\agency-agents\game-development\godot\` | 3个Godot专属agent (gameplay/multiplayer/shader) — 已集成 |
| superpowers | `E:\AISkills\superpowers\` | 13个通用开发workflow skill — 已安装 |
| Anthropic_skills | `E:\AISkills\Anthropic_skills\` | 17个官方skill (文档/设计/API) |
| agent-sprite-forge | `E:\AISkills\agent-sprite-forge-skill\` | AI精灵表生成→Godot场景导出 |
| Godot MCP Pro | https://godot-mcp.abyo.net/ ($15) | 169工具：场景编辑/GDScript/运行时分析 |
| Godot-MCP-Native (免费) | https://github.com/yurineko73/Godot-MCP-Native | GDScript原生MCP插件 |

## 项目已集成资源 (2026-05-20 更新)
- **Agents**: 8个 (5 CCGS + 3 Agency-Agents) Godot agent 已复制到 `.workbuddy/agents/`
- **Skills**: 72个 CCGS 游戏开发 skill + 13个 Superpowers workflow skill 已可用
- **启动脚本**: `run_game.bat` (运行) / `run_editor.bat` (编辑器/F5实时预览)
- **文档**: `CLAUDE.md` + `CODEX.md` 已生成于项目根目录
- **素材规划**: `.workbuddy/ASSETS.md` 版本化素材路线图 (v0.0.2→v0.1.0)
- **路线图**: `.workbuddy/ROADMAP.md` v0.0.1→v0.1.0
- **工作流**: Claude=审查+路线把控, Codex=主力开发, Beta_dev分支 → [[dual-ai-workflow]]

- **Current progress**: v0.0.2-A started. `autoload/event_bus.gd` and `ui/hud.gd` were added; `level/level.gd` attaches the HUD skeleton. Next step is HP system, not wave/bullet-hell work yet.
- **Known validation limit**: MCP graphical runs start successfully; local `run_game.bat --headless` still reports baseline 3D resource parse errors. Track this separately from v0.0.2-A changes.
