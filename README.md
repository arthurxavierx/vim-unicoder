# unicoder.vim

Insert cool unicode characters while in _insert mode_ just by typing LaTeX and [Agda Mode](http://agda.readthedocs.io/en/v2.5.2/tools/emacs-mode.html#common-characters) inspired abbreviations.

![Screencast](https://raw.githubusercontent.com/arthurxavierx/vim-unicoder/master/vim-unicoder.gif)

[Slower version (asciicast)](https://asciinema.org/a/wiIUvgkeufLnqV3VPuJrvPpJJ)

## Table of contents

1. [Installation](#installation)
1. [Usage](#installation)
    - [Limitations](#limitations)
    - [Global options](#global-options)
1. [List of abbreviations](#list-of-abbreviations)
    - [Greek letters](#greek-letters)
        - [Uppercase greek](#uppercase-greek)
        - [Lowercase greek](#lowercase-greek)
    - [Shapes](#shapes)
    - [Miscellaneous](#miscellaneous)
    - [Math symbols](#math-symbols)
        - [Brackets](#brackets)
        - [Set theory](#set-theory)
        - [Lattices](#lattices)
        - [Logic](#logic)
        - [Calculus](#calculus)
        - [Equalities](#equalities)
        - [Inequalities](#inequalities)
        - [Entailment (turnstiles)](#entailment-turnstiles)
        - [Circled operators](#circled-operators)
        - [Boxed operators](#boxed-operators)
        - [Dots](#dots)
    - [Arrows](#arrows)
        - [Simple arrows](#simple-arrows)
        - [Double arrows](#double-arrows)
    - [Sets](#sets)
    - [Fractions](#fractions)
    - [Subscripts](#subscripts)
    - [Superscripts](#superscripts)
    - [Circled](#circled)
        - [Circled numbers](#circled-numbers)
        - [Uppercase circled](#uppercase-circled)
        - [Lowercase circled](#lowercase-circled)

## Installation

`vim-unicoder` may be installed by any of your favourite plugin managers. Be it Pathogen, Vundle or Plug, use whichever you prefer.

For example, when using with [Plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'arthurxavierx/vim-unicoder'
```

## Usage

`vim-unicoder` makes it easy to insert unicode characters in Vim buffers. By using Vim's native [abbreviations](http://vimdoc.sourceforge.net/htmldoc/map.html#abbreviations), it's possible, for instance, to just type `\int x\^n` (and press space, any other separator or `<C-]>` after the `n`) and the text becomes `∫ xⁿ` as you write it.

### Limitations
Because this plugin uses Vim's native abbreviations, it has some limitations, though. Please, be aware of them before submitting issues to this project.

The abbreviations here defined do tightly depend on the value of the `iskeyword` setting, which varies according to the file type.
Some abbreviations here defined will not work with file types that define conflicting keywords.

Also, regarding the insertion and replacement of the abbreviations, some abbreviations will not work if there are special characters right before them.
This section of Vim's help file on [:h abbreviations](http://vimdoc.sourceforge.net/htmldoc/map.html#abbreviations) explains this limitation:

```
The characters before the cursor must match the abbreviation.  Each type has
an additional rule:

full-id	  In front of the match is a non-keyword character, or this is where
the line or insertion starts.  Exception: When the abbreviation is
only one character, it is not recognized if there is a non-keyword
character in front of it, other than a space or a tab.

end-id	  In front of the match is a keyword character, or a space or a tab,
or this is where the line or insertion starts.

non-id	  In front of the match is a space, tab or the start of the line or
the insertion.
```

### Global options
 Name | Default | Description
------|---------|-------------
`g:unicoder_command_abbreviations` | `1` | Have these abbreviations work in the command and search lines.
`g:unicoder_exclude_filetypes` | `['tex', 'latex', 'plaintex']` | File types in which these abbreviations will not work.

## List of abbreviations

### Greek letters

#### Uppercase greek
  Abbreviations  | Character
:---------------:|:---------:
`\GA`  `\Alpha`  |     Α
`\GB`  `\Beta`   |     Β
`\GG`  `\Gamma`  |     Γ
`\GD`  `\Delta`  |     Δ
`\GE`  `\Epsilon`|     Ε
`\GZ`  `\Zeta`   |     Ζ
`\GH`  `\Eta`    |     Η
`\GTH` `\Theta`  |     Θ
`\GI`  `\Iota`   |     Ι
`\GK`  `\Kappa`  |     Κ
`\GL`  `\Lambda` |     Λ
`\GM`  `\Mu`     |     Μ
`\GN`  `\Nu`     |     Ν
`\GX`  `\Xi`     |     Ξ
`\GO`  `\Omicron`|     Ο
`\GP`  `\Pi`     |     Π
`\GR`  `\Rho`    |     Ρ
`\GS`  `\Sigma`  |     Σ
`\GT`  `\Tau`    |     Τ
`\GU`  `\Upsilon`|     Υ
`\GF`  `\Phi`    |     Φ
`\GC`  `\Chi`    |     Χ
`\GPS` `\Psi`    |     Ψ
`\GW`  `\Omega`  |     Ω

#### Lowercase greek
  Abbreviations  | Character
:---------------:|:---------:
`\ga`  `\alpha`  |     α
`\gb`  `\beta`   |     β
`\gg`  `\gamma`  |     γ
`\gd`  `\delta`  |     δ
`\ge`  `\epsilon`|     ε
`\gz`  `\zeta`   |     ζ
`\gh`  `\eta`    |     η
`\gth` `\theta`  |     θ
`\gi`  `\iota`   |     ι
`\gk`  `\kappa`  |     κ
`\gl`  `\lambda` |     λ
`\gm`  `\mu`     |     μ
`\gn`  `\nu`     |     ν
`\gx`  `\xi`     |     ξ
`\go`  `\omicron`|     ο
`\gp`  `\pi`     |     π
`\gr`  `\rho`    |     ρ
`\gs`  `\sigma`  |     σ
`\gt`  `\tau`    |     τ
`\gu`  `\upsilon`|     υ
`\gf`  `\phi`    |     φ
`\gc`  `\chi`    |     χ
`\gps` `\psi`    |     ψ
`\gw`  `\omega`  |     ω

### Shapes
  Abbreviations  | Character
:---------------:|:---------:
   `\box`        |     □
   `\bbox`       |     ■
   `\sbox`       |     ▫
   `\sbbox`      |     ▪
   `\square`     |     □
   `\bsquare`    |     ■
   `\ssquare`    |     ▫
   `\sbsquare`   |     ▪
   `\diamond`    |     ◇
   `\bdiamond`   |     ◆
   `\lozenge`    |     ◊
   `\circle`     |     ○
   `\bcircle`    |     ●
   `\dcircle`    |     ◌
   `\triangle`   |     △
   `\btriangle`  |     ▲
   `\skull`      |     ☠
   `\danger`     |     ☡
   `\radiation`  |     ☢
   `\biohazard`  |     ☣
   `\yinyang`    |     ☯
   `\frownie`    |     ☹
   `\smiley`     |     ☺
   `\blacksmiley`|     ☻
   `\sun`        |     ☼
   `\rightmoon`  |     ☽
   `\leftmoon`   |     ☾
   `\female`     |     ♀
   `\male`       |     ♂

### Miscellaneous
  Abbreviations  | Character
:---------------:|:---------:
`\dagger`        |     †
`\ddager`        |     ‡
`\prime`         |     ′
`\second`        |     ″
`\third`         |     ‴
`\fourth`        |     ⁗
`\euro`          |     €

### Math symbols
  Abbreviations  | Character
:---------------:|:---------:
`\pm`            |     ±
`\mp`            |     ∓
`\sum`           |     ∑
`\prod`          |     ∏
`\coprod`        |     ∐
`\qed`           |     ∎
`\ast`           |     ∗
`times`          |     ×
`\div`           |     ÷
`\bullet`        |     •
`\o` `\comp` `\circ`|     ∘
`\.` `\cdot`     |     ∙
`\:`             |     ∶
`\::`            |     ∷
`\sqrt`          |     √
`\sqrt3`         |     ∛
`\sqrt4`         |     ∜
`\inf`           |     ∞
`\propto`        |     ∝
`\pitchfork`     |     ⋔
`\all` `\forall` |     ∀
`\ex` `\exists`  |     ∃
`\nex` `\nexists`|     ∄

#### Brackets
  Abbreviations  | Character
:---------------:|:---------:
  `\lceil`       |     ⌈
  `\rceil`       |     ⌉
  `\lfloor`      |     ⌊
  `\rfloor`      |     ⌋
  `\langle`      |     ⟨
  `\rangle`      |     ⟩
  `\llens`       |     ⦇
  `\rlens`       |     ⦈
  `\[[`          |     ⟦
  `\]]`          |     ⟧

#### Set theory
  Abbreviations  | Character
:---------------:|:---------:
  `\empty` `\emptyset`|     ∅
  `\in`          |     ∈
  `\notin`       |     ∉
  `\cap` `\inters`|     ∩
  `\cup` `\union`|     ∪
  `\subset`      |     ⊂
  `\supset`      |     ⊃
  `\nsubset`     |     ⊄
  `\nsupset`     |     ⊅
  `\subseteq`    |     ⊆
  `\supseteq`    |     ⊇
  `\nsubseteq`   |     ⊈
  `\nsupseteq`   |     ⊉

#### Lattices
  Abbreviations  | Character
:---------------:|:---------:
  `\sqsubset`    |     ⊏
  `\sqsupset`    |     ⊐
  `\sqsubseteq`  |     ⊑
  `\sqsupseteq`  |     ⊒
  `\sqcap`       |     ⊓
  `\sqcup`       |     ⊔

#### Logic
  Abbreviations  | Character
:---------------:|:---------:
  `\land` `\and` |     ∧
  `\lor` `\or`   |     ∨
  `\lnot` `\not` `\neg`|     ¬
  `\top`         |     ⊤
  `\bot`         |     ⊥
  `\multimap` `\-o`|     ⊸
  `\multimapinv` `\invmultimap`|     ⟜
  `\parr` `\invamp`|     ⅋
  `\therefore`   |     ∴
  `\because`     |     ∵

#### Calculus
  Abbreviations  | Character
:---------------:|:---------:
  `\grad` `\nabla`|     ∇
  `\partial`     |     𝜕
  `\inc` `\increment`|     ∆
  `\int`         |     ∫
  `\iint`        |     ∬
  `\iiint`       |     ∭
  `\oint`        |     ∮
  `\oiint`       |     ∯
  `\oiiint`      |     ∰

#### Equalities
  Abbreviations  | Character
:---------------:|:---------:
`\sim`  `\~`     |     ∼
`\nsim` `\~n`    |     ≁
`\simeq`  `\=~`  |     ≃
`\nsimeq` `\=~n` |     ≄
`\cong` `\iso` `\==~` | ≅
`\ncong` `\niso` `\==~n` | ≇
`\approx`  `\~2` |     ≈
`\napprox` `\~2n`|     ≉
`\neq` `\=n` `\!=` `\/=` | ≠
`\equiv` `\===`  |     ≡
`\nequiv` `\===n`|     ≢
`\Equiv`         |     ≣

#### Inequalities
  Abbreviations  | Character
:---------------:|:---------:
`\leq` `\<=`     |     ≤
`\nleq` `\<=n`   |     ≰
`\geq` `\>=`     |     ≥
`\ngeq` `\>=n`   |     ≱
`\ll` `\<<`      |     «
`\lll`           |     ⋘
`\gg` `\>>`      |     »
`\ggg`           |     ⋙

#### Entailment (turnstiles)
  Abbreviations  | Character
:---------------:|:---------:
`\ent` `\entails` `\vdash` `\\|-` | ⊢
`\nent` `\nentails` `\nvdash` `\\|-n` | ⊬
`\dashv` `\-\|`   |     ⊣
`\models` `\vDashh` `\\|=` | ⊨
`\nvDash` `\\|=n` |     ⊭
`\Vdash` `\\|\|-`  |     ⊩
`\nVdash` `\\|\|-n`|     ⊮
`\VDash` `\\|\|=`   |     ⊫
`\nVDash` `\\|\|=n` |     ⊯
`\Vvdash` `\\|\|\|-` |     ⊪

#### Circled operators
  Abbreviations  | Character
:---------------:|:---------:
`\oplus` `\o+`   |     ⊕
`\ominus` `\o-`  |     ⊖
`\otimes` `\ox`  |     ⊗
`\oslash` `\o/`  |     ⊘
`\odot` `\o.`    |     ⊙
`\ocirc` `\oo`   |     ⊚
`\oast` `\o*`    |     ⊛
`\oequal` `\o=`  |     ⊜

#### Boxed operators
  Abbreviations  | Character
:---------------:|:---------:
`\boxplus` `\bplus` `\b+` | ⊞
`\boxminus` `\bminus` `\b-` | ⊟
`\boxtimes` `\btimes` `\bx` | ⊠
`\boxdot` `\bdot` `\b.` | ⊡

#### Dots
  Abbreviations  | Character
:---------------:|:---------:
`\ldots` `\...`  |     …
`\cdots`         |     ⋯
`\vdots`         |     ⋮
`\iddots`        |     ⋰
`\ddots`         |     ⋱

### Arrows

#### Simple arrows
  Abbreviations  | Character
:---------------:|:---------:
`\mapsto`        |     ↦
`\to` `\arrow` `\rarrow` `\rightarrow` `\->` | →
`\larrow` `\leftarrow` `\<-` | ←
`\uarrow` `\uparrow` `\-^` `\-!` | ↑
`\darrow` `\downarrow` `\-v` | ↓
`\lrarrow` `\leftrightarrow` | ↔
`\udarrow` `\updownarrow` `\^-v` `\!-v` | ↕
`\nwarrow`       |     ↖
`\nearrow`       |     ↗
`\searrow`       |     ↘
`\swarrow`       |     ↙

#### Double arrows
  Abbreviations  | Character
:---------------:|:---------:
`\To` `\Arrow` `\Rarrow` `\Rightarrow` `\=>` | ⇒
`\Larrow` `\Leftarrow` `\=<` | ⇐
`\Uarrow` `\Uparrow` `\=^` `\=!` | ⇑
`\Darrow` `\Downarrow` `\=v` | ⇓
`\Lrarrow` `\Leftrightarrow` | ⇔
`\Udarrow` `\Updownarrow` `\^=v` `\!=v` | ⇕
`\Nwarrow`       |     ⇖
`\Nearrow`       |     ⇗
`\Searrow`       |     ⇘
`\Swarrow`       |     ⇙

### Sets
  Abbreviations  | Character
:---------------:|:---------:
`\Bool` `\Bools` `\Boolean` `\Booleans` `\bb` | 𝔹
`\Ints` `\Integers` `\bz` | ℤ
`\Rats` `\Rationals` `\bq` | ℚ
`\Reals` `\br`   |     ℝ
`\Comps` `\Complex` `\Complexes` `\bc` | ℂ
`\Quats` `\Quaternions` `\bh` | ℍ
`\Primes` `\bp`  |     ℙ

### Fractions
  Abbreviations  | Character
:---------------:|:---------:
`\frac14`        |     ¼
`\frac12`        |     ½
`\frac34`        |     ¾
`\frac13`        |     ⅓
`\frac23`        |     ⅔
`\frac15`        |     ⅕
`\frac25`        |     ⅖
`\frac35`        |     ⅗
`\frac45`        |     ⅘
`\frac16`        |     ⅙
`\frac56`        |     ⅚
`\frac18`        |     ⅛
`\frac38`        |     ⅜
`\frac58`        |     ⅝
`\frac78`        |     ⅞

### Subscripts
  Abbreviations  | Character
:---------------:|:---------:
`\_a`            |     ₐ
`\_e`            |     ₑ
`\_h`            |     ₕ
`\_i`            |     ᵢ
`\_j`            |     ⱼ
`\_k`            |     ₖ
`\_l`            |     ₗ
`\_m`            |     ₘ
`\_n`            |     ₙ
`\_o`            |     ₒ
`\_p`            |     ₚ
`\_r`            |     ᵣ
`\_s`            |     ₛ
`\_t`            |     ₜ
`\_u`            |     ᵤ
`\_v`            |     ᵥ
`\_x`            |     ₓ
`\_0`            |     ₀
`\_1`            |     ₁
`\_2`            |     ₂
`\_3`            |     ₃
`\_4`            |     ₄
`\_5`            |     ₅
`\_6`            |     ₆
`\_7`            |     ₇
`\_8`            |     ₈
`\_9`            |     ₉
`\_+`            |     ₊
`\_-`            |     ₋
`\_=`            |     ₌
`\_(`            |     ₍
`\_)`            |     ₎

### Superscripts
  Abbreviations  | Character
:---------------:|:---------:
`\^a`            |     ᵃ
`\^b`            |     ᵇ
`\^c`            |     ᶜ
`\^d`            |     ᵈ
`\^e`            |     ᵉ
`\^f`            |     ᶠ
`\^g`            |     ᵍ
`\^h`            |     ʰ
`\^i`            |     ⁱ
`\^j`            |     ʲ
`\^k`            |     ᵏ
`\^l`            |     ˡ
`\^m`            |     ᵐ
`\^n`            |     ⁿ
`\^o`            |     ᵒ
`\^p`            |     ᵖ
`\^r`            |     ʳ
`\^s`            |     ˢ
`\^t`            |     ᵗ
`\^u`            |     ᵘ
`\^v`            |     ᵛ
`\^w`            |     ʷ
`\^x`            |     ˣ
`\^y`            |     ʸ
`\^z`            |     ᶻ
`\^A`            |     ᴬ
`\^B`            |     ᴮ
`\^D`            |     ᴰ
`\^E`            |     ᴱ
`\^G`            |     ᴳ
`\^H`            |     ᴴ
`\^I`            |     ᴵ
`\^J`            |     ᴶ
`\^K`            |     ᴷ
`\^L`            |     ᴸ
`\^M`            |     ᴹ
`\^N`            |     ᴺ
`\^O`            |     ᴼ
`\^P`            |     ᴾ
`\^R`            |     ᴿ
`\^T`            |     ᵀ
`\^U`            |     ᵁ
`\^V`            |     ⱽ
`\^W`            |     ᵂ
`\^0`            |     ⁰
`\^1`            |     ¹
`\^2`            |     ²
`\^3`            |     ³
`\^4`            |     ⁴
`\^5`            |     ⁵
`\^6`            |     ⁶
`\^7`            |     ⁷
`\^8`            |     ⁸
`\^9`            |     ⁹
`\^+`            |     ⁺
`\^-`            |     ⁻
`\^=`            |     ⁼
`\^(`            |     ⁽
`\^)`            |     ⁾

### Circled

#### Circled numbers
  Abbreviations  | Character
:---------------:|:---------:
`\(0)`           |     ⓪
`\(1)`           |     ①
`\(2)`           |     ②
`\(3)`           |     ③
`\(4)`           |     ④
`\(5)`           |     ⑤
`\(6)`           |     ⑥
`\(7)`           |     ⑦
`\(8)`           |     ⑧
`\(9)`           |     ⑨
`\(10)`          |     ⑩
`\(11)`          |     ⑪
`\(12)`          |     ⑫
`\(13)`          |     ⑬
`\(14)`          |     ⑭
`\(15)`          |     ⑮
`\(16)`          |     ⑯
`\(17)`          |     ⑰
`\(18)`          |     ⑱
`\(19)`          |     ⑲
`\(20)`          |     ⑳

#### Uppercase circled
  Abbreviations  | Character
:---------------:|:---------:
`\(A)`           |     Ⓐ
`\(B)`           |     Ⓑ
`\(C)`           |     Ⓒ
`\(D)`           |     Ⓓ
`\(E)`           |     Ⓔ
`\(F)`           |     Ⓕ
`\(G)`           |     Ⓖ
`\(H)`           |     Ⓗ
`\(I)`           |     Ⓘ
`\(J)`           |     Ⓙ
`\(K)`           |     Ⓚ
`\(L)`           |     Ⓛ
`\(M)`           |     Ⓜ
`\(N)`           |     Ⓝ
`\(O)`           |     Ⓞ
`\(P)`           |     Ⓟ
`\(Q)`           |     Ⓠ
`\(R)`           |     Ⓡ
`\(S)`           |     Ⓢ
`\(T)`           |     Ⓣ
`\(U)`           |     Ⓤ
`\(V)`           |     Ⓥ
`\(W)`           |     Ⓦ
`\(X)`           |     Ⓧ
`\(Y)`           |     Ⓨ
`\(Z)`           |     Ⓩ

#### Lowercase circled
  Abbreviations  | Character
:---------------:|:---------:
`\(a)`           |     ⓐ
`\(b)`           |     ⓑ
`\(c)`           |     ⓒ
`\(d)`           |     ⓓ
`\(e)`           |     ⓔ
`\(f)`           |     ⓕ
`\(g)`           |     ⓖ
`\(h)`           |     ⓗ
`\(i)`           |     ⓘ
`\(j)`           |     ⓙ
`\(k)`           |     ⓚ
`\(l)`           |     ⓛ
`\(m)`           |     ⓜ
`\(n)`           |     ⓝ
`\(o)`           |     ⓞ
`\(p)`           |     ⓟ
`\(q)`           |     ⓠ
`\(r)`           |     ⓡ
`\(s)`           |     ⓢ
`\(t)`           |     ⓣ
`\(u)`           |     ⓤ
`\(v)`           |     ⓥ
`\(w)`           |     ⓦ
`\(x)`           |     ⓧ
`\(y)`           |     ⓨ
`\(z)`           |     ⓩ
