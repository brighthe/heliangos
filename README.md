# heliangos

> **He Liang OS** — Liang He（何亮 / [brighthe](https://github.com/brighthe)）的个人中枢仓库。
>
> ⚠️ **Public 仓库**：含真实人名与私人聊天记录，公开可见。写入/提交前请对敏感内容从严把关、必要时脱敏。

把「我是谁、我和谁打交道、我们聊过什么」沉淀成结构化、可被 Claude Code 读取的个人上下文，让 Claude 在协助我处理对外沟通、写作与决策时有据可依。架构随需要渐进生长。

## 模块

| 模块 | 路径 | 说明 |
| --- | --- | --- |
| 自我档案 | [profile/](profile/) | 身份、背景、研究方向、对外口径，供各模块复用 |
| 微信沟通 | [wechat/](wechat/) | 与各工作对象的微信聊天记录、沟通口径与**回复协助**（当前核心模块）。子模块：[大连理工大学博士后](wechat/大连理工大学博士后/)、[高校求职](wechat/高校求职/) |

未来可按需新增模块（邮件、人物档案、日程、决策记录等），在根目录开文件夹并在本表与 [CLAUDE.md](CLAUDE.md) 登记即可。

## Claude Code 能力

本仓库自带一套 Claude Code 配置（`.claude/`），编辑/回复时自动生效：

- **技能** `wechat-work-style`：微信工作沟通写作风格。
- **子代理** `intent-analyst`（拆解来意）、`reply-reviewer`（回复得体性审校）。
- **命令** `/log-chat`（把粘贴的聊天截图/文字转写归档）、`/draft-reply`（起草回复）。
- **Hook**：拦截 computer-use 键盘/批量动作，确保 Claude 永不替你打字或发送微信消息。

同一套能力在 `.codex/` + `.agents/` + [AGENTS.md](AGENTS.md) 下也为 Codex 等其他 AI 各备了一份。

## 用法速览

1. 给某位老师建档：复制 [wechat/大连理工大学博士后/_TEMPLATE.md](wechat/大连理工大学博士后/_TEMPLATE.md) 为 `teachers/<姓名>.md`，填档案，并在子模块 README 登记。
2. 记录聊天：把与老师的微信**截图**（或文字）发给 Claude，`/log-chat <老师>`——转写成文字、按时间去重追加到该老师文件（只存文字，不存截图）。
3. 起草回复：`/draft-reply <老师> <消息>`，Claude 读档案与历史后给草稿。
4. 重要回复发出前，委派 `reply-reviewer` 做一遍得体性检查。
5. **自己复制、发送**——Claude 只产出回复草稿，绝不替你发送。
