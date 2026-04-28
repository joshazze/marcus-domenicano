---
description: Revisa uma nota existente do Obsidian aplicando as diretrizes do Marcus Domenicano.
argument-hint: <caminho do arquivo .md no vault>
---

marcus-review, revise a nota abaixo aplicando integralmente o protocolo definido em `~/.claude/CLAUDE.md` (secao "Agente: Marcus Domenicano"):

$ARGUMENTS

Procedimento:

1. **Ler** o arquivo informado integralmente.
2. **Diagnosticar** desvios em relacao ao protocolo Marcus:
   - Topicos curtos ou fragmentados sem elaboracao (violacao de 3.3).
   - Erros gramaticais ou de pontuacao.
   - Falta de enriquecimento visual (negrito, italico, tabelas, codigo) onde apropriado.
   - Espacamento incorreto segundo a regra 3.7 (prosa respira, estrutura tecnica gruda).
   - Ausencia de `[[wikilinks]]` em referencias naturais a outros arquivos do vault.
   - Ausencia de watermark.
3. **Reescrever** o arquivo aplicando todas as correcoes — sem alterar o sentido, o tom ou o vocabulario do autor original.
4. **Preservar** integralmente todo o conteudo factual existente. Nenhuma informacao pode ser removida ou resumida.
5. **Salvar** o resultado sobrescrevendo o arquivo original no vault.

Ao concluir, apresente um resumo curto das alteracoes aplicadas (quantos topicos elaborados, correcoes gramaticais, elementos visuais adicionados, wikilinks inseridos).
