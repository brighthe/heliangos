# AGENTS.md（Codex / Antigravity 等专属）

本文件指导 **Codex、Antigravity 等非-Claude AI** 在本仓库工作。**请先读通用上下文 [../common/context.md](../common/context.md)**——仓库定位、模块地图、微信模块工作方式、写作约定、可用能力、安全约束、隐私要求都在那里。本文件只补这些运行时的专属细节。

## 配置位置

- **Codex**：[.codex/](../../.codex/) 下 —— `agents/*.toml`（`intent-analyst`、`reply-reviewer`）、`hooks.json`（接线 Hook）、`hooks/`。
- **跨工具技能**：[.agents/skills/](../../.agents/skills/) 下 —— `wechat-work-style` 写作风格技能。

## Hook（“不驱动微信”硬约束的实现）

[.codex/hooks.json](../../.codex/hooks.json) 配置了 `PreToolUse` 钩子，拦截 computer-use 的键盘输入与批量动作（`type`/`key`/`hold_key`/`computer_batch`/`teach_batch`/`teach_step`）。脚本**复用 Claude 侧的** [.claude/hooks/block-wechat-automation.ps1](../../.claude/hooks/block-wechat-automation.ps1)，确保任何情况下都**不会替我打字或发送微信消息**。
