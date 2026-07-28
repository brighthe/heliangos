# heliangos

> **He Liang OS** — Liang He（何亮 / [brighthe](https://github.com/brighthe)）的个人中枢仓库。
>
> **Public 仓库**：真实联系人与聊天文本是本仓库的版本化资产；默认忠实记录，只有我明确要求时才脱敏。

本仓库把“我是谁、我和谁打交道、我们聊过什么”沉淀为结构化、可被 AI 读取的个人上下文，用于协助对外沟通、写作和决策。它不是代码项目，结构随实际需要渐进生长。

## 模块

| 模块 | 路径 | 说明 |
| --- | --- | --- |
| 自我档案 | [profile/](profile/) | 身份、背景、研究方向和对外口径；[profile/resume/](profile/resume/) 是 LaTeX 中文简历的权威版本 |
| 职业生命周期 | [career/](career/) | 任职、聘期、考核、出站等动态职业阶段事实 |
| 微信沟通 | [wechat/](wechat/) | 联系人档案、聊天原文、沟通口径和回复协助 |
| AI 规则 | [ai/](ai/) | 微信归档路由、写作风格与 Git 工作流等工具无关规则 |

未来新增邮件、日程或决策记录等模块时，在根目录建立语义明确的目录，并在本表登记。

## 文档职责

| 文档 | 唯一职责 |
| --- | --- |
| 本 README | 仓库定位、模块地图、AI 架构与使用入口 |
| [career/README.md](career/README.md) | 职业生命周期与原始材料边界 |
| [wechat/README.md](wechat/README.md) | 联系人目录、YAML schema、索引与信息边界 |
| [ai/wechat-workflow.md](ai/wechat-workflow.md) | 聊天归档、联系人定位和跨仓库事实路由 |
| [ai/wechat-writing-style.md](ai/wechat-writing-style.md) | 微信回复的共享写作风格 |
| [AGENTS.md](AGENTS.md) / [CLAUDE.md](CLAUDE.md) | 各 AI 运行时入口、配置位置与 Hook 差异 |
| [ai/git-workflow.md](ai/git-workflow.md) | 仅在 commit 或 push 时加载的 Git 纪律 |

通用规则按职责只维护一份；`.agents/`、`.claude/` 和 `.codex/` 只保留触发入口与运行时配置。

## 目录结构

```text
heliangos/
├── README.md
├── AGENTS.md
├── CLAUDE.md
├── ai/
│   ├── wechat-workflow.md
│   ├── wechat-writing-style.md
│   └── git-workflow.md
├── profile/
├── career/
├── wechat/
│   ├── README.md
│   ├── contacts/<姓名>.md
│   ├── templates/contact.md
│   └── indexes/
│       ├── by-context.md
│       └── by-repository.md
├── .agents/
├── .claude/
└── .codex/
```

## 用法速览

1. 新建联系人：复制 [wechat/templates/contact.md](wechat/templates/contact.md) 到 `wechat/contacts/<姓名>.md`，填写 frontmatter 与档案，并更新两个联系人索引。
2. 记录聊天：提供截图或文字，使用 `wechat-log-and-route` 或 `/log-chat <姓名>`；AI 忠实转写、去重追加，并路由明确的派生事实。
3. 起草回复：使用 `/draft-reply <姓名> <消息>`；AI 读取联系人档案，按 `wechat-work-style` 给出草稿。
4. 重要回复可使用 `intent-analyst` 分析来意、使用 `reply-reviewer` 审校；最终消息由我自己发送。

AI 不驱动微信，也不替我输入或发送消息。各运行时均通过 Hook 拦截 computer-use 的键盘输入与批量动作。

## GitHub 与 iCloud 边界

- GitHub 保存 Markdown、YAML、LaTeX、脚本、配置和其他可维护源文件，并负责同步与版本管理。
- iCloud 只保存 `.doc`、`.docx`、签章 PDF、扫描件、图片及其他原始材料，不镜像本 Git 工作区。
- Markdown 中引用 iCloud 材料时使用 `iCloudDrive:<relative-path>`，不写机器相关绝对路径。
