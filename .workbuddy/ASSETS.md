# Retro Horde — 游戏素材资源规划与索引

> 版本化素材获取计划：v0.0.2 弹幕生存核心 → v0.1.0 完整可玩版本

---

## 一、已有素材盘点

### 3D模型 (15个 GLB)
| 模型 | 路径 | 用途 |
|------|------|------|
| 玩家角色 | `player/model/player.glb` | 机器人角色 |
| 红机器人 | `enemies/red_robot/model/red_robot.glb` | 唯一敌人类型 |
| 头部/护盾部件 | `enemies/red_robot/parts/` | 死亡碎片物理 |
| 激光射线 | `enemies/red_robot/parts/ray.glb` | 武器效果 |
| 关卡建筑 | `level/geometry/models/core.glb` | 核心建筑 |
| 建筑结构 | `level/geometry/models/structure.glb` | 关卡结构 |
| 场景道具 | `level/geometry/models/props.glb` | 装饰物 |
| 灯光模型 | `level/geometry/models/lights.glb` | 光源 |
| 叉车 | `level/forklift/flying_forklift.glb` | 物理交互物 |
| 爆炸特效 | `effects_shared/BlastMesh.glb` | 爆炸 |
| 枪管烟雾 | `enemies/red_robot/laser/BarrelSmoke.glb` | 特效 |
| 激光冲击 | `enemies/red_robot/laser/impact_effect/LightRaysMesh.glb` | 特效 |
| 火花粒子 | `enemies/red_robot/parts/sparks_effect/SparkParticle.glb` | 特效 |
| 室外灯光 | `level/textures/structure/Core/CoreOutLight.glb` | 环境 |

### PBR贴图
- 所有模型配套：albedo / normal / emission / ORM (roughness/metallic/ao)
- 特效贴图：爆炸、烟雾、火花、光线

### 音效 (4个 WAV)
- 玩家射击、跳跃、落地
- 敌人爆炸

### UI
- 主菜单 (Play/Settings/Online/Quit)
- Settings 子菜单 (全图形选项)
- 加载进度条
- Debug HUD Label

---

## 二、版本化素材需求路线图

### v0.0.2 — 弹幕生存核心（优先级：🔴紧急）

| # | 素材类型 | 数量 | 用途 | 推荐来源 |
|---|---------|------|------|---------|
| 1 | **HUD UI 组件** | 1套 | 波次号 + 得分 + HP条 + 剩余敌人 | 自建(Godot Control) + Themey |
| 2 | **子弹弹幕模型** | 3-5种 | 不同颜色/形状弹幕投射物 | Kenney Prototype Pack |
| 3 | **命中特效** | 2-3种 | 弹幕命中玩家反馈 | 项目已有 + Poly Haven |
| 4 | **敌人死亡特效** | 1-2种 | 击杀反馈粒子 | 项目已有 BlastMesh |
| 5 | **伤害数字字体** | 1个 | 伤害飘字 TTF | Google Fonts (Orbitron/PressStart2P) |
| 6 | **UI 音效** | 5-8个 | 按钮点击、波次提示、得分、死亡 | mixkit.co / freesound.org |

### v0.0.3 — 敌人种类扩展（优先级：🟡高）

| # | 素材类型 | 数量 | 用途 | 推荐来源 |
|---|---------|------|------|---------|
| 1 | **近战敌人模型** | 1-2个 | 冲撞/自爆型 | Quaternius Monsters Pack |
| 2 | **弹幕敌人模型** | 1-2个 | 远程扇形弹幕 | Quaternius Sci-Fi Robots |
| 3 | **Boss 敌人模型** | 1个 | 大型阶段切换 Boss | Quaternius Ultimate Monsters |
| 4 | **敌人弹幕 VFX** | 3-5种 | 扇形/圆形/螺旋弹幕 | 自建(Godot粒子系统) |
| 5 | **敌人音效包** | 10-15个 | 各敌人移动/攻击/死亡 | freesound.org |

### v0.0.4 — 武器系统（优先级：🟡高）

| # | 素材类型 | 数量 | 用途 | 推荐来源 |
|---|---------|------|------|---------|
| 1 | **散弹枪模型** | 1个 | 武器1 | Quaternius Guns Pack |
| 2 | **步枪模型** | 1个 | 武器2 | Quaternius Sci-Fi Weapons |
| 3 | **火箭筒模型** | 1个 | 武器3 | Quaternius Guns Pack |
| 4 | **武器拾取物** | 3个 | 掉落道具 | Kenney 3D Icons |
| 5 | **弹药箱模型** | 1个 | 弹药拾取 | Kenney Prototype Pack |
| 6 | **武器切换动画** | 3组 | 切枪/换弹/射击 | 自建(AnimationPlayer) |
| 7 | **武器音效** | 10-15个 | 射击/换弹/空仓 | mixkit.co |

### v0.0.5 — 关卡与地图（优先级：🟢中）

| # | 素材类型 | 数量 | 用途 | 推荐来源 |
|---|---------|------|------|---------|
| 1 | **关卡模块化组件** | 1套 | 程序化地图拼接 | Quaternius Modular Sci-Fi |
| 2 | **可破坏物体** | 3-5个 | 场景障碍物 | Quaternius Props |
| 3 | **HDR 天空盒** | 2-3个 | 不同关卡天空 | Poly Haven HDRIs |
| 4 | **环境粒子** | 3-5个 | 灰尘/烟雾/火花 | 自建(Godot粒子) |

### v0.1.0 — 完整版本（优先级：🟢中）

| # | 素材类型 | 数量 | 用途 | 推荐来源 |
|---|---------|------|------|---------|
| 1 | **BGM 音乐** | 2-3首 | 菜单+战斗+结算 | OpenGameArt / Incompetech |
| 2 | **环境音** | 5-8个 | 风声/机械/警报 | freesound.org |
| 3 | **完整 UI 主题** | 1套 | 菜单→HUD→结算→排行榜 | Themey + 自建 |
| 4 | **加载画面** | 2-3张 | 关卡过渡 | 自建(CanvasLayer) |

---

## 三、UI 设计资源与开源项目

### Godot 原生 UI 框架/主题

| 项目 | 许可 | 描述 | 获取 |
|------|------|------|------|
| **Themey** | MIT | Godot 4 Theme 框架，预置色彩/字体/组件样式，深色主题 | `github.com/wadlo/Themey` |
| **Godot UI Components (MrEliptik)** | MIT | 现代游戏 UI 组件：生命条、小地图、设置菜单、对话框 | Godot Asset Library |
| **Godot Game UI** | MIT | 游戏 HUD 模板：准星、弹药计数、HP条、minimap | Godot Asset Library |
| **Godot Interface Bundle** | MIT | 完整 UI kit：按钮/滑块/面板/弹窗 | Godot Asset Library |
| **GlassBR DFX** | MIT | 毛玻璃效果 UI 主题，科幻风格 | Godot Asset Library |

### HUD/弹幕游戏 UI 设计参考

弹幕生存类游戏的 HUD 设计原则：
- **信息密度高但不杂乱** — 波次号、得分、HP、弹药、小地图 5 个核心元素
- **视觉优先级**: HP > 得分 > 波次号 > 弹药 > 小地图
- **颜色编码**: 红色=危险(低HP)、黄色=警告(波次提示)、绿色=正向(得分/治疗)
- **屏幕边角布局**: 左上=HP，右上=波次/得分，右下=武器/弹药，左下=小地图
- **弹幕可见性**: HUD 元素不能遮挡屏幕中央弹幕区域

在 Godot 中构建 HUD 的技术方案：
1. `CanvasLayer` (layer 1) — 准星/命中标记
2. `CanvasLayer` (layer 2) — HP/得分/波次 HUD
3. `CanvasLayer` (layer 3) — 伤害飘字/击杀提示
4. `ColorRect` + `Theme` — 统一的视觉风格

### 推荐的 UI 字体（Google Fonts 免费商用）

| 字体 | 风格 | 用途 |
|------|------|------|
| **Orbitron** | 科幻几何 | 波次号、得分数字 |
| **Press Start 2P** | 8-bit 像素 | 复古风格标题 |
| **Rajdhani** | 工业科幻 | HUD 标签、弹药计数 |
| **Barlow Condensed** | 军事风格 | 通用 UI 文字 |
| **Chakra Petch** | 泰式科技 | 武器名称、提示文字 |

获取：`fonts.google.com` → 下载 TTF → 拖入 Godot → FontVariation 配置大小/粗细

---

## 四、敌人模型获取方案

### 已选来源：Quaternius（CC0 全免费）

Quaternius 是 Godot 社区最推荐的免费 3D 模型源，所有模型 `.glb` 格式可直接导入 Godot 4.x，三角面数适合游戏实时渲染。

| 资源包 | 内容 | 获取 | 匹配版本 |
|--------|------|------|---------|
| **Ultimate Monsters** | 200+ 怪物：僵尸/骷髅/恶魔/史莱姆/Boss | `quaternius.com` → Free 3D Assets | v0.0.3 全敌人 |
| **Sci-Fi Robots** | 机器人/机甲/无人机 | 同上 | v0.0.3 弹幕型 |
| **Zombie Pack** | 多种僵尸变体 | 同上 | v0.0.3 近战型 |
| **Ultimate Guns** | 手枪/步枪/散弹/火箭筒/狙击 | 同上 | v0.0.4 全部武器 |
| **Sci-Fi Weapons** | 能量武器/激光枪 | 同上 | v0.0.4 高级武器 |
| **Modular Sci-Fi** | 科幻模块化建筑组件 | 同上 | v0.0.5 关卡拼接 |
| **Sci-Fi Props** | 箱子/桶/面板/管道 | 同上 | v0.0.5 场景道具 |

### 备选来源

| 来源 | 许可 | 特点 |
|------|------|------|
| **Kenney Prototype** | CC0 | 基础几何体原型，适合占位和快速迭代 |
| **Poly Haven** | CC0 | 高质量写实模型，适合参考和高端素材 |
| **OpenGameArt** | CC0/CC-BY | 数量庞大，质量参差，需筛选 |

---

## 五、环境与贴图资源

### PBR 贴图（科幻/工业风格）

| 来源 | 贴图数量 | 推荐分类 | 分辨率 |
|------|---------|---------|--------|
| **ambientCG** | 1000+ | Metal/Concrete/Panel/Grate/Tile | 2K/4K/8K |
| **freepbr.com** | 100+ | Sci-Fi Panels, Industrial Metal, Grunge | 2K/4K |
| **Poly Haven** | 500+ | Textures → 搜索 "metal"/"concrete"/"floor" | 1K-8K |
| **TextureCan** | 200+ | 各类PBR，4K免费 | 4K |

### 导入到 Godot 的标准流程

```
1. 下载贴图 → 得到 albedo.png / normal.png / roughness.png / metallic.png / ao.png
2. 拖入 Godot 文件系统
3. 创建 StandardMaterial3D → 设置：
   - Albedo: albedo.png
   - Normal Map: normal.png
   - ORM 通道: 需要合并 roughness(红)/metallic(绿)/ao(蓝) 为单张 ORM.png
   - Emission: emission.png (可选)
4. 材质保存为 .tres 文件供复用
```

---

## 六、音效与音乐

### 免费音效源

| 来源 | 许可 | 内容 | 使用场景 |
|------|------|------|---------|
| **mixkit.co** | 免费用 | 高质感游戏音效 | 武器射击/爆炸/UI交互 |
| **freesound.org** | CC0/CC-BY | 海量用户上传 | 敌人叫声/环境音/脚步 |
| **ZapSplat** | 免费(需注册) | 专业音效库 | 粒子特效/机械音 |
| **Kenney Audio** | CC0 | 游戏音效合集 | 通用游戏音效 |

### 音乐来源

| 来源 | 许可 | 风格 |
|------|------|------|
| **Incompetech (Kevin MacLeod)** | CC-BY | 海量各类背景音乐 |
| **OpenGameArt** | 混合CC | 游戏专用BGM |
| **Peritune** | CC-BY | 幻想/战斗/电子BGM |
| **StreamBeats** | 免费用 | Lo-fi/电子/金属 |

---

## 七、VFX 与粒子特效

Godot 4 自带强大的粒子系统，优先使用引擎内建粒子而非外部素材：

| 特效 | 实现方式 | 优先级 |
|------|---------|--------|
| 弹幕投射物 | 自建 GDScript + MeshInstance3D 球体/立方体 + 发光材质 | v0.0.2 |
| 命中火花 | GPUParticles3D + 现有 SparkParticle | v0.0.2 |
| 敌人死亡爆炸 | GPUParticles3D + 现有 BlastMesh | v0.0.2 |
| 伤害飘字 | Label3D + Tween 动画 | v0.0.2 |
| 弹幕轨迹拖尾 | RibbonTrailMesh + Gradient | v0.0.2 |
| 武器枪口闪光 | GPUParticles3D + PointLight2D | v0.0.4 |
| Boss 阶段切换 | 屏幕震动 + 全屏闪白 + 粒子爆发 | v0.0.3 |
| 环境雾效 | Godot Environment → Volumetric Fog | v0.0.5 |

---

## 八、素材获取优先级行动清单

### 立即获取（本周）
```
☐ 1. Kenney Prototype Pack (.glb) — v0.0.2 弹幕投射物占位模型
☐ 2. Orbitron 字体 (.ttf) — HUD 数字显示
☐ 3. mixkit 音效包 — 射击/爆炸/UI 交互音效 (5-10个)
☐ 4. Themey Godot Theme 框架 — UI 基础主题
```

### v0.0.2 开发中获取
```
☐ 5. Quaternius Sci-Fi Robots (.glb) — 为 v0.0.3 准备敌人变体模型
☐ 6. Poly Haven 科幻 PBR 贴图 (10-15张) — 关卡材质增强
☐ 7. freesound 敌人音效 (15-20个) — 移动/攻击/死亡
```

### v0.0.3-v0.0.4 开发中获取
```
☐ 8. Quaternius Ultimate Monsters (.glb) — 近战/Boss 敌人
☐ 9. Quaternius Ultimate Guns (.glb) — 多武器模型
☐ 10. ambientCG PBR 贴图 (20-30张) — 关卡环境
☐ 11. Incompetech BGM — 菜单/战斗/结算音乐
```

### v0.0.5-v0.1.0 开发中获取
```
☐ 12. Quaternius Modular Sci-Fi — 关卡模块化组件
☐ 13. Poly Haven HDRIs — 天空盒
☐ 14. 完整音效/音乐整合
```

---

## 九、Godot 素材导入速查

| 素材类型 | 拖入后操作 | 注意事项 |
|---------|-----------|---------|
| `.glb` 模型 | 自动生成 `.import` → 创建 inherited scene | 检查 Scale (默认0.01可能需要改1.0) |
| `.png` 贴图 | 自动检测 normal/roughness → 设置压缩 VRAM | 非2的幂尺寸可压缩但无法 mipmap |
| `.ttf` 字体 | 自动生成 `.fontdata` → 创建 FontVariation | 中文需 CJK 字体 |
| `.wav` 音效 | 自动生成 `.sample` → AudioStreamPlayer | WAV 较大，Ogg Vorbis 更适合发布 |
| `.ogg` 音乐 | 同上，loop 属性设为 true | 循环点可偏移调整 |

---

*素材索引更新于 2026-05-20。v0.0.2 优先获取前 4 项。*
