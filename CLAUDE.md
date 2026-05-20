# Retro Horde — Godot 4.6 TPS 复古弹幕生存射击

> **引擎**: Godot 4.6.2 | **语言**: GDScript | **类型**: Third-Person Shooter Horde Survival
> **路径**: `D:\Godot Projects\retro-horde-tps\`
> **基线**: godotengine/tps-demo master 分支
> **AI框架**: WorkBuddy + 26 CCGS Skills + 5 Godot Agents + Godot MCP

---

## 技术栈

| 项目 | 详情 |
|------|------|
| **引擎** | Godot 4.6.2.stable (WinGet 安装) |
| **语言** | GDScript 2.0 (100%静态类型) |
| **渲染** | Forward+, SDFGI/VoxelGI/LightmapGI |
| **物理** | GodotPhysics 3D (CharacterBody3D) |
| **动画** | AnimationTree + Root Motion |
| **多人** | ENet MultiplayerPeer + RPC |
| **脚本** | 15个 `.gd` 文件, 17个 `.tscn` 场景 |
| **快速启动** | `run_game.bat` (运行) / `run_editor.bat` (编辑器) |

---

## 项目架构

```
main/main.gd          → 根节点，场景切换（菜单↔关卡）
  ├── menu/menu.gd    → 主菜单：Play/Settings/Online/Quit
  ├── menu/settings.gd → Autoload 单例，图形设置持久化
  └── level/level.gd  → 关卡管理：敌人生成、玩家生成、GI设置
  
player/
  ├── player.gd       → Player (CharacterBody3D)：动画、射击、相机震动
  ├── player_input.gd → PlayerInputSynchronizer：键鼠/手柄
  └── bullet/bullet.gd → 子弹飞行、碰撞检测、爆炸效果

enemies/red_robot/
  ├── red_robot.gd    → 敌人AI：APPROACH→AIM→SHOOTING 状态机 (5HP)
  └── parts/part.gd   → 死亡部件物理

door/door.gd          → Area3D 自动门
level/debug.gd        → Label HUD (FPS/内存/在线状态)
```

---

## 核心机制

- **玩家**: WASD 移动、鼠标瞄准、左键射击、空格跳跃、右键瞄准切换
- **敌人**: 红机器人，射线检测玩家，瞄准后发射激光，15秒重生
- **多人**: 支持 ENet 在线多人 (Host/Client)
- **图形**: SDFGI/VoxelGI/LightmapGI 三选一，MetalFX/FSR2 缩放

---

## 可用 AI Agents (8个 Godot 专属)

### CCGS Agent (5个 — 通用架构/编码/性能)
| Agent | 路径 | 使用场景 |
|-------|------|---------|
| `godot-specialist` | `.workbuddy/agents/godot-specialist.md` | 架构决策、场景/节点设计、最佳实践 |
| `godot-gdscript-specialist` | `.workbuddy/agents/godot-gdscript-specialist.md` | GDScript 编码规范、信号架构、静态类型 |
| `godot-shader-specialist` | `.workbuddy/agents/godot-shader-specialist.md` | 着色器、粒子特效、渲染优化 |
| `godot-csharp-specialist` | `.workbuddy/agents/godot-csharp-specialist.md` | C# 集成（本项目以 GDScript 为主） |
| `godot-gdextension-specialist` | `.workbuddy/agents/godot-gdextension-specialist.md` | C++/Rust 原生扩展（性能关键代码） |

### Agency-Agents Agent (3个 — 深度实战代码模式)
| Agent | 路径 | 使用场景 |
|-------|------|---------|
| `godot-gameplay-scripter` | `.workbuddy/agents/godot-gameplay-scripter.md` | 信号架构设计、EventBus模式、节点组合、Resource数据设计 **(v0.0.2首选)** |
| `godot-multiplayer-engineer` | `.workbuddy/agents/godot-multiplayer-engineer.md` | ENet/WebRTC、RPC安全校验、权威模型、MultiplayerSpawner |
| `godot-shader-developer` | `.workbuddy/agents/godot-shader-developer.md` | Godot着色语言范例、VisualShader、CompositorEffect后处理 |

**激活方式**: 建议先加载 `godot-specialist` 获取全局架构，再加载 `godot-gameplay-scripter` 获取实战代码模式。

---

## 可用 Skills (72个 CCGS + 13个 Superpowers 游戏开发工作流)

### 工作流入口
| Skill | 用途 |
|-------|------|
| `start` / `help` | 引导式入职 / 可用命令 |
| `project-stage-detect` | 自动检测项目阶段 |
| `onboard` | 新成员入职引导 |

### 设计阶段
| Skill | 用途 |
|-------|------|
| `brainstorm` | 创意构思 (MDA框架/玩家心理学) |
| `quick-design` | 快速设计决策 |
| `design-system` | 系统设计 (战斗/敌人/武器) |
| `design-review` | 设计审查 |
| `reverse-document` | 从现有代码生成设计文档 |
| `create-architecture` | 系统架构蓝图设计 |
| `architecture-decision` | 架构决策记录 (ADR) |
| `architecture-review` | 架构审查 |
| `map-systems` | 系统依赖关系映射 |
| `ux-design` / `ux-review` | UI/UX 设计与审查 |
| `art-bible` | 美术风格指南定义 |

### 开发阶段
| Skill | 用途 |
|-------|------|
| `setup-engine` | 引擎配置 |
| `adopt` | 已有项目接入 (Brownfield) |
| `create-stories` / `create-epics` | 创建设计故事 / 史诗拆分 |
| `dev-story` | 实现开发故事 |
| `story-done` / `story-readiness` | 故事完成验收 / 就绪检查 |
| `sprint-plan` / `sprint-status` | Sprint 规划/状态 |
| `prototype` | 快速原型验证 (弹幕模式首选) |
| `code-review` | 代码审查 |
| `perf-profile` | 性能分析 |
| `estimate` / `scope-check` | 工作量估算 / 范围蔓延检查 |
| `tech-debt` | 技术债务追踪 |
| `consistency-check` | 代码/资产一致性检查 |

### 测试 & QA
| Skill | 用途 |
|-------|------|
| `qa-plan` | QA计划 |
| `smoke-check` | 冒烟测试 |
| `gate-check` | 质量门禁 |
| `regression-suite` | 回归测试套件 |
| `soak-test` | 长时间稳定性测试 |
| `bug-report` / `bug-triage` | Bug 报告 / 分类 |
| `test-setup` / `test-helpers` | 测试环境搭建 / 辅助工具 |
| `test-evidence-review` / `test-flakiness` | 测试证据审查 / 不稳定测试 |

### 资源阶段
| Skill | 用途 |
|-------|------|
| `asset-audit` / `asset-spec` | 素材审计 / 规格定义 |
| `content-audit` | 游戏内容审计 |
| `create-control-manifest` | 操作清单 (键盘/手柄映射) |

### 数值 & 平衡
| Skill | 用途 |
|-------|------|
| `balance-check` | 数值平衡验证 (波次/伤害/掉落) |
| `playtest-report` | 玩家体验测试报告 |

### 团队协作
| Skill | 用途 |
|-------|------|
| `team-combat` / `team-level` | 战斗 / 关卡团队协调 |
| `team-ui` / `team-polish` | UI / 打磨团队协调 |
| `team-audio` / `team-narrative` | 音频 / 叙事团队协调 |
| `team-qa` / `team-release` | QA / 发布团队协调 |
| `team-live-ops` | 线上运营团队协调 |

### 发布 & 维护
| Skill | 用途 |
|-------|------|
| `changelog` / `patch-notes` | 变更日志 / 补丁说明 |
| `release-checklist` / `launch-checklist` | 发布 / 上线前检查清单 |
| `day-one-patch` / `hotfix` | 首日补丁 / 紧急修复 |
| `retrospective` / `milestone-review` | 回顾复盘 / 里程碑审查 |
| `localize` | 多语言本地化 |
| `review-all-gdds` | 全局设计文档一致性审查 |
| `propagate-design-change` | 设计变更影响传播 |
| `security-audit` | 安全审计 (RPC/多人安全) |

### 元技能
| Skill | 用途 |
|-------|------|
| `skill-improve` / `skill-test` | 技能优化 / 技能测试 |

### Superpowers (已安装 13 个)
| Skill | 用途 |
|-------|------|
| `brainstorming` | 创意构思与需求探索 |
| `writing-plans` / `executing-plans` | 实现计划编写 / 执行 |
| `test-driven-development` | TDD：先写测试再写代码 |
| `systematic-debugging` | 系统性调试方法论 |
| `subagent-driven-development` | 多 Agent 并行开发 |
| `dispatching-parallel-agents` | 并行任务调度 |
| `requesting-code-review` / `receiving-code-review` | 请求/接收代码审查 |
| `verification-before-completion` | 完成前验证 |
| `using-git-worktrees` | Git Worktree 隔离开发 |
| `writing-skills` | 编写/优化 Skill |
| `finishing-a-development-branch` | 分支完成与合并 |

**Skills 路径**: `.workbuddy/skills/<skill-name>/SKILL.md`

---

## MCP 配置

### 已配置 MCP 服务器

| 服务器 | 配置路径 | 用途 |
|--------|---------|------|
| **godot** | `~/.workbuddy/mcp.json` | Godot 引擎交互 (启动/编辑/运行/调试输出) |
| **github** | Connector | GitHub 仓库操作 |
| **kdocs** | Connector | 金山文档在线协作 |
| **notion** | Connector | Notion 知识库 |

### Godot MCP 方案对比

| 方案 | 工具数 | 费用 | 能力 | 状态 |
|------|--------|------|------|------|
| **Coding-Solo/godot-mcp** | ~10 | 免费 | 启动/运行/调试输出/场景创建/精灵加载 | ✅ 已安装 |
| **Godot MCP Pro** | 169 | $15 | 场景编辑/GDScript编写/输入模拟/运行时分析 | ⬜ 待评估 |
| **Godot-MCP-Native** | ~30 | 免费 | GDScript原生插件，编辑器内直接操作 | ⬜ 待安装 |

### Godot MCP (Coding-Solo/godot-mcp v0.1.1)
```json
{
  "godot": {
    "command": "node",
    "args": ["C:\\Users\\FJL03\\tools\\godot-mcp\\build\\index.js"],
    "env": {
      "GODOT_PATH": "C:\\Users\\FJL03\\AppData\\Local\\Microsoft\\WinGet\\Links\\godot.exe",
      "DEBUG": "false"
    }
  }
}
```

### Godot-MCP-Native 安装指南 (免费)
1. 下载: `https://github.com/yurineko73/Godot-MCP-Native`
2. 将 `addons/godot-mcp-native/` 复制到项目 `addons/`
3. Godot 编辑器 → Project Settings → Plugins → 启用 Godot MCP Native
4. 添加 MCP 配置:
```json
"godot-native": {
  "command": "node",
  "args": ["path/to/godot-mcp-native/bridge.js"],
  "env": { "GODOT_MCP_PORT": "6899" }
}
```

### 推荐升级: Godot MCP Pro ($15)
- 169 工具: 场景编辑、GDScript 编写、输入模拟、运行时分析
- 安装: https://godot-mcp.abyo.net/

---

## 编码规范 (GDScript)

本项目遵循 `godot-gdscript-specialist` agent 定义的完整规范，核心要点：

### 强制要求
- **ALL 变量/参数/返回值必须有静态类型注解**
- 使用 `class_name` 注册自定义类型
- 使用 `@export` + 类型提示暴露参数到编辑器
- Signals 用于解耦通信 (子→父, 系统→监听者)
- 直接方法调用用于向下通信 (父→子)

### 文件组织顺序
1. `class_name` 声明
2. `extends` 声明
3. 常量与枚举
4. Signals
5. `@export` 变量
6. Public 变量
7. Private 变量 (`_prefix`)
8. `@onready` 变量
9. 内置虚方法 (`_ready`, `_process`, `_physics_process`)
10. Public 方法
11. Private 方法
12. Signal 回调 (`_on_`)

### 性能规则
- 空闲时 `set_process(false)` / `set_physics_process(false)`
- 在 `@onready` 中缓存节点引用，不在 `_process` 中使用 `get_node()`
- 使用 `Tween` 而非 `_process` 手动插值
- 频繁生成的对象使用对象池

---

## 游戏素材

### 已有素材
- **3D 模型**: 15个 GLB (玩家/敌人/关卡/特效)
- **PBR 贴图**: 100+ PNG (albedo/normal/emission/orm)
- **音效**: 4个 WAV (射击/跳跃/落地/爆炸)

### 免费素材源
| 来源 | 许可 | 内容 |
|------|------|------|
| Poly Haven | CC0 | 高清 PBR 贴图/HDR/3D 模型 |
| Quaternius | CC0 | 低多边形角色/敌人/武器 |
| Kenney | CC0 | 3D 原型素材/音效/UI |
| freepbr.com | CC0 | 科幻 PBR 贴图合集 |
| ambientCG | CC0 | 1000+ PBR 材质 |

详见 `.workbuddy/ASSETS.md`

---

## 快速开始

```bash
# Windows 桌面
双击 run_editor.bat     → Godot 编辑器 (F5 实时测试)
双击 run_game.bat       → 直接运行游戏

# 命令行
./run_game.bat --editor → 编辑器模式
./run_game.bat --headless → 无窗口服务器模式
```

---

## CI/工作记忆

- **长记忆**: `.workbuddy/memory/MEMORY.md`
- **日报**: `.workbuddy/memory/YYYY-MM-DD.md`
- **路线图**: `.workbuddy/ROADMAP.md` (v0.0.1 → v0.1.0, 含Project Contract + Gate系统)
- **素材索引**: `.workbuddy/ASSETS.md`
- **护栏规范**: `E:\AISkills\Nagi_Skills\ai-dev-guardrails\` (五层防御: L0-L5/M1-M9)

## 开发路线图 (当前)

| 版本 | 核心内容 | 状态 |
|------|---------|------|
| ✅ v0.0.1 | 项目重整 + AI基础设施全量集成 (8 Agent/72 Skill) | ✅ 完成 |
| 🔜 v0.0.2 | 波次系统、弹幕模式、HP/得分/HUD (Plan Contract已锁定) | ⬜ 待启动 |
| 📋 v0.0.3 | 敌人种类扩展 (近战/弹幕/Boss，状态机) | ⬜ 规划中 |
| 📋 v0.0.4 | 武器系统 (3武器切换/弹药管理) | ⬜ 规划中 |
| 📋 v0.0.5 | 关卡与地图 (3手工关卡) | ⬜ 规划中 |
| 🎯 v0.1.0 | 完整可玩版本 (游戏循环/ConfigFile存档/导出) | ⬜ 规划中 |

> 详细路线图含 Project Contract、Gate 检查清单、DoD 验收标准、风险登记，见 `.workbuddy/ROADMAP.md`
> 开发行为护栏遵循 `ai-dev-guardrails` (M1-M9 + L0-L5 五层防御体系)
| 🔜 v0.0.2 | 波次系统、弹幕模式、得分系统、HP 系统 |
| 📋 v0.0.3 | 敌人种类扩展 (近战/远程弹幕/Boss) |
| 📋 v0.0.4 | 武器系统 (多武器切换/掉落/弹药) |
| 📋 v0.0.5 | 关卡与地图 (多关卡/程序化生成) |
| 🎯 v0.1.0 | 完整可玩版本 (游戏循环/存档/音效/打包) |

---

*WorkBuddy 驱动的 AI 辅助游戏开发项目。每次对话从 `.workbuddy/memory/` 恢复记忆。*
