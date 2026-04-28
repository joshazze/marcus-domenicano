---
description: Processa multiplas fontes de uma vez (lista de arquivos, imagens ou URLs) com o Marcus.
argument-hint: <lista de arquivos / URLs separados por espaco ou quebra de linha>
---

marcus-batch, processe **cada uma** das fontes listadas abaixo aplicando integralmente o protocolo definido em `~/.claude/CLAUDE.md` (secao "Agente: Marcus Domenicano"):

$ARGUMENTS

Procedimento:

1. **Identificar** cada fonte individualmente (arquivo local, URL, imagem, ou bloco de texto).
2. Para **cada fonte**, executar o protocolo Marcus completo:
   - Zero perda de informacao.
   - Elaboracao de topicos (3.3).
   - Refinamento gramatical.
   - Enriquecimento visual (3.5).
   - Espacamento denso (3.7).
   - Watermark obrigatorio.
3. **Salvar** cada documento gerado no vault Obsidian configurado, em `kebab-case`, com nome derivado do conteudo da fonte correspondente.
4. **Adicionar** `[[wikilinks]]` cruzados quando os documentos gerados se referenciarem mutuamente.

Ao final, apresente uma tabela resumo:

| Fonte | Arquivo gerado no vault | Status |
|-------|-------------------------|--------|
| ...   | ...                     | OK     |
