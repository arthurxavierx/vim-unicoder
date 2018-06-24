if exists('g:loaded_unicoder')
  finish
endif
let g:loaded_unicoder = 1

" Defaults
if !exists('g:unicoder_exclude_filetypes')
  let g:unicoder_exclude_filetypes = ['tex', 'latex', 'plaintex']
endif

if !exists('g:unicoder_command_abbreviations')
  let g:unicoder_command_abbreviations = 1
endif

"
function! s:irepl(prefix, default, repl)
  let n = len(a:prefix)
  let bs = repeat("\<bs>", n)
  if n > 0
    return getline('.')[col('.') - n - 1] == a:prefix ? bs.a:repl : a:default
  else
    return a:repl
  endif
endfunction

function! s:crepl(prefix, default, repl)
  let n = len(a:prefix)
  let bs = repeat(nr2char(8), n)
  if n > 0
    return getcmdline()[getcmdpos() - n - 1] == a:prefix ? bs.a:repl : a:default
  else
    return a:repl
  endif
endfunction

function! s:Prefixab(opts, prefix, lhs, rhs)
  let args = string(a:prefix).', '.string(a:lhs).', '.string(a:rhs)
  silent! exe 'inoreab '.a:opts.' '.a:lhs.' <c-r>=<sid>irepl('.args.')<cr>'
  if g:unicoder_command_abbreviations
    silent! exe 'cnoreab '.a:opts.' '.a:lhs.' <c-r>=<sid>crepl('.args.')<cr>'
  endif
endfunction
command! -nargs=+ Prefixab call s:Prefixab('<buffer>', <f-args>)
command! -nargs=+ Noprefixab call s:Prefixab('<buffer>', '', <f-args>)

" Initialization
autocmd WinEnter,BufEnter *
  \ if index(g:unicoder_exclude_filetypes, &ft) < 0
  \ | call s:setup_abbreviations()
  \ | endif

function! s:setup_abbreviations()
  augroup pencil_iskeyword
    autocmd!
  augroup END

  " Greek {{{
  " Uppercase greek {{{
  Prefixab  \\ GA     Α
  Prefixab  \\ GB     Β
  Prefixab  \\ GG     Γ
  Prefixab  \\ GD     Δ
  Prefixab  \\ GE     Ε
  Prefixab  \\ GZ     Ζ
  Prefixab  \\ GH     Η
  Prefixab  \\ GTH    Θ
  Prefixab  \\ GI     Ι
  Prefixab  \\ GK     Κ
  Prefixab  \\ GL     Λ
  Prefixab  \\ GM     Μ
  Prefixab  \\ GN     Ν
  Prefixab  \\ GX     Ξ
  Prefixab  \\ GO     Ο
  Prefixab  \\ GP     Π
  Prefixab  \\ GR     Ρ
  Prefixab  \\ GS     Σ
  Prefixab  \\ GT     Τ
  Prefixab  \\ GU     Υ
  Prefixab  \\ GF     Φ
  Prefixab  \\ GC     Χ
  Prefixab  \\ GPS    Ψ
  Prefixab  \\ GW     Ω

  Prefixab  \\ Alpha       Α
  Prefixab  \\ Beta        Β
  Prefixab  \\ Gamma       Γ
  Prefixab  \\ Delta       Δ
  Prefixab  \\ Epsilon     Ε
  Prefixab  \\ Zeta        Ζ
  Prefixab  \\ Eta         Η
  Prefixab  \\ Theta       Θ
  Prefixab  \\ Iota        Ι
  Prefixab  \\ Kappa       Κ
  Prefixab  \\ Lambda      Λ
  Prefixab  \\ Mu          Μ
  Prefixab  \\ Nu          Ν
  Prefixab  \\ Xi          Ξ
  Prefixab  \\ Omicron     Ο
  Prefixab  \\ Pi          Π
  Prefixab  \\ Rho         Ρ
  Prefixab  \\ Sigma       Σ
  Prefixab  \\ Tau         Τ
  Prefixab  \\ Upsilon     Υ
  Prefixab  \\ Phi         Φ
  Prefixab  \\ Chi         Χ
  Prefixab  \\ Psi         Ψ
  Prefixab  \\ Omega       Ω
  " }}}

  " Lowercase greek {{{
  Prefixab  \\ ga     α
  Prefixab  \\ gb     β
  Prefixab  \\ gg     γ
  Prefixab  \\ gd     δ
  Prefixab  \\ ge     ε
  Prefixab  \\ gz     ζ
  Prefixab  \\ gh     η
  Prefixab  \\ gth    θ
  Prefixab  \\ gi     ι
  Prefixab  \\ gk     κ
  Prefixab  \\ gl     λ
  Prefixab  \\ gm     μ
  Prefixab  \\ gn     ν
  Prefixab  \\ gx     ξ
  Prefixab  \\ go     ο
  Prefixab  \\ gp     π
  Prefixab  \\ gr     ρ
  Prefixab  \\ gs     σ
  Prefixab  \\ gt     τ
  Prefixab  \\ gu     υ
  Prefixab  \\ gf     φ
  Prefixab  \\ gc     χ
  Prefixab  \\ gps    ψ
  Prefixab  \\ gw     ω

  Prefixab  \\ alpha       α
  Prefixab  \\ beta        β
  Prefixab  \\ gamma       γ
  Prefixab  \\ delta       δ
  Prefixab  \\ epsilon     ε
  Prefixab  \\ zeta        ζ
  Prefixab  \\ eta         η
  Prefixab  \\ theta       θ
  Prefixab  \\ iota        ι
  Prefixab  \\ kappa       κ
  Prefixab  \\ lambda      λ
  Prefixab  \\ mu          μ
  Prefixab  \\ nu          ν
  Prefixab  \\ xi          ξ
  Prefixab  \\ omicron     ο
  Prefixab  \\ pi          π
  Prefixab  \\ rho         ρ
  Prefixab  \\ sigma       σ
  Prefixab  \\ tau         τ
  Prefixab  \\ upsilon     υ
  Prefixab  \\ phi         φ
  Prefixab  \\ chi         χ
  Prefixab  \\ psi         ψ
  Prefixab  \\ omega       ω
  " }}}
  " }}}

  " Shapes {{{
  Prefixab  \\ box         □
  Prefixab  \\ bbox        ■
  Prefixab  \\ sbox        ▫
  Prefixab  \\ sbbox       ▪

  Prefixab  \\ square      □
  Prefixab  \\ bsquare     ■
  Prefixab  \\ ssquare     ▫
  Prefixab  \\ sbsquare    ▪

  Prefixab  \\ diamond     ◇
  Prefixab  \\ bdiamond    ◆
  Prefixab  \\ lozenge     ◊

  Prefixab  \\ circle      ○
  Prefixab  \\ bcircle     ●
  Prefixab  \\ dcircle     ◌

  Prefixab  \\ triangle    △
  Prefixab  \\ btriangle   ▲

  Prefixab  \\ skull       ☠
  Prefixab  \\ danger      ☡
  Prefixab  \\ radiation   ☢
  Prefixab  \\ biohazard   ☣
  Prefixab  \\ yinyang     ☯
  Prefixab  \\ frownie     ☹
  Prefixab  \\ smiley      ☺
  Prefixab  \\ blacksmiley ☻
  Prefixab  \\ sun         ☼
  Prefixab  \\ rightmoon   ☽
  Prefixab  \\ leftmoon    ☾
  Prefixab  \\ female      ♀
  Prefixab  \\ male        ♂
  " }}}

  " Miscellaneous {{{
  Prefixab  \\ dagger      †
  Prefixab  \\ ddager      ‡
  Prefixab  \\ prime       ′
  Prefixab  \\ second      ″
  Prefixab  \\ third       ‴
  Prefixab  \\ fourth      ⁗
  Prefixab  \\ euro        €
  " }}}

  " Math {{{
  Prefixab  \\ pm          ±
  Prefixab  \\ mp          ∓

  Prefixab  \\ sum         ∑
  Prefixab  \\ prod        ∏
  Prefixab  \\ coprod      ∐

  Prefixab  \\ qed         ∎
  Prefixab  \\ ast         ∗
  Noprefixab \x            ×
  Prefixab  \\ times       ×
  Prefixab  \\ div         ÷
  Prefixab  \\ bullet      •
  Prefixab  \\ o           ∘
  Prefixab  \\ comp        ∘
  Prefixab  \\ circ        ∘
  Prefixab  \\ cdot        ∙
  Noprefixab \.            ∙
  Noprefixab \:            ∶
  Noprefixab \::           ∷
  Prefixab  \\ sqrt        √
  Prefixab  \\ sqrt3       ∛
  Prefixab  \\ sqrt4       ∜
  Prefixab  \\ inf         ∞
  Prefixab  \\ propto      ∝
  Prefixab  \\ pitchfork   ⋔

  Prefixab  \\ forall      ∀
  Prefixab  \\ all         ∀
  Prefixab  \\ exists      ∃
  Prefixab  \\ ex          ∃
  Prefixab  \\ nexists     ∄
  Prefixab  \\ nex         ∄

  " Sets {{{
  Prefixab  \\ empty       ∅
  Prefixab  \\ emptyset    ∅
  Prefixab  \\ in          ∈
  Prefixab  \\ notin       ∉

  Prefixab  \\ inters      ∩
  Prefixab  \\ cap         ∩
  Prefixab  \\ union       ∪
  Prefixab  \\ cup         ∪

  Prefixab  \\ subset      ⊂
  Prefixab  \\ supset      ⊃
  Prefixab  \\ nsubset     ⊄
  Prefixab  \\ nsupset     ⊅
  Prefixab  \\ subseteq    ⊆
  Prefixab  \\ supseteq    ⊇
  Prefixab  \\ nsubseteq   ⊈
  Prefixab  \\ nsupseteq   ⊉
  " }}}

  " Lattices {{{
  Prefixab  \\ sqsubset    ⊏
  Prefixab  \\ sqsupset    ⊐
  Prefixab  \\ sqsubseteq  ⊑
  Prefixab  \\ sqsupseteq  ⊒
  Prefixab  \\ sqcap       ⊓
  Prefixab  \\ sqcup       ⊔
  " }}}

  " Logic {{{
  Prefixab  \\ land        ∧
  Prefixab  \\ lor         ∨
  Prefixab  \\ lnot        ¬
  Prefixab  \\ neg         ¬

  Prefixab  \\ top         ⊤
  Prefixab  \\ bot         ⊥

  Prefixab  \\ multimap    ⊸
  Noprefixab \-o           ⊸
  Prefixab  \\ multimapinv ⟜
  Prefixab  \\ invmultimap ⟜

  Prefixab  \\ parr        ⅋
  Prefixab  \\ invamp      ⅋

  Prefixab  \\ therefore   ∴
  Prefixab  \\ because     ∵
  " }}}

  " Calculus {{{
  Prefixab  \\ nabla       ∇
  Prefixab  \\ grad        ∇
  Prefixab  \\ partial     𝜕
  Prefixab  \\ increment   ∆
  Prefixab  \\ inc         ∆

  Prefixab  \\ int         ∫
  Prefixab  \\ iint        ∬
  Prefixab  \\ iiint       ∭
  Prefixab  \\ oint        ∮
  Prefixab  \\ oiint       ∯
  Prefixab  \\ oiiint      ∰
  " }}}

  " Equalities {{{
  Prefixab  \\ sim         ∼
  Prefixab  \\ nsim        ≁
  Noprefixab \~            ∼
  Noprefixab \~n           ≁

  Prefixab  \\ simeq       ≃
  Prefixab  \\ nsimeq      ≄
  Noprefixab \~=           ≃
  Noprefixab \~=n          ≄

  Prefixab  \\ cong        ≅
  Prefixab  \\ ncong       ≇
  Prefixab  \\ iso         ≅
  Prefixab  \\ niso        ≇
  Noprefixab \~==          ≅
  Noprefixab \~==n         ≇

  Prefixab  \\ approx      ≈
  Prefixab  \\ napprox     ≉
  Noprefixab \~~           ≈
  Noprefixab \~~n          ≉

  Prefixab  \\ neq         ≠
  Noprefixab \=n           ≠
  Noprefixab \!=           ≠
  Noprefixab \/=           ≠

  Prefixab  \\ equiv       ≡
  Prefixab  \\ nequiv      ≢
  Noprefixab \===          ≡
  Noprefixab \===n         ≢

  Prefixab  \\ Equiv       ≣
  Noprefixab \====         ≣
  " }}}

  " Inequalities {{{
  Prefixab  \\ leq         ≤
  Prefixab  \\ nleq        ≰
  Noprefixab \<=         ≤
  Noprefixab \<=n        ≰

  Prefixab  \\ geq         ≥
  Prefixab  \\ ngeq        ≱
  Noprefixab \>=         ≥
  Noprefixab \>=n        ≱

  Prefixab  \\ ll          «
  Noprefixab \<<           «
  Prefixab  \\ lll         ⋘
  Noprefixab \<<<          ⋘

  Prefixab  \\ gg          »
  Noprefixab \>>           »
  Prefixab  \\ ggg         ⋙
  Noprefixab \>>>          ⋙
  " }}}

  " Entailment (turnstiles) {{{
  Prefixab  \\ ent         ⊢
  Prefixab  \\ entails     ⊢
  Prefixab  \\ nent        ⊬
  Prefixab  \\ nentails    ⊬
  Prefixab  \\ vdash       ⊢
  Prefixab  \\ nvdash      ⊬
  Noprefixab \\|-          ⊢
  Noprefixab \\|-n         ⊬

  Prefixab  \\ dashv       ⊣
  Noprefixab \-\|          ⊣

  Prefixab  \\ models      ⊨
  Prefixab  \\ vDash       ⊨
  Prefixab  \\ nvDash      ⊭
  Noprefixab \\|=          ⊨
  Noprefixab \\|=n         ⊭

  Prefixab  \\ Vdash       ⊩
  Prefixab  \\ nVdash      ⊮
  Noprefixab \\|\|-        ⊩
  Noprefixab \\|\|-n       ⊮

  Prefixab  \\ VDash       ⊫
  Prefixab  \\ nVDash      ⊯
  Noprefixab \\|\|=        ⊫
  Noprefixab \\|\|=n       ⊯

  Prefixab  \\ Vvdash      ⊪
  Noprefixab \\|\|\|-      ⊪
  " }}}

  " Circled operators {{{
  Prefixab  \\ oplus       ⊕
  Prefixab  \\ ominus      ⊖
  Prefixab  \\ otimes      ⊗
  Prefixab  \\ oslash      ⊘
  Prefixab  \\ odot        ⊙
  Prefixab  \\ ocirc       ⊚
  Prefixab  \\ oast        ⊛
  Prefixab  \\ oequal      ⊜

  Noprefixab \o+           ⊕
  Noprefixab \o-           ⊖
  Prefixab  \\ ox          ⊗
  Noprefixab \o/           ⊘
  Noprefixab \o.           ⊙
  Prefixab  \\ oo          ⊚
  Noprefixab \o*           ⊛
  Noprefixab \o=           ⊜
  " }}}

  " Boxed operators {{{
  Prefixab  \\ boxplus     ⊞
  Prefixab  \\ boxminus    ⊟
  Prefixab  \\ boxtimes    ⊠
  Prefixab  \\ boxdot      ⊡

  Prefixab  \\ bplus       ⊞
  Prefixab  \\ bminus      ⊟
  Prefixab  \\ btimes      ⊠
  Prefixab  \\ bdot        ⊡

  Noprefixab \b+           ⊞
  Noprefixab \b-           ⊟
  Prefixab  \\ bx          ⊠
  Noprefixab \b.           ⊡
  " }}}
  " }}}

  " Dots {{{
  Prefixab  \\ ldots       …
  Noprefixab \...          …
  Prefixab  \\ cdots       ⋯
  Prefixab  \\ vdots       ⋮
  Prefixab  \\ iddots      ⋰
  Prefixab  \\ ddots       ⋱
  " }}}

  " Arrows {{{

  " Simple {{{
  Prefixab  \\ mapsto      ↦

  Prefixab  \\ to          →
  Prefixab  \\ arrow       →
  Prefixab  \\ rarrow      →
  Prefixab  \\ rightarrow  →
  Prefixab  \\ larrow      ←
  Prefixab  \\ leftarrow   ←
  Prefixab  \\ uarrow      ↑
  Prefixab  \\ uparrow     ↑
  Prefixab  \\ darrow      ↓
  Prefixab  \\ downarrow   ↓
  Prefixab  \\ lrarrow     ↔
  Prefixab  \\ leftrightarrow ↔
  Prefixab  \\ udarrow     ↕
  Prefixab  \\ updownarrow ↕
  Prefixab  \\ nwarrow     ↖
  Prefixab  \\ nearrow     ↗
  Prefixab  \\ searrow     ↘
  Prefixab  \\ swarrow     ↙

  Noprefixab \->           →
  Noprefixab \<-           ←
  Noprefixab \-v           ↓
  Noprefixab \-^           ↑
  Noprefixab \-!           ↑
  Noprefixab \<->          ↔
  Noprefixab \^-v          ↕
  Noprefixab \!-v          ↕
  " }}}

  " Double {{{
  Prefixab  \\ To          ⇒
  Prefixab  \\ Arrow       ⇒
  Prefixab  \\ Rarrow      ⇒
  Prefixab  \\ Rightarrow  ⇒
  Prefixab  \\ Larrow      ⇐
  Prefixab  \\ Leftarrow   ⇐
  Prefixab  \\ Uarrow      ⇑
  Prefixab  \\ Uparrow     ⇑
  Prefixab  \\ Darrow      ⇓
  Prefixab  \\ Downarrow   ⇓
  Prefixab  \\ Lrarrow     ⇔
  Prefixab  \\ Leftrightarrow ⇔
  Prefixab  \\ Udarrow     ⇕
  Prefixab  \\ Updownarrow ⇕
  Prefixab  \\ Nwarrow     ⇖
  Prefixab  \\ Nearrow     ⇗
  Prefixab  \\ Searrow     ⇘
  Prefixab  \\ Swarrow     ⇙

  Noprefixab \=>           ⇒
  Noprefixab \=<           ⇐
  Noprefixab \=v           ⇓
  Noprefixab \=^           ⇑
  Noprefixab \=!           ⇑
  Noprefixab \<=>          ⇔
  Noprefixab \^=v          ⇕
  Noprefixab \!=v          ⇕
  " }}}
  " }}}

  " Sets {{{
  Prefixab  \\ bb          𝔹
  Prefixab  \\ bn          ℕ
  Prefixab  \\ bz          ℤ
  Prefixab  \\ bq          ℚ
  Prefixab  \\ br          ℝ
  Prefixab  \\ bc          ℂ
  Prefixab  \\ bp          ℙ

  Prefixab  \\ Bool        𝔹
  Prefixab  \\ Bools       𝔹
  Prefixab  \\ Nats        ℕ
  Prefixab  \\ Ints        ℤ
  Prefixab  \\ Rats        ℚ
  Prefixab  \\ Comps       ℂ
  Prefixab  \\ Quats       ℍ

  Prefixab  \\ Boolean     𝔹
  Prefixab  \\ Booleans    𝔹
  Prefixab  \\ Integers    ℤ
  Prefixab  \\ Rationals   ℚ
  Prefixab  \\ Reals       ℝ
  Prefixab  \\ Complex     ℂ
  Prefixab  \\ Complexes   ℂ
  Prefixab  \\ Quaternions ℍ
  Prefixab  \\ Primes      ℙ
  " }}}

  " Fractions {{{
  Prefixab  \\ frac14      ¼
  Prefixab  \\ frac12      ½
  Prefixab  \\ frac34      ¾
  Prefixab  \\ frac13      ⅓
  Prefixab  \\ frac23      ⅔
  Prefixab  \\ frac15      ⅕
  Prefixab  \\ frac25      ⅖
  Prefixab  \\ frac35      ⅗
  Prefixab  \\ frac45      ⅘
  Prefixab  \\ frac16      ⅙
  Prefixab  \\ frac56      ⅚
  Prefixab  \\ frac18      ⅛
  Prefixab  \\ frac38      ⅜
  Prefixab  \\ frac58      ⅝
  Prefixab  \\ frac78      ⅞
  " }}}

  " Subscripts {{{
  Prefixab  \\ _a          ₐ
  Prefixab  \\ _e          ₑ
  Prefixab  \\ _h          ₕ
  Prefixab  \\ _i          ᵢ
  Prefixab  \\ _j          ⱼ
  Prefixab  \\ _k          ₖ
  Prefixab  \\ _l          ₗ
  Prefixab  \\ _m          ₘ
  Prefixab  \\ _n          ₙ
  Prefixab  \\ _o          ₒ
  Prefixab  \\ _p          ₚ
  Prefixab  \\ _r          ᵣ
  Prefixab  \\ _s          ₛ
  Prefixab  \\ _t          ₜ
  Prefixab  \\ _u          ᵤ
  Prefixab  \\ _v          ᵥ
  Prefixab  \\ _x          ₓ

  Prefixab  \\ _0          ₀
  Prefixab  \\ _1          ₁
  Prefixab  \\ _2          ₂
  Prefixab  \\ _3          ₃
  Prefixab  \\ _4          ₄
  Prefixab  \\ _5          ₅
  Prefixab  \\ _6          ₆
  Prefixab  \\ _7          ₇
  Prefixab  \\ _8          ₈
  Prefixab  \\ _9          ₉
  Noprefixab \_+           ₊
  Noprefixab \_-           ₋
  Noprefixab \_=           ₌
  Noprefixab \_(           ₍
  Noprefixab \_)           ₎
  " }}}

  " Superscripts {{{
  Noprefixab \^a           ᵃ
  Noprefixab \^b           ᵇ
  Noprefixab \^c           ᶜ
  Noprefixab \^d           ᵈ
  Noprefixab \^e           ᵉ
  Noprefixab \^f           ᶠ
  Noprefixab \^g           ᵍ
  Noprefixab \^h           ʰ
  Noprefixab \^i           ⁱ
  Noprefixab \^j           ʲ
  Noprefixab \^k           ᵏ
  Noprefixab \^l           ˡ
  Noprefixab \^m           ᵐ
  Noprefixab \^n           ⁿ
  Noprefixab \^o           ᵒ
  Noprefixab \^p           ᵖ
  Noprefixab \^r           ʳ
  Noprefixab \^s           ˢ
  Noprefixab \^t           ᵗ
  Noprefixab \^u           ᵘ
  Noprefixab \^v           ᵛ
  Noprefixab \^w           ʷ
  Noprefixab \^x           ˣ
  Noprefixab \^y           ʸ
  Noprefixab \^z           ᶻ

  Noprefixab \^A           ᴬ
  Noprefixab \^B           ᴮ
  Noprefixab \^D           ᴰ
  Noprefixab \^E           ᴱ
  Noprefixab \^G           ᴳ
  Noprefixab \^H           ᴴ
  Noprefixab \^I           ᴵ
  Noprefixab \^J           ᴶ
  Noprefixab \^K           ᴷ
  Noprefixab \^L           ᴸ
  Noprefixab \^M           ᴹ
  Noprefixab \^N           ᴺ
  Noprefixab \^O           ᴼ
  Noprefixab \^P           ᴾ
  Noprefixab \^R           ᴿ
  Noprefixab \^T           ᵀ
  Noprefixab \^U           ᵁ
  Noprefixab \^V           ⱽ
  Noprefixab \^W           ᵂ

  Noprefixab \^0           ⁰
  Noprefixab \^1           ¹
  Noprefixab \^2           ²
  Noprefixab \^3           ³
  Noprefixab \^4           ⁴
  Noprefixab \^5           ⁵
  Noprefixab \^6           ⁶
  Noprefixab \^7           ⁷
  Noprefixab \^8           ⁸
  Noprefixab \^9           ⁹
  Noprefixab \^+           ⁺
  Noprefixab \^-           ⁻
  Noprefixab \^=           ⁼
  Noprefixab \^(           ⁽
  Noprefixab \^)           ⁾
  " }}}

  " Circled {{{

  " Numbers {{{
  Noprefixab \(0)          ⓪
  Noprefixab \(1)          ①
  Noprefixab \(2)          ②
  Noprefixab \(3)          ③
  Noprefixab \(4)          ④
  Noprefixab \(5)          ⑤
  Noprefixab \(6)          ⑥
  Noprefixab \(7)          ⑦
  Noprefixab \(8)          ⑧
  Noprefixab \(9)          ⑨
  Noprefixab \(10)         ⑩
  Noprefixab \(11)         ⑪
  Noprefixab \(12)         ⑫
  Noprefixab \(13)         ⑬
  Noprefixab \(14)         ⑭
  Noprefixab \(15)         ⑮
  Noprefixab \(16)         ⑯
  Noprefixab \(17)         ⑰
  Noprefixab \(18)         ⑱
  Noprefixab \(19)         ⑲
  Noprefixab \(20)         ⑳
  " }}}

  " Uppercase {{{
  Noprefixab \(A)          Ⓐ
  Noprefixab \(B)          Ⓑ
  Noprefixab \(C)          Ⓒ
  Noprefixab \(D)          Ⓓ
  Noprefixab \(E)          Ⓔ
  Noprefixab \(F)          Ⓕ
  Noprefixab \(G)          Ⓖ
  Noprefixab \(H)          Ⓗ
  Noprefixab \(I)          Ⓘ
  Noprefixab \(J)          Ⓙ
  Noprefixab \(K)          Ⓚ
  Noprefixab \(L)          Ⓛ
  Noprefixab \(M)          Ⓜ
  Noprefixab \(N)          Ⓝ
  Noprefixab \(O)          Ⓞ
  Noprefixab \(P)          Ⓟ
  Noprefixab \(Q)          Ⓠ
  Noprefixab \(R)          Ⓡ
  Noprefixab \(S)          Ⓢ
  Noprefixab \(T)          Ⓣ
  Noprefixab \(U)          Ⓤ
  Noprefixab \(V)          Ⓥ
  Noprefixab \(W)          Ⓦ
  Noprefixab \(X)          Ⓧ
  Noprefixab \(Y)          Ⓨ
  Noprefixab \(Z)          Ⓩ
  " }}}

  " Lowercase {{{
  Noprefixab \(a)          ⓐ
  Noprefixab \(b)          ⓑ
  Noprefixab \(c)          ⓒ
  Noprefixab \(d)          ⓓ
  Noprefixab \(e)          ⓔ
  Noprefixab \(f)          ⓕ
  Noprefixab \(g)          ⓖ
  Noprefixab \(h)          ⓗ
  Noprefixab \(i)          ⓘ
  Noprefixab \(j)          ⓙ
  Noprefixab \(k)          ⓚ
  Noprefixab \(l)          ⓛ
  Noprefixab \(m)          ⓜ
  Noprefixab \(n)          ⓝ
  Noprefixab \(o)          ⓞ
  Noprefixab \(p)          ⓟ
  Noprefixab \(q)          ⓠ
  Noprefixab \(r)          ⓡ
  Noprefixab \(s)          ⓢ
  Noprefixab \(t)          ⓣ
  Noprefixab \(u)          ⓤ
  Noprefixab \(v)          ⓥ
  Noprefixab \(w)          ⓦ
  Noprefixab \(x)          ⓧ
  Noprefixab \(y)          ⓨ
  Noprefixab \(z)          ⓩ
  " }}}
  " }}}
endfunction
command! Unicoder call s:setup_abbreviations()
