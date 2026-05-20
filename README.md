# Retro Horde — TPS 复古弹幕生存射击

[![CI/CD Pipeline](https://github.com/Nagi-226/Retro-Horde-TPS/actions/workflows/ci.yml/badge.svg)](https://github.com/Nagi-226/Retro-Horde-TPS/actions/workflows/ci.yml)
[![Godot 4.6.2](https://img.shields.io/badge/Godot-4.6.2-blue?logo=godot-engine)](https://godotengine.org/)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE.md)

**Retro Horde** 是一款基于 Godot 4.6.2 开发的第三人称复古弹幕生存射击游戏。在弹幕地狱中杀出一条血路，每一局都是不同的体验。

![Screenshot of TPS demo](screenshots/screenshot.webp)

> 项目基线来自 [godotengine/tps-demo](https://github.com/godotengine/tps-demo) master 分支。
> AI辅助开发，遵循 [ai-dev-guardrails](https://github.com/Nagi-226) 五层防御体系。

---

## 开发状态

| 版本 | 状态 | 核心内容 |
|------|------|---------|
| v0.0.1 | ✅ 完成 | 项目基础设施 + AI工具链 + CI/CD |
| v0.0.2 | 🔜 规划中 | 波次系统 + 弹幕模式 + HP/得分/HUD |
| v0.1.0 | 🎯 目标 | 完整可玩版本 |

详细路线图见 [ROADMAP.md](.workbuddy/ROADMAP.md)

---

## 快速开始

### Windows

```bash
# 双击运行游戏
run_game.bat

# 双击打开编辑器 (F5 实时预览)
run_editor.bat

# 命令行模式
./run_game.bat --editor      # 编辑器模式
./run_game.bat --headless    # 无窗口服务器模式
```

**前提**: 需要安装 [Godot Engine 4.6.2+](https://godotengine.org/download/).

---

## 操作说明

| 操作 | 键鼠 | 手柄 |
|------|------|------|
| 移动 | WASD / 方向键 | 左摇杆 / 十字键 |
| 瞄准 | 鼠标 | 右摇杆 |
| 射击 | 左键 | RT (R2) |
| 瞄准切换 | 右键 | LT (L2) |
| 跳跃 | 空格 | A / Cross |
| 菜单 | Esc | Start |
| 全屏 | F11 / Alt+Enter | — |
| 调试信息 | F3 | — |

---

## 技术栈

- **引擎**: Godot 4.6.2 (Forward+ 渲染)
- **语言**: GDScript 2.0 (100% 静态类型)
- **物理**: GodotPhysics 3D (CharacterBody3D)
- **动画**: AnimationTree + Root Motion
- **多人**: ENet MultiplayerPeer + RPC
- **CI/CD**: GitHub Actions (格式检查 + Godot headless 验证)

---

## 项目架构

```
main/main.gd          → 根节点，场景切换（菜单↔关卡）
  ├── menu/menu.gd    → 主菜单
  ├── menu/settings.gd → Autoload 单例，图形设置
  └── level/level.gd  → 关卡管理

player/
  ├── player.gd       → Player (CharacterBody3D)
  ├── player_input.gd → 输入同步
  └── bullet/bullet.gd → 子弹

enemies/red_robot/
  ├── red_robot.gd    → 敌人AI (APPROACH→AIM→SHOOTING)
  └── parts/part.gd   → 死亡部件物理
```

---

## AI 开发基础设施

| 类别 | 数量 | 说明 |
|------|------|------|
| Godot Agent | 8 个 | 5 CCGS + 3 Agency-Agents |
| 开发 Skill | 85+ | 72 CCGS + 13 Superpowers |
| Godot MCP | 2 个 | Coding-Solo + MCP Pro/Native 备选 |
| Guardrails | ai-dev-guardrails v3.0 | M1-M9 + L0-L5 五层防御 |

---

## License

本项目基于 Godot 官方 TPS Demo ([MIT License](LICENSE.md)).

---

*Retro Horde — AI-assisted Godot 4.x game development.*
