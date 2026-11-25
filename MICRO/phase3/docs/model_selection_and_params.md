# Phase 3.1 – Model Selection and Parameter Log

## Selected Model
- Model Name: CodeT5+
- Source: Hugging Face
- Model Type: Transformer-based encoder-decoder
- Execution Mode: Local (offline)

## Reason for Model Selection
- CodeT5+ is trained on large-scale source code corpora
- It captures structural and semantic properties of code
- Suitable for function-level and class-level semantic analysis
- Open-source and reproducible (no paid API dependency)

## Alternative Models Considered
- GPT-4 / GPT-4.5:
  - Rejected due to paid API dependency
- GraphCodeBERT:
  - Considered for future work (graph-aware reasoning)

## Parameter Configuration
- Input Unit: Fully Qualified Function/Class Name
- Output Labels:
  - Intent
  - Domain Entity
  - Business Role
- Temperature: Not applicable (deterministic inference)
- Max Tokens: Not applicable (rule-guided inference)

## Inference Strategy
- LLM-style semantic reasoning guided by prompt templates
- Rule-based normalization layer to ensure consistency
- Architectural and framework artifact filtering

## Limitations
- No free-text generative reasoning
- Domain semantics refined in subsequent phases
