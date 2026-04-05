# PromethOS

[English](README.md) | 简体中文

PromethOS 是一套以 skills 为核心的框架，用于设计、治理、评估和演化跨行业的
agent 系统。

它将可复用的 `SKILL.md` 提示组织为一套方法论，覆盖 agent 的需求定义、架构设
计、上下文、记忆、权限、工具契约、护栏、评估与库本身的维护。

PromethOS 目前仍处于早期公开预览阶段：共享的 `skills/` 契约已经足够稳定，可
以实际使用和扩展；安装与分发则继续保持轻量，优先通过 `skills` CLI，手动安装
作为备用路径。

## 设计谱系

PromethOS 的内容来源上游是 Claude Code 的 agent 设计实践，但它并不是 Claude
Code runtime 的照搬版本。

这套库的目标是把上游运行时经验里可复用的 agent 开发原则抽出来，再沉淀成可跨
harness 复用的 skills、references 和 evals。

面向维护者的抽象框架文档见
[docs/framework/README.md](docs/framework/README.md)。

## 项目解决什么问题

PromethOS 为 agent 提供了一套结构化方法，用于回答这些关键问题：

- 这个 agent 系统到底应该做什么
- 它的各个子系统应该如何被良好设计
- 自治与风险边界应该如何划分
- 这个 agent 应该如何被评估与持续改进
- 这套 skills 库本身应该如何演化

整个库刻意保持轻量：一个规范的 `skills/` 目录，加上少量面向不同 harness 的入口
和适配文件。

当 PromethOS 与更通用的工作流库共存时，它的定位是 agent 领域的方法论层，而不
是去替代所有会话级流程控制。

## 快速开始

1. 如果你使用 Codex，推荐直接用 `skills` CLI 全局安装：

   ```bash
   npx skills add bikeread/promethos -g -a codex -s '*' --copy -y
   ```

2. 重启 Codex，然后确认 bootstrap 路由 skill 已可见。
3. 如果你更偏好手动安装，或使用其他 harness，请按对应文档操作：
   [Codex](.codex/INSTALL.md)、
   [Claude Code](docs/README.claude-code.md)、
   [Gemini CLI](docs/README.gemini.md)。

## 工作方式

1. 一个 routing/bootstrap skill 负责判断：PromethOS 是否应该接手，
   以及当前最先要回答的是哪个 agent 设计问题。
2. 核心入口层负责处理最常见、最先发生的决策：需求、自治边界、eval、
   调试和 readiness 验证。
3. 设计深化层负责架构、实现规划、上下文、记忆、权限、工具契约、委派和范围控制。
4. 维护者层负责库演化，以及把事故沉淀成可复用改进。

## 支持矩阵

| 平台 | 状态 | 安装文档 |
|---|---|---|
| Claude Code | 已提供文档 | [docs/README.claude-code.md](docs/README.claude-code.md) |
| Codex | 已提供文档 | [.codex/INSTALL.md](.codex/INSTALL.md) / [docs/README.codex.md](docs/README.codex.md) |
| Gemini CLI | 兼容 | [docs/README.gemini.md](docs/README.gemini.md) |

## Library Shape

PromethOS 正在被整理成三层公开结构：

- 核心入口层：`route-agent-design`、`define-agent-requirements`、
  `set-agent-autonomy-boundaries`、`build-agent-evals`、
  `debug-agent-failures`、`verify-agent-readiness`
- 设计深化层：架构、实现规划、上下文、记忆、权限、工具契约、委派与范围控制
- 维护者层：库演化、事故到改进

## 兼容性

PromethOS 既可以独立使用，也可以与更通用的工作流型 skill 库（例如 superpowers）
共存。

- 如果只安装 PromethOS，routing/bootstrap skill 可以引导完整的方法论流程。
- 如果已经有更强的会话级工作流系统在运行，应让它继续负责通用流程控制，例如
  brainstorming、通用实现规划和会话级执行纪律。
- 在共存模式下，PromethOS 负责 agent 系统的需求、架构、上下文、记忆、权限、自
  治、评估与库演化。

详细规则见 [docs/COMPATIBILITY.md](docs/COMPATIBILITY.md)。

## 仓库结构

```text
skills/
docs/
.codex/
.github/
GEMINI.md
gemini-extension.json
scripts/
```

关键维护文档：

- [docs/framework/README.md](docs/framework/README.md)
- [docs/references/README.md](docs/references/README.md)
- [docs/evals/README.md](docs/evals/README.md)
- [docs/ROADMAP.md](docs/ROADMAP.md)

## 参与贡献

欢迎贡献。新增或调整 skills 前，请先阅读
[CONTRIBUTING.md](CONTRIBUTING.md)。

如果涉及安全问题，请不要直接公开详细漏洞内容，而应遵循
[SECURITY.md](SECURITY.md) 中的流程。

## 社区

- 社区链接：[LINUX DO](https://linux.do)

## 许可证

PromethOS 使用 MIT 许可证，详见 [LICENSE](LICENSE)。
