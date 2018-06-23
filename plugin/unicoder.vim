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
  return getline('.')[col('.') - len(a:prefix) - 1] == a:prefix ?  "\<bs>".a:repl : a:default
endfunction

function! s:crepl(prefix, default, repl)
  return getcmdline()[getcmdpos() - len(a:prefix) - 1] == a:prefix ? nr2char(8).a:repl : a:default
endfunction

function! s:Prefixab(opts, prefix, lhs, rhs)
  let args = string(a:prefix).', '.string(a:lhs).', '.string(a:rhs)
  exe 'inoreab '.a:opts.' '.a:lhs.' <c-r>=<sid>irepl('.args.')<cr>'
  if g:unicoder_command_abbreviations
    exe 'cnoreab '.a:opts.' '.a:lhs.' <c-r>=<sid>crepl('.args.')<cr>'
  endif
endfunction
command! -nargs=+ Prefixab call s:Prefixab('<buffer>', <f-args>)

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
  Prefixab \\ GA     Α
  Prefixab \\ GB     Β
  Prefixab \\ GG     Γ
  Prefixab \\ GD     Δ
  Prefixab \\ GE     Ε
  Prefixab \\ GZ     Ζ
  Prefixab \\ GH     Η
  Prefixab \\ GTH    Θ
  Prefixab \\ GI     Ι
  Prefixab \\ GK     Κ
  Prefixab \\ GL     Λ
  Prefixab \\ GM     Μ
  Prefixab \\ GN     Ν
  Prefixab \\ GX     Ξ
  Prefixab \\ GO     Ο
  Prefixab \\ GP     Π
  Prefixab \\ GR     Ρ
  Prefixab \\ GS     Σ
  Prefixab \\ GT     Τ
  Prefixab \\ GU     Υ
  Prefixab \\ GF     Φ
  Prefixab \\ GC     Χ
  Prefixab \\ GPS    Ψ
  Prefixab \\ GW     Ω

  Prefixab \\ Alpha       Α
  Prefixab \\ Beta        Β
  Prefixab \\ Gamma       Γ
  Prefixab \\ Delta       Δ
  Prefixab \\ Epsilon     Ε
  Prefixab \\ Zeta        Ζ
  Prefixab \\ Eta         Η
  Prefixab \\ Theta       Θ
  Prefixab \\ Iota        Ι
  Prefixab \\ Kappa       Κ
  Prefixab \\ Lambda      Λ
  Prefixab \\ Mu          Μ
  Prefixab \\ Nu          Ν
  Prefixab \\ Xi          Ξ
  Prefixab \\ Omicron     Ο
  Prefixab \\ Pi          Π
  Prefixab \\ Rho         Ρ
  Prefixab \\ Sigma       Σ
  Prefixab \\ Tau         Τ
  Prefixab \\ Upsilon     Υ
  Prefixab \\ Phi         Φ
  Prefixab \\ Chi         Χ
  Prefixab \\ Psi         Ψ
  Prefixab \\ Omega       Ω
  " }}}

  " Lowercase greek {{{
  Prefixab \\ ga     α
  Prefixab \\ gb     β
  Prefixab \\ gg     γ
  Prefixab \\ gd     δ
  Prefixab \\ ge     ε
  Prefixab \\ gz     ζ
  Prefixab \\ gh     η
  Prefixab \\ gth    θ
  Prefixab \\ gi     ι
  Prefixab \\ gk     κ
  Prefixab \\ gl     λ
  Prefixab \\ gm     μ
  Prefixab \\ gn     ν
  Prefixab \\ gx     ξ
  Prefixab \\ go     ο
  Prefixab \\ gp     π
  Prefixab \\ gr     ρ
  Prefixab \\ gs     σ
  Prefixab \\ gt     τ
  Prefixab \\ gu     υ
  Prefixab \\ gf     φ
  Prefixab \\ gc     χ
  Prefixab \\ gps    ψ
  Prefixab \\ gw     ω

  Prefixab \\ alpha       α
  Prefixab \\ beta        β
  Prefixab \\ gamma       γ
  Prefixab \\ delta       δ
  Prefixab \\ epsilon     ε
  Prefixab \\ zeta        ζ
  Prefixab \\ eta         η
  Prefixab \\ theta       θ
  Prefixab \\ iota        ι
  Prefixab \\ kappa       κ
  Prefixab \\ lambda      λ
  Prefixab \\ mu          μ
  Prefixab \\ nu          ν
  Prefixab \\ xi          ξ
  Prefixab \\ omicron     ο
  Prefixab \\ pi          π
  Prefixab \\ rho         ρ
  Prefixab \\ sigma       σ
  Prefixab \\ tau         τ
  Prefixab \\ upsilon     υ
  Prefixab \\ phi         φ
  Prefixab \\ chi         χ
  Prefixab \\ psi         ψ
  Prefixab \\ omega       ω
  " }}}
  " }}}

  " Shapes {{{
  Prefixab \\ box         □
  Prefixab \\ bbox        ■
  Prefixab \\ sbox        ▫
  Prefixab \\ sbbox       ▪

  Prefixab \\ square      □
  Prefixab \\ bsquare     ■
  Prefixab \\ ssquare     ▫
  Prefixab \\ sbsquare    ▪

  Prefixab \\ diamond     ◇
  Prefixab \\ bdiamond    ◆
  Prefixab \\ lozenge     ◊

  Prefixab \\ circle      ○
  Prefixab \\ bcircle     ●
  Prefixab \\ dcircle     ◌

  Prefixab \\ triangle    △
  Prefixab \\ btriangle   ▲

  Prefixab \\ skull       ☠
  Prefixab \\ danger      ☡
  Prefixab \\ radiation   ☢
  Prefixab \\ biohazard   ☣
  Prefixab \\ yinyang     ☯
  Prefixab \\ frownie     ☹
  Prefixab \\ smiley      ☺
  Prefixab \\ blacksmiley ☻
  Prefixab \\ sun         ☼
  Prefixab \\ rightmoon   ☽
  Prefixab \\ leftmoon    ☾
  Prefixab \\ female      ♀
  Prefixab \\ male        ♂
  " }}}

  " Miscellaneous {{{
  Prefixab \\ dagger      †
  Prefixab \\ ddager      ‡
  Prefixab \\ prime       ′
  Prefixab \\ second      ″
  Prefixab \\ third       ‴
  Prefixab \\ fourth      ⁗
  Prefixab \\ euro        €
  " }}}

  " Math {{{
  Prefixab \\ pm          ±
  Prefixab \\ mp          ∓

  Prefixab \\ sum         ∑
  Prefixab \\ prod        ∏
  Prefixab \\ coprod      ∐

  Prefixab \\ qed         ∎
  Prefixab \\ ast         ∗
  inoreab   \x            ×
  Prefixab \\ times       ×
  Prefixab \\ div         ÷
  Prefixab \\ bullet      •
  Prefixab \\ o           ∘
  Prefixab \\ comp        ∘
  Prefixab \\ circ        ∘
  Prefixab \\ cdot        ∙
  inoreab   \.            ∙
  inoreab   \:            ∶
  inoreab   \::           ∷
  Prefixab \\ sqrt        √
  Prefixab \\ sqrt3       ∛
  Prefixab \\ sqrt4       ∜
  Prefixab \\ inf         ∞
  Prefixab \\ propto      ∝
  Prefixab \\ pitchfork   ⋔

  Prefixab \\ forall      ∀
  Prefixab \\ all         ∀
  Prefixab \\ exists      ∃
  Prefixab \\ ex          ∃
  Prefixab \\ nexists     ∄
  Prefixab \\ nex         ∄

  " Sets {{{
  Prefixab \\ empty       ∅
  Prefixab \\ emptyset    ∅
  Prefixab \\ in          ∈
  Prefixab \\ notin       ∉

  Prefixab \\ inters      ∩
  Prefixab \\ cap         ∩
  Prefixab \\ union       ∪
  Prefixab \\ cup         ∪

  Prefixab \\ subset      ⊂
  Prefixab \\ supset      ⊃
  Prefixab \\ nsubset     ⊄
  Prefixab \\ nsupset     ⊅
  Prefixab \\ subseteq    ⊆
  Prefixab \\ supseteq    ⊇
  Prefixab \\ nsubseteq   ⊈
  Prefixab \\ nsupseteq   ⊉
  " }}}

  " Lattices {{{
  Prefixab \\ sqsubset    ⊏
  Prefixab \\ sqsupset    ⊐
  Prefixab \\ sqsubseteq  ⊑
  Prefixab \\ sqsupseteq  ⊒
  Prefixab \\ sqcap       ⊓
  Prefixab \\ sqcup       ⊔
  " }}}

  " Logic {{{
  Prefixab \\ land        ∧
  Prefixab \\ lor         ∨
  Prefixab \\ lnot        ¬
  Prefixab \\ neg         ¬

  Prefixab \\ top         ⊤
  Prefixab \\ bot         ⊥

  Prefixab \\ multimap    ⊸
  inoreab   \-o           ⊸
  Prefixab \\ multimapinv ⟜
  Prefixab \\ invmultimap ⟜

  Prefixab \\ parr        ⅋
  Prefixab \\ invamp      ⅋

  Prefixab \\ therefore   ∴
  Prefixab \\ because     ∵
  " }}}

  " Calculus {{{
  Prefixab \\ nabla       ∇
  Prefixab \\ grad        ∇
  Prefixab \\ partial     𝜕
  Prefixab \\ increment   ∆
  Prefixab \\ inc         ∆

  Prefixab \\ int         ∫
  Prefixab \\ iint        ∬
  Prefixab \\ iiint       ∭
  Prefixab \\ oint        ∮
  Prefixab \\ oiint       ∯
  Prefixab \\ oiiint      ∰
  " }}}

  " Equalities {{{
  Prefixab \\ sim         ∼
  Prefixab \\ nsim        ≁
  inoreab   \~            ∼
  inoreab   \~n           ≁

  Prefixab \\ simeq       ≃
  Prefixab \\ nsimeq      ≄
  inoreab   \~=           ≃
  inoreab   \~=n          ≄

  Prefixab \\ cong        ≅
  Prefixab \\ ncong       ≇
  Prefixab \\ iso         ≅
  Prefixab \\ niso        ≇
  inoreab   \~==          ≅
  inoreab   \~==n         ≇

  Prefixab \\ approx      ≈
  Prefixab \\ napprox     ≉
  inoreab   \~~           ≈
  inoreab   \~~n          ≉

  Prefixab \\ neq         ≠
  inoreab   \=n           ≠
  inoreab   \!=           ≠
  inoreab   \/=           ≠

  Prefixab \\ equiv       ≡
  Prefixab \\ nequiv      ≢
  inoreab   \===          ≡
  inoreab   \===n         ≢

  Prefixab \\ Equiv       ≣
  inoreab   \====         ≣
  " }}}

  " Inequalities {{{
  Prefixab \\ leq         ≤
  Prefixab \\ nleq        ≰
  inoreab   \<=         ≤
  inoreab   \<=n        ≰

  Prefixab \\ geq         ≥
  Prefixab \\ ngeq        ≱
  inoreab   \>=         ≥
  inoreab   \>=n        ≱

  Prefixab \\ ll          «
  inoreab   \<<           «
  Prefixab \\ lll         ⋘
  inoreab   \<<<          ⋘

  Prefixab \\ gg          »
  inoreab   \>>           »
  Prefixab \\ ggg         ⋙
  inoreab   \>>>          ⋙
  " }}}

  " Entailment (turnstiles) {{{
  Prefixab \\ entails     ⊢
  Prefixab \\ nentails    ⊬
  Prefixab \\ vdash       ⊢
  Prefixab \\ nvdash      ⊬
  inoreab   \\|-          ⊢
  inoreab   \\|-n         ⊬

  Prefixab \\ dashv       ⊣
  inoreab   \-\|          ⊣

  Prefixab \\ models      ⊨
  Prefixab \\ vDash       ⊨
  Prefixab \\ nvDash      ⊭
  inoreab   \\|=          ⊨
  inoreab   \\|=n         ⊭

  Prefixab \\ Vdash       ⊩
  Prefixab \\ nVdash      ⊮
  inoreab   \\|\|-        ⊩
  inoreab   \\|\|-n       ⊮

  Prefixab \\ VDash       ⊫
  Prefixab \\ nVDash      ⊯
  inoreab   \\|\|=        ⊫
  inoreab   \\|\|=n       ⊯

  Prefixab \\ Vvdash      ⊪
  inoreab   \\|\|\|-      ⊪
  " }}}

  " Circled operators {{{
  Prefixab \\ oplus       ⊕
  Prefixab \\ ominus      ⊖
  Prefixab \\ otimes      ⊗
  Prefixab \\ oslash      ⊘
  Prefixab \\ odot        ⊙
  Prefixab \\ ocirc       ⊚
  Prefixab \\ oast        ⊛
  Prefixab \\ oequal      ⊜

  inoreab   \o+           ⊕
  inoreab   \o-           ⊖
  Prefixab \\ ox          ⊗
  inoreab   \o/           ⊘
  inoreab   \o.           ⊙
  Prefixab \\ oo          ⊚
  inoreab   \o*           ⊛
  inoreab   \o=           ⊜
  " }}}

  " Boxed operators {{{
  Prefixab \\ boxplus     ⊞
  Prefixab \\ boxminus    ⊟
  Prefixab \\ boxtimes    ⊠
  Prefixab \\ boxdot      ⊡

  Prefixab \\ bplus       ⊞
  Prefixab \\ bminus      ⊟
  Prefixab \\ btimes      ⊠
  Prefixab \\ bdot        ⊡

  inoreab   \b+           ⊞
  inoreab   \b-           ⊟
  Prefixab \\ bx          ⊠
  inoreab   \b.           ⊡
  " }}}
  " }}}

  " Dots {{{
  Prefixab \\ ldots       …
  inoreab   \...          …
  Prefixab \\ cdots       ⋯
  Prefixab \\ vdots       ⋮
  Prefixab \\ iddots      ⋰
  Prefixab \\ ddots       ⋱
  " }}}

  " Arrows {{{

  " Simple {{{
  Prefixab \\ mapsto      ↦

  Prefixab \\ to          →
  Prefixab \\ arrow       →
  Prefixab \\ rarrow      →
  Prefixab \\ rightarrow  →
  Prefixab \\ larrow      ←
  Prefixab \\ leftarrow   ←
  Prefixab \\ uarrow      ↑
  Prefixab \\ uparrow     ↑
  Prefixab \\ darrow      ↓
  Prefixab \\ downarrow   ↓
  Prefixab \\ lrarrow     ↔
  Prefixab \\ leftrightarrow ↔
  Prefixab \\ udarrow     ↕
  Prefixab \\ updownarrow ↕
  Prefixab \\ nwarrow     ↖
  Prefixab \\ nearrow     ↗
  Prefixab \\ searrow     ↘
  Prefixab \\ swarrow     ↙

  inoreab   \->           →
  inoreab   \<-           ←
  inoreab   \-v           ↓
  inoreab   \-^           ↑
  inoreab   \-!           ↑
  inoreab   \<->          ↔
  inoreab   \^-v          ↕
  inoreab   \!-v          ↕
  " }}}

  " Double {{{
  Prefixab \\ To          ⇒
  Prefixab \\ Arrow       ⇒
  Prefixab \\ Rarrow      ⇒
  Prefixab \\ Rightarrow  ⇒
  Prefixab \\ Larrow      ⇐
  Prefixab \\ Leftarrow   ⇐
  Prefixab \\ Uarrow      ⇑
  Prefixab \\ Uparrow     ⇑
  Prefixab \\ Darrow      ⇓
  Prefixab \\ Downarrow   ⇓
  Prefixab \\ Lrarrow     ⇔
  Prefixab \\ Leftrightarrow ⇔
  Prefixab \\ Udarrow     ⇕
  Prefixab \\ Updownarrow ⇕
  Prefixab \\ Nwarrow     ⇖
  Prefixab \\ Nearrow     ⇗
  Prefixab \\ Searrow     ⇘
  Prefixab \\ Swarrow     ⇙

  inoreab   \=>           ⇒
  inoreab   \=<           ⇐
  inoreab   \=v           ⇓
  inoreab   \=^           ⇑
  inoreab   \=!           ⇑
  inoreab   \<=>          ⇔
  inoreab   \^=v          ⇕
  inoreab   \!=v          ⇕
  " }}}
  " }}}

  " Sets {{{
  Prefixab \\ bb          𝔹
  Prefixab \\ bn          ℕ
  Prefixab \\ bz          ℤ
  Prefixab \\ bq          ℚ
  Prefixab \\ br          ℝ
  Prefixab \\ bc          ℂ
  Prefixab \\ bp          ℙ

  Prefixab \\ Bool        𝔹
  Prefixab \\ Bools       𝔹
  Prefixab \\ Nats        ℕ
  Prefixab \\ Ints        ℤ
  Prefixab \\ Rats        ℚ
  Prefixab \\ Comps       ℂ
  Prefixab \\ Quats       ℍ

  Prefixab \\ Boolean     𝔹
  Prefixab \\ Booleans    𝔹
  Prefixab \\ Integers    ℤ
  Prefixab \\ Rationals   ℚ
  Prefixab \\ Reals       ℝ
  Prefixab \\ Complex     ℂ
  Prefixab \\ Complexes   ℂ
  Prefixab \\ Quaternions ℍ
  Prefixab \\ Primes      ℙ
  " }}}

  " Fractions {{{
  Prefixab \\ frac14      ¼
  Prefixab \\ frac12      ½
  Prefixab \\ frac34      ¾
  Prefixab \\ frac13      ⅓
  Prefixab \\ frac23      ⅔
  Prefixab \\ frac15      ⅕
  Prefixab \\ frac25      ⅖
  Prefixab \\ frac35      ⅗
  Prefixab \\ frac45      ⅘
  Prefixab \\ frac16      ⅙
  Prefixab \\ frac56      ⅚
  Prefixab \\ frac18      ⅛
  Prefixab \\ frac38      ⅜
  Prefixab \\ frac58      ⅝
  Prefixab \\ frac78      ⅞
  " }}}

  " Subscripts {{{
  Prefixab \\ _a          ₐ
  Prefixab \\ _e          ₑ
  Prefixab \\ _h          ₕ
  Prefixab \\ _i          ᵢ
  Prefixab \\ _j          ⱼ
  Prefixab \\ _k          ₖ
  Prefixab \\ _l          ₗ
  Prefixab \\ _m          ₘ
  Prefixab \\ _n          ₙ
  Prefixab \\ _o          ₒ
  Prefixab \\ _p          ₚ
  Prefixab \\ _r          ᵣ
  Prefixab \\ _s          ₛ
  Prefixab \\ _t          ₜ
  Prefixab \\ _u          ᵤ
  Prefixab \\ _v          ᵥ
  Prefixab \\ _x          ₓ

  Prefixab \\ _0          ₀
  Prefixab \\ _1          ₁
  Prefixab \\ _2          ₂
  Prefixab \\ _3          ₃
  Prefixab \\ _4          ₄
  Prefixab \\ _5          ₅
  Prefixab \\ _6          ₆
  Prefixab \\ _7          ₇
  Prefixab \\ _8          ₈
  Prefixab \\ _9          ₉
  inoreab   \_+           ₊
  inoreab   \_-           ₋
  inoreab   \_=           ₌
  inoreab   \_(           ₍
  inoreab   \_)           ₎
  " }}}

  " Superscripts {{{
  inoreab   \^a           ᵃ
  inoreab   \^b           ᵇ
  inoreab   \^c           ᶜ
  inoreab   \^d           ᵈ
  inoreab   \^e           ᵉ
  inoreab   \^f           ᶠ
  inoreab   \^g           ᵍ
  inoreab   \^h           ʰ
  inoreab   \^i           ⁱ
  inoreab   \^j           ʲ
  inoreab   \^k           ᵏ
  inoreab   \^l           ˡ
  inoreab   \^m           ᵐ
  inoreab   \^n           ⁿ
  inoreab   \^o           ᵒ
  inoreab   \^p           ᵖ
  inoreab   \^r           ʳ
  inoreab   \^s           ˢ
  inoreab   \^t           ᵗ
  inoreab   \^u           ᵘ
  inoreab   \^v           ᵛ
  inoreab   \^w           ʷ
  inoreab   \^x           ˣ
  inoreab   \^y           ʸ
  inoreab   \^z           ᶻ

  inoreab   \^A           ᴬ
  inoreab   \^B           ᴮ
  inoreab   \^D           ᴰ
  inoreab   \^E           ᴱ
  inoreab   \^G           ᴳ
  inoreab   \^H           ᴴ
  inoreab   \^I           ᴵ
  inoreab   \^J           ᴶ
  inoreab   \^K           ᴷ
  inoreab   \^L           ᴸ
  inoreab   \^M           ᴹ
  inoreab   \^N           ᴺ
  inoreab   \^O           ᴼ
  inoreab   \^P           ᴾ
  inoreab   \^R           ᴿ
  inoreab   \^T           ᵀ
  inoreab   \^U           ᵁ
  inoreab   \^V           ⱽ
  inoreab   \^W           ᵂ

  inoreab   \^0           ⁰
  inoreab   \^1           ¹
  inoreab   \^2           ²
  inoreab   \^3           ³
  inoreab   \^4           ⁴
  inoreab   \^5           ⁵
  inoreab   \^6           ⁶
  inoreab   \^7           ⁷
  inoreab   \^8           ⁸
  inoreab   \^9           ⁹
  inoreab   \^+           ⁺
  inoreab   \^-           ⁻
  inoreab   \^=           ⁼
  inoreab   \^(           ⁽
  inoreab   \^)           ⁾
  " }}}

  " Circled {{{

  " Numbers {{{
  inoreab   \(0)          ⓪
  inoreab   \(1)          ①
  inoreab   \(2)          ②
  inoreab   \(3)          ③
  inoreab   \(4)          ④
  inoreab   \(5)          ⑤
  inoreab   \(6)          ⑥
  inoreab   \(7)          ⑦
  inoreab   \(8)          ⑧
  inoreab   \(9)          ⑨
  inoreab   \(10)         ⑩
  inoreab   \(11)         ⑪
  inoreab   \(12)         ⑫
  inoreab   \(13)         ⑬
  inoreab   \(14)         ⑭
  inoreab   \(15)         ⑮
  inoreab   \(16)         ⑯
  inoreab   \(17)         ⑰
  inoreab   \(18)         ⑱
  inoreab   \(19)         ⑲
  inoreab   \(20)         ⑳
  " }}}

  " Uppercase {{{
  inoreab   \(A)          Ⓐ
  inoreab   \(B)          Ⓑ
  inoreab   \(C)          Ⓒ
  inoreab   \(D)          Ⓓ
  inoreab   \(E)          Ⓔ
  inoreab   \(F)          Ⓕ
  inoreab   \(G)          Ⓖ
  inoreab   \(H)          Ⓗ
  inoreab   \(I)          Ⓘ
  inoreab   \(J)          Ⓙ
  inoreab   \(K)          Ⓚ
  inoreab   \(L)          Ⓛ
  inoreab   \(M)          Ⓜ
  inoreab   \(N)          Ⓝ
  inoreab   \(O)          Ⓞ
  inoreab   \(P)          Ⓟ
  inoreab   \(Q)          Ⓠ
  inoreab   \(R)          Ⓡ
  inoreab   \(S)          Ⓢ
  inoreab   \(T)          Ⓣ
  inoreab   \(U)          Ⓤ
  inoreab   \(V)          Ⓥ
  inoreab   \(W)          Ⓦ
  inoreab   \(X)          Ⓧ
  inoreab   \(Y)          Ⓨ
  inoreab   \(Z)          Ⓩ
  " }}}

  " Lowercase {{{
  inoreab   \(a)          ⓐ
  inoreab   \(b)          ⓑ
  inoreab   \(c)          ⓒ
  inoreab   \(d)          ⓓ
  inoreab   \(e)          ⓔ
  inoreab   \(f)          ⓕ
  inoreab   \(g)          ⓖ
  inoreab   \(h)          ⓗ
  inoreab   \(i)          ⓘ
  inoreab   \(j)          ⓙ
  inoreab   \(k)          ⓚ
  inoreab   \(l)          ⓛ
  inoreab   \(m)          ⓜ
  inoreab   \(n)          ⓝ
  inoreab   \(o)          ⓞ
  inoreab   \(p)          ⓟ
  inoreab   \(q)          ⓠ
  inoreab   \(r)          ⓡ
  inoreab   \(s)          ⓢ
  inoreab   \(t)          ⓣ
  inoreab   \(u)          ⓤ
  inoreab   \(v)          ⓥ
  inoreab   \(w)          ⓦ
  inoreab   \(x)          ⓧ
  inoreab   \(y)          ⓨ
  inoreab   \(z)          ⓩ
  " }}}
  " }}}
endfunction
command! Unicoder call s:setup_abbreviations()
