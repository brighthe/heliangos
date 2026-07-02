# heliangos

> **He Liang OS** — Liang He（何亮 / [brighthe](https://github.com/brighthe)）的个人中枢仓库。
>
> ⚠️ **Public 仓库**：含真实人名与私人聊天记录，公开可见。写入/提交前请对敏感内容从严把关、必要时脱敏。

把「我是谁、我和谁打交道、我们聊过什么」沉淀成结构化、可被 AI（Claude Code / Codex 等）读取的个人上下文，让 AI 在协助我处理对外沟通、写作与决策时有据可依。架构随需要渐进生长。

## 模块

| 模块 | 路径 | 说明 |
| --- | --- | --- |
| 自我档案 | [profile/](profile/) | 身份、背景、研究方向、对外口径，供各模块复用 |
| 微信沟通 | [wechat/](wechat/) | 与各工作对象的微信聊天记录、沟通口径与**回复协助**（当前核心模块）。子模块：[大连理工大学博士后](wechat/大连理工大学博士后/)、[高校求职](wechat/高校求职/) |

未来可按需新增模块（邮件、人物档案、日程、决策记录等），在根目录开文件夹并在本表与 [ai/common/context.md](ai/common/context.md) 登记即可。

## AI 架构

本仓库同时服务多个 AI 工具（Claude Code、Codex、Antigravity 等）。整体分**三层**，各层职责与"能不能挪动"都不同：

```
heliangos/
├── README.md                  # ① 门面：给人看（GitHub 首页）
├── CLAUDE.md / AGENTS.md      # ② 指令层·根桩：各 7 行，只指路（工具从根目录自动加载，必须留根）
├── ai/                        # ② 指令层·正文
│   ├── common/context.md      #    ★ 所有 AI 共享上下文的唯一来源
│   ├── claude/CLAUDE.md       #    Claude Code 专属细节（配置位置、hook 实现）
│   └── agents/AGENTS.md       #    Codex 等专属细节
├── .claude/                   # ③ 可执行配置：Claude Code（技能/子代理/命令/settings + hook 脚本）
├── .codex/                    # ③ 可执行配置：Codex（子代理 toml + hooks.json）
├── .agents/                   # ③ 可执行配置：跨工具技能目录（Codex 等按此约定发现技能）
└── profile/  wechat/          # 内容资产：仓库的真正价值（见上"模块"表）
```

### 设计原则

- **散文 vs 可执行**：能靠"叮嘱"实现的（工作方式、写作约定、隐私要求）写成 Markdown 进指令层；必须**被触发、具名调用或强制拦截**才成立的（斜杠命令、技能、子代理、安全 hook）做成可执行配置进 ③。
- **消重**：通用规则只存一份于 [ai/common/context.md](ai/common/context.md)——改它，所有 AI 同时生效。根 `CLAUDE.md`/`AGENTS.md` 是薄桩（工具约定在根目录找它们，删/挪即失效），`ai/` 下两份专属文件只写运行时差异。
- **刻意冗余仅一处**：`wechat-work-style` 技能在 `.claude/skills/` 与 `.agents/skills/` 各一份（两家工具各认各的目录、格式无法合并），**修改时需手工同步**；hook 脚本只有 `.claude/hooks/` 一份，`.codex/hooks.json` 直接复用它。

### 能力清单（各 AI 均已配备）

- **技能** `wechat-work-style`：微信工作沟通写作风格。
- **子代理** `intent-analyst`（拆解来意）、`reply-reviewer`（回复得体性审校）。
- **命令** `/log-chat`（把粘贴的聊天截图/文字转写归档）、`/draft-reply`（起草回复）。
- **安全 hook**（硬约束）：`PreToolUse` 拦截 computer-use 的键盘输入与批量动作，确保 AI **任何情况下不会替我打字或发送微信消息**——这是写进拦截器的保证，不是靠模型自觉的请求。

## 用法速览

1. 给某位老师建档：复制 [wechat/大连理工大学博士后/_TEMPLATE.md](wechat/大连理工大学博士后/_TEMPLATE.md) 为 `teachers/<姓名>.md`，填档案，并在子模块 README 登记。
2. 记录聊天：把与老师的微信**截图**（或文字）发给 Claude，`/log-chat <老师>`——转写成文字、按时间去重追加到该老师文件（只存文字，不存截图）。
3. 起草回复：`/draft-reply <老师> <消息>`，Claude 读档案与历史后给草稿。
4. 重要回复发出前，委派 `reply-reviewer` 做一遍得体性检查。
5. **自己复制、发送**——Claude 只产出回复草稿，绝不替你发送。
