# Emacs Cheat Sheet

Referência de atalhos, comandos e configurações do Emacs.

## 1. Convenções de teclado

| Notação | Significado |
| :--- | :--- |
| `C` | Ctrl |
| `M` | Meta (geralmente Alt) |
| `S` | Shift |
| `RET` | Enter |
| `SPC` | Espaço |

*Exemplo:* `C-x C-f` significa pressionar `Ctrl + X` e depois `Ctrl + F`.

---

## 2. Navegação do cursor

### Caracteres e linhas
| Atalho | Função | Descrição |
| :--- | :--- | :--- |
| `C-f` | `forward-char` | Avança um caractere |
| `C-b` | `backward-char` | Retrocede um caractere |
| `C-n` | `next-line` | Próxima linha |
| `C-p` | `previous-line` | Linha anterior |
| `C-a` | `beginning-of-line` | Início da linha |
| `C-e` | `end-of-line` | Final da linha |

### Palavras
| Atalho | Função | Descrição |
| :--- | :--- | :--- |
| `M-f` | `forward-word` | Próxima palavra |
| `M-b` | `backward-word` | Palavra anterior |
| `M-d` | `kill-word` | Apaga próxima palavra |
| `M-DEL` | `backward-kill-word` | Apaga palavra anterior |

### Sentenças
| Atalho | Função | Descrição |
| :--- | :--- | :--- |
| `M-a` | `backward-sentence` | Início da sentença anterior |
| `M-e` | `forward-sentence` | Final da sentença atual |

### Parágrafos
| Atalho | Função | Descrição |
| :--- | :--- | :--- |
| `M-{` | `backward-paragraph` | Parágrafo anterior |
| `M-}` | `forward-paragraph` | Próximo parágrafo |

### Buffer
| Atalho | Função | Descrição |
| :--- | :--- | :--- |
| `M-<` | `beginning-of-buffer` | Início do buffer |
| `M->` | `end-of-buffer` | Final do buffer |
| `C-v` | `scroll-up-command` | Avança uma página |
| `M-v` | `scroll-down-command` | Retrocede uma página |
| `C-l` | `recenter-top-bottom` | Reposiciona a visualização |

### Expressões Lisp
| Atalho | Função | Descrição |
| :--- | :--- | :--- |
| `C-M-f` | `forward-sexp` | Próxima expressão |
| `C-M-b` | `backward-sexp` | Expressão anterior |
| `C-M-n` | `forward-list` | Próxima lista |
| `C-M-p` | `backward-list` | Lista anterior |
| `C-M-a` | `beginning-of-defun` | Início da função |
| `C-M-e` | `end-of-defun` | Final da função |
| `C-M-u` | `backward-up-list` | Sobe um nível de parênteses |
| `C-M-d` | `down-list` | Entra em uma lista |
| `C-M-k` | `kill-sexp` | Apaga uma expressão |

### Busca e localização
| Atalho | Função | Descrição |
| :--- | :--- | :--- |
| `C-s` | `isearch-forward` | Busca à frente |
| `C-r` | `isearch-backward` | Busca para trás |
| `M-g g` | `goto-line` | Vai para uma linha |
| `M-g M-g` | `goto-line` | Vai para uma linha |
| `M-g c` | `goto-char` | Vai para uma posição |

---

## 3. Seleção de texto

| Atalho | Função | Descrição |
| :--- | :--- | :--- |
| `C-SPC` | `set-mark-command` | Define início da seleção |
| `M-h` | `mark-paragraph` | Seleciona parágrafo |
| `C-M-h` | `mark-defun` | Seleciona função |
| `C-x h` | `mark-whole-buffer` | Seleciona buffer inteiro |
| `C-M-SPC` | `mark-sexp` | Seleciona expressão Lisp |
| `M-@` | `mark-word` | Seleciona próxima palavra |

### Selecionar linha inteira
```elisp
(defun select-whole-line ()
  (interactive)
  (beginning-of-line)
  (set-mark-command nil)
  (end-of-line))
```

### Binding:
```elisp
(global-set-key (kbd "C-c l") #'select-whole-line)
```

### Habilitar destaque da região
```elisp
(transient-mark-mode 1)
```

---

## 4. Manipulação de texto

| Atalho | Função | Descrição |
| :--- | :--- | :--- |
| `C-t` | `transpose-chars` | Troca caracteres |
| `M-t` | `transpose-words` | Troca palavras |
| `C-M-t` | `transpose-sexps` | Troca expressões Lisp |
| `C-k` | `kill-line` | Apaga até o final da linha |
| `C-d` | `delete-char` | Apaga próximo caractere |
| `M-z` | `zap-to-char` | Apaga até determinado caractere |
| `M-;` | `comment-dwim` | Comenta ou descomenta |
| `M-w` | `kill-ring-save` | Copia região |
| `C-w` | `kill-region` | Recorta região |
| `C-y` | `yank` | Cola conteúdo do kill ring |

### Navegação por WORD (delimitada por espaços)
```elisp
(defun backward-WORD ()
  (interactive)
  (skip-chars-backward " \t\n")
  (skip-chars-backward "^ \t\n"))

(defun forward-WORD ()
  (interactive)
  (skip-chars-forward "^ \t\n"))

(global-set-key (kbd "M-B") #'backward-WORD)
(global-set-key (kbd "M-E") #'forward-WORD)
```

---

## 5. Manipulação de Windows

No Emacs, uma *window* é uma área de exibição de um buffer.

### Dividir e fechar
| Atalho | Função | Descrição |
| :--- | :--- | :--- |
| `C-x 2` | `split-window-below` | Divide horizontalmente |
| `C-x 3` | `split-window-right` | Divide verticalmente |
| `C-x 1` | `delete-other-windows` | Mantém somente a atual |
| `C-x 0` | `delete-window` | Fecha a atual |

### Navegar entre Windows
| Atalho | Função | Descrição |
| :--- | :--- | :--- |
| `C-x o` | `other-window` | Próxima window |
| `S-<left>` | `windmove-left` | Window à esquerda |
| `S-<right>` | `windmove-right` | Window à direita |
| `S-<up>` | `windmove-up` | Window acima |
| `S-<down>` | `windmove-down` | Window abaixo |

### Configuração:
```elisp
(windmove-default-keybindings)
```

### Abrir buffers e arquivos em outras Windows
| Atalho | Função | Descrição |
| :--- | :--- | :--- |
| `C-x 4 b` | `switch-to-buffer-other-window` | Abre buffer em outra window |
| `C-x 4 f` | `find-file-other-window` | Abre arquivo em outra window |
| `C-x 4 d` | `dired-other-window` | Abre diretório em outra window |
| `C-x 4 0` | `kill-buffer-and-window` | Fecha buffer e window |

### Redimensionar
| Atalho | Função | Descrição |
| :--- | :--- | :--- |
| `C-x ^` | `enlarge-window` | Aumenta altura |
| `C-x }` | `enlarge-window-horizontally` | Aumenta largura |
| `C-x {` | `shrink-window-horizontally` | Diminui largura |
| `C-x -` | `shrink-window-if-larger-than-buffer` | Ajusta ao conteúdo |
| `C-x +` | `balance-windows` | Distribui espaço igualmente |

### Outros comandos
| Função | Descrição |
| :--- | :--- |
| `delete-windows-on` | Fecha windows de determinado buffer |
| `maximize-window` | Maximiza a window |
| `window-swap-states` | Troca estados de duas windows |
| `balance-windows` | Distribui espaço igualmente |

---

## 6. Buffers e arquivos

| Atalho | Função | Descrição |
| :--- | :--- | :--- |
| `C-x C-f` | `find-file` | Abre arquivo |
| `C-x C-s` | `save-buffer` | Salva arquivo |
| `C-x C-w` | `write-file` | Salva como |
| `C-x b` | `switch-to-buffer` | Alterna buffer |
| `C-x k` | `kill-buffer` | Fecha buffer |
| `C-x C-b` | `list-buffers` | Lista buffers |
| `C-x C-c` | `save-buffers-kill-terminal` | Encerra Emacs |

---

## 7. Atalhos fundamentais para memorizar

Se você está começando, priorize estes:

| Atalho | Função |
| :--- | :--- |
| `C-f` | Direita |
| `C-b` | Esquerda |
| `C-n` | Baixo |
| `C-p` | Cima |
| `C-a` | Início da linha |
| `C-e` | Final da linha |
| `M-f` | Próxima palavra |
| `M-b` | Palavra anterior |
| `M-a` | Início da sentença |
| `M-e` | Final da sentença |
| `M-h` | Seleciona parágrafo |
| `C-M-h` | Seleciona função |
| `C-x h` | Seleciona buffer inteiro |
| `C-x 2` | Divide window |
| `C-x 3` | Divide window verticalmente |
| `C-x o` | Alterna window |
| `C-x 0` | Fecha window |
| `C-x 1` | Mantém somente uma window |
| `C-s` | Busca à frente |
| `C-r` | Busca para trás |
| `M-x` | Executa comando |