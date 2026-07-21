# Git 提交与推送工作流（本仓库）

> **触发时机**：用户要求提交（commit）或推送（push）到远程时，先读本文件再操作。本文件是操作规程，不是用户发起型任务，无需启动语——用户说“提交/推送”即触发。
>
> **机器级 git / SSH 配置已上移**：原生 git 原则、SSH over 443 鉴权、新机器一次性配置、各机现状与排错，统一见 `workstation` 仓库的 git 模块（[github.com/brighthe/workstation → git/README.md](https://github.com/brighthe/workstation/blob/main/git/README.md)；新机器可读 raw 版 `https://raw.githubusercontent.com/brighthe/workstation/main/git/README.md`）。本文件只保留 **heliangos 特有**的提交纪律。

`heliangos` 是**个人中枢库**（非代码项目），且是 **Public 仓库含真实人名与私人聊天记录**——提交纪律以“脱敏”为第一位。

## 操作要点（本仓库）

- 远程：`git@github.com:brighthe/heliangos.git`（SSH over 443，配置见上方 workstation 指针）。
- **Claude Code 在本机操作 git 用 PowerShell**（原生 Windows git），别用 Bash 工具（cygwin）。

## 提交纪律（本仓库 = Public 个人库，脱敏优先）

- **仅在用户明确要求时**提交/推送。
- **脱敏是硬约束**：本仓库公开可见且含真实人名、私人微信记录。提交前**逐一 `git diff` 已暂存内容**，确认没有把手机号、住址、第三方私密信息、未经许可的他人聊天原文等明文推出去；必要时先脱敏再提交。
- **只提交转写后的文字，绝不提交聊天截图/敏感附件**（见 [context.md](context.md) 微信模块约定）。`git status` 里出现图片/附件时停下核对。
- 用 `git status` 甄别，**只 `git add` 本次任务相关文件**，不要 `git add -A`。
- 提交信息用**简体中文**，结尾附 `Co-Authored-By: Claude <...>` 尾注。
- 在 `main` 上**直接提交，不开分支、不走 PR**。
