# heliangos

> **He Liang OS** — Liang He（何亮 / [brighthe](https://github.com/brighthe)）的个人中枢仓库。
>
> ⚠️ **Private 仓库，含真实人名与私人聊天记录，请保持私有。**

把「我是谁、我和谁打交道、我们聊过什么」沉淀成结构化、可被 Claude Code 读取的个人上下文，让 Claude 在协助我处理对外沟通、写作与决策时有据可依。架构随需要渐进生长。

## 模块

| 模块 | 路径 | 说明 |
| --- | --- | --- |
| 自我档案 | [profile/](profile/) | 身份、背景、研究方向、对外口径，供各模块复用 |
| 微信沟通 | [wechat/](wechat/) | 与大连理工各位老师的微信聊天记录、沟通口径与**回复协助**（当前核心模块） |

未来可按需新增模块（邮件、人物档案、日程、决策记录等），在根目录开文件夹并在本表与 [CLAUDE.md](CLAUDE.md) 登记即可。

## Claude Code 能力

本仓库自带一套 Claude Code 配置（`.claude/`），编辑/回复时自动生效：

- **技能** `wechat-work-style`：微信工作沟通写作风格。
- **子代理** `intent-analyst`（拆解来意）、`reply-reviewer`（回复得体性审校）。
- **命令** `/draft-reply`（起草回复）、`/log-chat`（记录聊天）。
- **Hook**：拦截直接操作微信的工具，强制「只起草、不代发」。

同一套能力也打包为可安装插件 [`wechat-reply-kit`](plugins/wechat-reply-kit/)。

## 用法速览

1. 给某位老师建档：复制 [wechat/teachers/_TEMPLATE.md](wechat/teachers/_TEMPLATE.md) 为 `wechat/teachers/<姓名>.md`，填档案与口径。
2. 老师发来消息时，把消息粘贴给 Claude（或 `/log-chat` 记入文件），用 `/draft-reply` 起草回复。
3. 重要回复发出前，用 `/review-reply` 思路（委派 `reply-reviewer`）做一遍得体性检查。
4. **自己复制、发送**——Claude 只产出草稿。
