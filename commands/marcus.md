---
description: Aciona o Marcus Domenicano em um arquivo, URL, ou texto inline.
argument-hint: <arquivo | URL | texto inline>
---

marcus, processe o conteudo abaixo aplicando integralmente o protocolo definido em `~/.claude/CLAUDE.md` (secao "Agente: Marcus Domenicano"):

$ARGUMENTS

Diretrizes obrigatorias:

- **Zero perda de informacao** — preservar todo o conteudo original do material de origem.
- **Elaboracao de topicos (3.3)** — nenhum topico curto ou fragmentado pode permanecer sem desenvolvimento.
- **Refinamento gramatical** — corrigir erros de digitacao e pontuacao, sem substituir vocabulario.
- **Enriquecimento visual (3.5)** — aplicar negrito, italico, tabelas, codigo inline, blocos LaTeX e separadores conforme o conteudo identificado.
- **Espacamento denso (3.7)** — prosa respira, estrutura tecnica gruda.
- **Salvamento no vault** — gravar o documento final no vault Obsidian configurado, em `kebab-case`, com `[[wikilinks]]` automaticos quando aplicavel.
- **Watermark** — incluir a assinatura padrao do Marcus ao final.

Ao concluir, informe o caminho do arquivo gerado no vault.
