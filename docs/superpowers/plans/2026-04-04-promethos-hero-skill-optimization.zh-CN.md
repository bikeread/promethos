# PromethOS 核心技能优化计划

> **给执行型 agent 的说明：** REQUIRED: 如支持 subagents，使用 `superpowers:subagent-driven-development`；否则使用 `superpowers:executing-plans` 来执行本计划。所有步骤都使用 checkbox（`- [ ]`）追踪。

**目标：** 优化 PromethOS 面向用户的前台体验，打磨 4 个最高杠杆 skill，并补齐与之对应的 example 和 eval，让这些改动的价值可以被证明。

**方案：** 保持现有库形态和 taxonomy 不变。主要在 `SKILL.md` 中优化触发语句、输出产物和 skill 边界；较长的例子下沉到 `references/`，以符合 `skill-creator` 对简洁性和渐进披露的要求。通过仓库校验脚本和 `docs/evals/` 中的原始 prompt 演练来验证改动。

**技术栈：** Markdown `SKILL.md`、`references/worked-example.md`、`docs/evals/*.md`、shell 校验脚本。

---

## Skill-Creator 约束

- 每个 `SKILL.md` 保持简洁；较长的例子和可复用产物放到 `references/`。
- `when_to_use`、trigger signals 和 examples 尽量使用真实用户语言。
- 自由度要清楚：边界和输出 contract 要刚性，表述方式可以保留适度弹性。
- 不新增与 skill 执行或评估无关的辅助文档。
- 验证时使用原始 prompt 和可检查的产物，不把预期答案提前塞进去。

### 任务 1：定义第一波 Prompt Battery 和验收标准

**文件：**
- Modify: `docs/evals/README.md`
- Modify: `docs/evals/normal-design-task.md`
- Modify: `docs/evals/permission-sensitive-task.md`
- Create: `docs/evals/minimal-eval-pack-task.md`

- [ ] **Step 1: 收紧第一波行为范围**

明确第一波优化只负责：
- 把 agent 设计问题正确分流
- 把模糊 agent 想法变成可用 brief
- 定义安全的自治边界
- 产出带负例的小型 eval harness

- [ ] **Step 2: 更新现有 eval 场景**

修改 `docs/evals/normal-design-task.md` 和 `docs/evals/permission-sensitive-task.md`，让它们直接测试第一波 skill 改完之后应该改善的前台行为。

- [ ] **Step 3: 增加一个 eval-harness 定向场景**

创建 `docs/evals/minimal-eval-pack-task.md`，核心 prompt 形状如下：
`We have an agent design, but no tests. Build the smallest eval pack that would catch unsafe or dishonest behavior.`

- [ ] **Step 4: 更新 eval 索引**

编辑 `docs/evals/README.md`，让 scenario inventory 和 scoring guidance 明确覆盖第一波 prompt battery。

- [ ] **Step 5: 跑仓库校验**

运行：
```bash
./scripts/validate-skills.sh
python3 ./scripts/check-repo-docs.py
```
预期：两个命令都通过，然后再进入 skill body 的改动。

### 任务 2：把 `using-promethos` 改造成真正的前台路由入口

**文件：**
- Modify: `skills/using-promethos/SKILL.md`

- [ ] **Step 1: 明确目标路由模式**

把前台入口收敛成 3 条主路径：
- 模糊的 agent 想法 -> `flow-agent-requirements-clarification`
- 风险自治或边界混乱 -> `guard-safe-autonomy-guardrails`
- “怎么证明它真的可用” -> `eval-agent-evaluation-harness` 或 `flow-verification-before-completion`

- [ ] **Step 2: 用更真实的用户语言替换抽象例子**

重写 example block，加入类似这些表达：
- “帮我搞个会自动审 PR 的 agent”
- “这个 bot 老是做不该做的事”
- “它差不多能用了，但我不知道怎么验”
- “我想让它能自己跑，但别乱动生产”

- [ ] **Step 3: 收紧 ownership 和 non-goals**

明确写清：`using-promethos` 是 routing/boundary skill，不替代 architecture、implementation planning，也不替代通用 workflow control。

- [ ] **Step 4: 强化 output contract**

把 output contract 改成输出：
- 哪个 PromethOS skill 应该接手
- 为什么它接手
- PromethOS 应该主导还是作为 overlay
- 下一步还卡在哪个 gap 或 ambiguity

- [ ] **Step 5: 跑仓库校验**

运行：
```bash
./scripts/validate-skills.sh
python3 ./scripts/check-repo-docs.py
```
预期：路由 skill 改完后两个命令仍通过。

### 任务 3：把 `flow-agent-requirements-clarification` 做成英雄入口 skill

**文件：**
- Modify: `skills/flow-agent-requirements-clarification/SKILL.md`
- Modify: `skills/flow-agent-requirements-clarification/references/worked-example.md`
- Modify: `docs/evals/normal-design-task.md`
- Modify: `docs/examples/README.md`

- [ ] **Step 1: 用真实 prompt 语言重写触发条件**

扩展 `when_to_use` 和 trigger signals，覆盖：
- “I want an assistant that...”
- “帮我做个 bot”
- “想做个 agent，能自动处理这些事”

- [ ] **Step 2: 让输出产物更可复用**

把 output contract 改成稳定的 requirements brief 结构：
- job
- operator 和 beneficiary
- primary artifact
- acceptance criteria
- tool/context surface
- non-goals
- minimum useful `v1`
- risks and open questions

- [ ] **Step 3: 保持 SKILL.md 精简，把重量下沉到 example**

更新 `references/worked-example.md`，展示一个更强的 before/after brief，但不要把主 `SKILL.md` 写成超长模板。

- [ ] **Step 4: 对齐公开 example 索引**

更新 `docs/examples/README.md`，把这个 skill 明确放进主力 worked example 入口。

- [ ] **Step 5: 手工重跑设计类 eval**

在干净 session 中运行：
```text
I want an agent that helps my team triage incident reports and draft follow-up tasks, but I'm not sure what the first version should actually do.
```
预期：先产出 requirements brief，再进入 architecture 或 implementation planning。

- [ ] **Step 6: 跑仓库校验**

运行：
```bash
./scripts/validate-skills.sh
python3 ./scripts/check-repo-docs.py
```
预期：英雄入口 skill 改完后两个命令仍通过。

### 任务 4：强化安全自治路径，同时避免与 permission mechanics 混层

**文件：**
- Modify: `skills/guard-safe-autonomy-guardrails/SKILL.md`
- Create: `skills/guard-safe-autonomy-guardrails/references/worked-example.md`
- Modify: `skills/cap-permission-model-design/SKILL.md`
- Modify: `docs/evals/permission-sensitive-task.md`
- Modify: `docs/examples/README.md`

- [ ] **Step 1: 让 guard skill 更具操作性**

围绕具体副作用重写风险讨论：
- read-only work
- local reversible edits
- destructive local changes
- external side effects
- privacy-sensitive actions
- financial 或 production-impacting actions

- [ ] **Step 2: 收紧它和 permission mechanics 的边界**

同时修改 `guard-safe-autonomy-guardrails/SKILL.md` 和 `cap-permission-model-design/SKILL.md`，明确：
- guardrails 决定 checkpoint philosophy
- permission-model 把这个 policy 映射成 enforceable defaults

- [ ] **Step 3: 增加一个 guard 层 worked example**

创建 `skills/guard-safe-autonomy-guardrails/references/worked-example.md`，示例场景是：agent 可以编辑配置、运行命令、联系外部服务时，应该如何定义 policy。

- [ ] **Step 4: 让 eval 能检查边界是否清晰**

更新 `docs/evals/permission-sensitive-task.md`，明确检查运行结果是否把 autonomy policy 和 permission classes 分开处理。

- [ ] **Step 5: 手工重跑 permission-sensitive eval**

在干净 session 中运行：
```text
Design safety boundaries for an agent that can edit production config, run deployment commands, browse the web, and message external services.
```
预期：先产出 checkpoint policy；只有在 policy 已经清楚时，才进入 permission mechanics。

- [ ] **Step 6: 跑仓库校验**

运行：
```bash
./scripts/validate-skills.sh
python3 ./scripts/check-repo-docs.py
```
预期：自治路径改完后两个命令仍通过。

### 任务 5：把 `eval-agent-evaluation-harness` 做成可复用的证明引擎

**文件：**
- Modify: `skills/eval-agent-evaluation-harness/SKILL.md`
- Create: `skills/eval-agent-evaluation-harness/references/worked-example.md`
- Modify: `docs/evals/README.md`
- Create: `docs/evals/minimal-eval-pack-task.md`
- Modify: `docs/examples/README.md`

- [ ] **Step 1: 让 eval 产物更明确**

把 output contract 改成清楚产出：
- prioritized behaviors
- scenario inventory
- scoring rubric
- inspectable artifacts
- rerun procedure

- [ ] **Step 2: 强化负例**

强化 workflow，明确要求：只要 agent 能做 consequential actions，就必须出现 refusal、checkpoint、escalation 或 approval-compliance 场景。

- [ ] **Step 3: 增加一个 worked example**

创建 `skills/eval-agent-evaluation-harness/references/worked-example.md`，示范如何给一个高风险 agent workflow 做紧凑 eval pack。

- [ ] **Step 4: 让 eval 文档和 skill 对齐**

更新 `docs/evals/README.md` 和 `docs/evals/minimal-eval-pack-task.md`，让公开 eval pack 和新 skill 的 artifact 形状保持一致。

- [ ] **Step 5: 手工重跑 eval-harness prompt**

在干净 session 中运行：
```text
We built an agent that drafts refund decisions and can message customers. We do not have tests yet. Build the smallest eval pack that would catch unsafe or misleading behavior.
```
预期：定义出一个紧凑 scenario set，至少包含一个负例安全场景，并带可复用 rubric。

- [ ] **Step 6: 跑仓库校验**

运行：
```bash
./scripts/validate-skills.sh
python3 ./scripts/check-repo-docs.py
```
预期：eval harness 改完后两个命令仍通过。

### 任务 6：执行一次新的第一波总验证

**文件：**
- Modify: `docs/examples/README.md`
- Modify: `docs/evals/README.md`

- [ ] **Step 1: 跑完整仓库校验**

运行：
```bash
./scripts/validate-skills.sh
python3 ./scripts/check-repo-docs.py
```
预期：新增 example 和 eval 引用后，两个命令都通过。

- [ ] **Step 2: 在 fresh sessions 中跑完整 prompt battery**

运行任务 3 到任务 5 里的代表性 prompt，以及更新后的 `docs/evals/` 场景。
预期：每次都能选中预期前台路径，产出预期 artifact，而不是漂移成泛泛 workflow 建议。

- [ ] **Step 3: 记录 pass / concerns / fail**

为每个 prompt 记录：
- 选中的 skill
- 产出的 artifact
- 边界错误（如果有）
- 改完后的 skill 是否依然简洁且有用

- [ ] **Step 4: 只做证据驱动的后续修正**

如果失败模式重复出现，只收紧 trigger language、output contract 或 example coverage。第一波不要新增 taxonomy skills。

- [ ] **Step 5: 提交第一波优化**

```bash
git add skills/using-promethos/SKILL.md \
  skills/flow-agent-requirements-clarification/SKILL.md \
  skills/flow-agent-requirements-clarification/references/worked-example.md \
  skills/guard-safe-autonomy-guardrails/SKILL.md \
  skills/guard-safe-autonomy-guardrails/references/worked-example.md \
  skills/cap-permission-model-design/SKILL.md \
  skills/eval-agent-evaluation-harness/SKILL.md \
  skills/eval-agent-evaluation-harness/references/worked-example.md \
  docs/examples/README.md \
  docs/evals/README.md \
  docs/evals/normal-design-task.md \
  docs/evals/permission-sensitive-task.md \
  docs/evals/minimal-eval-pack-task.md
git commit -m "Strengthen PromethOS hero skill paths"
```
