if exists('g:loaded_unicoder')
  finish
endif
let g:loaded_unicoder = 1

"
function! s:Expr(prefix, default, repl)
  if getline('.')[col('.') - 2] == a:prefix
    return "\<bs>".a:repl
  else
    return a:default
  endif
endfunction

function! s:Latexiab(opts, lhs, rhs)
  exe 'inoreab '.a:opts.' '.a:lhs.' <c-r>=<sid>Expr("\\", '.string(a:lhs).', '.string(a:rhs).')<cr>'
endfunction
command! -nargs=+ Latexiab call s:Latexiab('<buffer>', <f-args>)

"
if !exists('g:unicoder_exclude_filetypes')
  let g:unicoder_exclude_filetypes = ['tex', 'latex', 'plaintex']
endif

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
  Latexiab GA     Α
  Latexiab GB     Β
  Latexiab GG     Γ
  Latexiab GD     Δ
  Latexiab GE     Ε
  Latexiab GZ     Ζ
  Latexiab GH     Η
  Latexiab GTH    Θ
  Latexiab GI     Ι
  Latexiab GK     Κ
  Latexiab GL     Λ
  Latexiab GM     Μ
  Latexiab GN     Ν
  Latexiab GX     Ξ
  Latexiab GO     Ο
  Latexiab GP     Π
  Latexiab GR     Ρ
  Latexiab GS     Σ
  Latexiab GT     Τ
  Latexiab GU     Υ
  Latexiab GF     Φ
  Latexiab GC     Χ
  Latexiab GPS    Ψ
  Latexiab GW     Ω

  Latexiab Alpha       Α
  Latexiab Beta        Β
  Latexiab Gamma       Γ
  Latexiab Delta       Δ
  Latexiab Epsilon     Ε
  Latexiab Zeta        Ζ
  Latexiab Eta         Η
  Latexiab Theta       Θ
  Latexiab Iota        Ι
  Latexiab Kappa       Κ
  Latexiab Lambda      Λ
  Latexiab Mu          Μ
  Latexiab Nu          Ν
  Latexiab Xi          Ξ
  Latexiab Omicron     Ο
  Latexiab Pi          Π
  Latexiab Rho         Ρ
  Latexiab Sigma       Σ
  Latexiab Tau         Τ
  Latexiab Upsilon     Υ
  Latexiab Phi         Φ
  Latexiab Chi         Χ
  Latexiab Psi         Ψ
  Latexiab Omega       Ω
  " }}}

  " Lowercase greek {{{
  Latexiab ga     α
  Latexiab gb     β
  Latexiab gg     γ
  Latexiab gd     δ
  Latexiab ge     ε
  Latexiab gz     ζ
  Latexiab gh     η
  Latexiab gth    θ
  Latexiab gi     ι
  Latexiab gk     κ
  Latexiab gl     λ
  Latexiab gm     μ
  Latexiab gn     ν
  Latexiab gx     ξ
  Latexiab go     ο
  Latexiab gp     π
  Latexiab gr     ρ
  Latexiab gs     σ
  Latexiab gt     τ
  Latexiab gu     υ
  Latexiab gf     φ
  Latexiab gc     χ
  Latexiab gps    ψ
  Latexiab gw     ω

  Latexiab alpha       α
  Latexiab beta        β
  Latexiab gamma       γ
  Latexiab delta       δ
  Latexiab epsilon     ε
  Latexiab zeta        ζ
  Latexiab eta         η
  Latexiab theta       θ
  Latexiab iota        ι
  Latexiab kappa       κ
  Latexiab lambda      λ
  Latexiab mu          μ
  Latexiab nu          ν
  Latexiab xi          ξ
  Latexiab omicron     ο
  Latexiab pi          π
  Latexiab rho         ρ
  Latexiab sigma       σ
  Latexiab tau         τ
  Latexiab upsilon     υ
  Latexiab phi         φ
  Latexiab chi         χ
  Latexiab psi         ψ
  Latexiab omega       ω
  " }}}
  " }}}

  " Shapes {{{
  Latexiab box         □
  Latexiab bbox        ■
  Latexiab sbox        ▫
  Latexiab sbbox       ▪

  Latexiab square      □
  Latexiab bsquare     ■
  Latexiab ssquare     ▫
  Latexiab sbsquare    ▪

  Latexiab diamond     ◇
  Latexiab bdiamond    ◆
  Latexiab lozenge     ◊

  Latexiab circle      ○
  Latexiab bcircle     ●
  Latexiab dcircle     ◌

  Latexiab triangle    △
  Latexiab btriangle   ▲

  Latexiab skull       ☠
  Latexiab danger      ☡
  Latexiab radiation   ☢
  Latexiab biohazard   ☣
  Latexiab yinyang     ☯
  Latexiab frownie     ☹
  Latexiab smiley      ☺
  Latexiab blacksmiley ☻

  Latexiab sun         ☼
  Latexiab rightmoon   ☽
  Latexiab leftmoon    ☾
  Latexiab female      ♀
  Latexiab male        ♂
  " }}}

  " Miscellaneous {{{
  Latexiab dagger      †
  Latexiab ddager      ‡
  Latexiab prime       ′
  Latexiab second      ″
  Latexiab third       ‴
  Latexiab fourth      ⁗
  Latexiab euro        €
  " }}}

  " Math {{{
  Latexiab pm          ±
  Latexiab mp          ∓

  Latexiab sum         ∑
  Latexiab prod        ∏
  Latexiab coprod      ∐

  Latexiab qed         ∎
  Latexiab ast         ∗
  Latexiab x           ×
  Latexiab times       ×
  Latexiab div         ÷
  Latexiab bullet      •
  Latexiab o           ∘
  Latexiab comp        ∘
  Latexiab circ        ∘
  Latexiab cdot        ∙
  inoreab \.           ∙
  inoreab \:           ∶
  inoreab \::          ∷
  Latexiab sqrt        √
  Latexiab sqrt3       ∛
  Latexiab sqrt4       ∜
  Latexiab inf         ∞
  Latexiab propto      ∝
  Latexiab pitchfork   ⋔

  Latexiab forall      ∀
  Latexiab all         ∀
  Latexiab exists      ∃
  Latexiab ex          ∃
  Latexiab nexists     ∄
  Latexiab nex         ∄

  " Sets {{{
  Latexiab empty       ∅
  Latexiab emptyset    ∅
  Latexiab in          ∈
  Latexiab notin       ∉

  Latexiab inters      ∩
  Latexiab cap         ∩
  Latexiab union       ∪
  Latexiab cup         ∪

  Latexiab subset      ⊂
  Latexiab supset      ⊃
  Latexiab nsubset     ⊄
  Latexiab nsupset     ⊅
  Latexiab subseteq    ⊆
  Latexiab supseteq    ⊇
  Latexiab nsubseteq   ⊈
  Latexiab nsupseteq   ⊉
  " }}}

  " Lattices {{{
  Latexiab sqsubset    ⊏
  Latexiab sqsupset    ⊐
  Latexiab sqsubseteq  ⊑
  Latexiab sqsupseteq  ⊒
  Latexiab sqcap       ⊓
  Latexiab sqcup       ⊔
  " }}}

  " Logic {{{
  Latexiab land        ∧
  Latexiab lor         ∨
  Latexiab lnot        ¬
  Latexiab neg         ¬

  Latexiab top         ⊤
  Latexiab bot         ⊥

  Latexiab multimap    ⊸
  inoreab \-o          ⊸
  Latexiab multimapinv ⟜
  Latexiab invmultimap ⟜

  Latexiab parr        ⅋
  Latexiab invamp      ⅋

  Latexiab therefore   ∴
  Latexiab because     ∵
  " }}}

  " Calculus {{{
  Latexiab nabla       ∇
  Latexiab partial     𝜕
  Latexiab increment   ∆
  Latexiab inc         ∆

  Latexiab int         ∫
  Latexiab iint        ∬
  Latexiab iiint       ∭
  Latexiab oint        ∮
  Latexiab oiint       ∯
  Latexiab oiiint      ∰
  " }}}

  " Equalities {{{
  Latexiab sim         ∼
  Latexiab nsim        ≁
  inoreab \~           ∼
  inoreab \~n          ≁

  Latexiab simeq       ≃
  Latexiab nsimeq      ≄
  inoreab \~=          ≃
  inoreab \~=n         ≄

  Latexiab cong        ≅
  Latexiab ncong       ≇
  Latexiab iso         ≅
  Latexiab niso        ≇
  inoreab \~==         ≅
  inoreab \~==n        ≇

  Latexiab approx      ≈
  Latexiab napprox     ≉
  inoreab \~~          ≈
  inoreab \~~n         ≉

  Latexiab neq         ≠
  inoreab \=n          ≠
  inoreab \!=          ≠
  inoreab \/=          ≠

  Latexiab equiv       ≡
  Latexiab nequiv      ≢
  inoreab \===         ≡
  inoreab \===n        ≢

  Latexiab Equiv       ≣
  inoreab \====        ≣
  " }}}

  " Inequalities {{{
  Latexiab leq         ≤
  Latexiab nleq        ≰
  inoreab  \<=         ≤
  inoreab  \<=n        ≰

  Latexiab geq         ≥
  Latexiab ngeq        ≱
  inoreab  \>=         ≥
  inoreab  \>=n        ≱

  Latexiab ll          «
  inoreab \<<          «
  Latexiab lll         ⋘
  inoreab \<<<         ⋘

  Latexiab gg          »
  inoreab \>>          »
  Latexiab ggg         ⋙
  inoreab \>>>         ⋙
  " }}}

  " Entailment (turnstiles) {{{
  Latexiab entails     ⊢
  Latexiab nentails    ⊬
  Latexiab vdash       ⊢
  Latexiab nvdash      ⊬
  inoreab \\|-         ⊢
  inoreab \\|-n        ⊬

  Latexiab dashv       ⊣
  inoreab \-\|         ⊣

  Latexiab vDash       ⊨
  Latexiab nvDash      ⊭
  inoreab \\|=         ⊨
  inoreab \\|=n        ⊭

  Latexiab Vdash       ⊩
  Latexiab nVdash      ⊮
  inoreab \\|\|-       ⊩
  inoreab \\|\|-n      ⊮

  Latexiab VDash       ⊫
  Latexiab nVDash      ⊯
  inoreab \\|\|=       ⊫
  inoreab \\|\|=n      ⊯

  Latexiab Vvdash      ⊪
  inoreab \\|\|\|-     ⊪
  " }}}

  " Circled operators {{{
  Latexiab oplus       ⊕
  Latexiab ominus      ⊖
  Latexiab otimes      ⊗
  Latexiab oslash      ⊘
  Latexiab odot        ⊙
  Latexiab ocirc       ⊚
  Latexiab oast        ⊛
  Latexiab oequal      ⊜

  inoreab \o+          ⊕
  inoreab \o-          ⊖
  Latexiab ox          ⊗
  inoreab \o/          ⊘
  inoreab \o.          ⊙
  Latexiab oo          ⊚
  inoreab \o*          ⊛
  inoreab \o=          ⊜
  " }}}

  " Boxed operators {{{
  Latexiab boxplus     ⊞
  Latexiab boxminus    ⊟
  Latexiab boxtimes    ⊠
  Latexiab boxdot      ⊡

  Latexiab bplus       ⊞
  Latexiab bminus      ⊟
  Latexiab btimes      ⊠
  Latexiab bdot        ⊡

  inoreab \b+          ⊞
  Latexiab \b-         ⊟
  inoreab bx           ⊠
  inoreab \b.          ⊡
  " }}}
  " }}}

  " Dots {{{
  Latexiab ldots       …
  inoreab \...         …
  Latexiab cdots       ⋯
  Latexiab vdots       ⋮
  Latexiab iddots      ⋰
  Latexiab ddots       ⋱
  " }}}

  " Arrows {{{
  " Simple {{{
  Latexiab to          →
  Latexiab arrow       →
  Latexiab rarrow      →
  Latexiab rightarrow  →
  Latexiab larrow      ←
  Latexiab leftarrow   ←
  Latexiab uarrow      ↑
  Latexiab uparrow     ↑
  Latexiab darrow      ↓
  Latexiab downarrow   ↓
  Latexiab lrarrow     ↔
  Latexiab leftrightarrow ↔
  Latexiab uparrow     ↕
  Latexiab updownarrow ↕
  Latexiab nwarrow     ↖
  Latexiab nearrow     ↗
  Latexiab searrow     ↘
  Latexiab swarrow     ↙

  inoreab \->          →
  inoreab \<-          ←
  inoreab \-v          ↓
  inoreab \-^          ↑
  inoreab \-!          ↑
  inoreab \<->         ↔
  inoreab \^-v         ↕
  inoreab \!-v         ↕
  " }}}

  " Double {{{
  Latexiab To          ⇒
  Latexiab Arrow       ⇒
  Latexiab Rarrow      ⇒
  Latexiab Rightarrow  ⇒
  Latexiab Larrow      ⇐
  Latexiab Leftarrow   ⇐
  Latexiab Uarrow      ⇑
  Latexiab Uparrow     ⇑
  Latexiab Darrow      ⇓
  Latexiab Downarrow   ⇓
  Latexiab Lrarrow     ⇔
  Latexiab Leftrightarrow ⇔
  Latexiab Uparrow     ⇕
  Latexiab Updownarrow ⇕
  Latexiab Nwarrow     ⇖
  Latexiab Nearrow     ⇗
  Latexiab Searrow     ⇘
  Latexiab Swarrow     ⇙

  inoreab \=>          ⇒
  inoreab \<=          ⇐
  inoreab \=v          ⇓
  inoreab \=^          ⇑
  inoreab \=!          ⇑
  inoreab \<=>         ⇔
  inoreab \^=v         ⇕
  inoreab \!=v         ⇕
  " }}}
  " }}}

  " Sets {{{
  Latexiab bn          ℕ
  Latexiab bz          ℤ
  Latexiab bq          ℚ
  Latexiab br          ℝ
  Latexiab bc          ℂ
  Latexiab bp          ℙ
  Latexiab bb          𝔹
  Latexiab bsum        ⅀

  Latexiab Bool        𝔹
  Latexiab Bools       𝔹
  Latexiab Nats        ℕ
  Latexiab Ints        ℤ
  Latexiab Rats        ℚ
  Latexiab Comps       ℂ
  Latexiab Quats       ℍ

  Latexiab Boolean     𝔹
  Latexiab Booleans    𝔹
  Latexiab Integers    ℤ
  Latexiab Rationals   ℚ
  Latexiab Reals       ℝ
  Latexiab Complex     ℂ
  Latexiab Complexes   ℂ
  Latexiab Quaternions ℍ
  Latexiab Primes      ℙ
  " }}}

  " Fractions {{{
  Latexiab frac14      ¼
  Latexiab frac12      ½
  Latexiab frac34      ¾
  Latexiab frac13      ⅓
  Latexiab frac23      ⅔
  Latexiab frac15      ⅕
  Latexiab frac25      ⅖
  Latexiab frac35      ⅗
  Latexiab frac45      ⅘
  Latexiab frac16      ⅙
  Latexiab frac56      ⅚
  Latexiab frac18      ⅛
  Latexiab frac38      ⅜
  Latexiab frac58      ⅝
  Latexiab frac78      ⅞
  " }}}

  " Subscripts {{{
  Latexiab _a          ₐ
  Latexiab _e          ₑ
  Latexiab _h          ₕ
  Latexiab _i          ᵢ
  Latexiab _j          ⱼ
  Latexiab _k          ₖ
  Latexiab _l          ₗ
  Latexiab _m          ₘ
  Latexiab _n          ₙ
  Latexiab _o          ₒ
  Latexiab _p          ₚ
  Latexiab _r          ᵣ
  Latexiab _s          ₛ
  Latexiab _t          ₜ
  Latexiab _u          ᵤ
  Latexiab _v          ᵥ
  Latexiab _x          ₓ

  Latexiab _0          ₀
  Latexiab _1          ₁
  Latexiab _2          ₂
  Latexiab _3          ₃
  Latexiab _4          ₄
  Latexiab _5          ₅
  Latexiab _6          ₆
  Latexiab _7          ₇
  Latexiab _8          ₈
  Latexiab _9          ₉
  inoreab \_+          ₊
  inoreab \_-          ₋
  inoreab \_=          ₌
  inoreab \_(          ₍
  inoreab \_)          ₎
  " }}}

  " Superscripts {{{
  inoreab \^a          ᵃ
  inoreab \^b          ᵇ
  inoreab \^c          ᶜ
  inoreab \^d          ᵈ
  inoreab \^e          ᵉ
  inoreab \^f          ᶠ
  inoreab \^g          ᵍ
  inoreab \^h          ʰ
  inoreab \^i          ⁱ
  inoreab \^j          ʲ
  inoreab \^k          ᵏ
  inoreab \^l          ˡ
  inoreab \^m          ᵐ
  inoreab \^n          ⁿ
  inoreab \^o          ᵒ
  inoreab \^p          ᵖ
  inoreab \^r          ʳ
  inoreab \^s          ˢ
  inoreab \^t          ᵗ
  inoreab \^u          ᵘ
  inoreab \^v          ᵛ
  inoreab \^w          ʷ
  inoreab \^x          ˣ
  inoreab \^y          ʸ
  inoreab \^z          ᶻ

  inoreab \^A          ᴬ
  inoreab \^B          ᴮ
  inoreab \^D          ᴰ
  inoreab \^E          ᴱ
  inoreab \^G          ᴳ
  inoreab \^H          ᴴ
  inoreab \^I          ᴵ
  inoreab \^J          ᴶ
  inoreab \^K          ᴷ
  inoreab \^L          ᴸ
  inoreab \^M          ᴹ
  inoreab \^N          ᴺ
  inoreab \^O          ᴼ
  inoreab \^P          ᴾ
  inoreab \^R          ᴿ
  inoreab \^T          ᵀ
  inoreab \^U          ᵁ
  inoreab \^V          ⱽ
  inoreab \^W          ᵂ

  inoreab \^0          ⁰
  inoreab \^1          ¹
  inoreab \^2          ²
  inoreab \^3          ³
  inoreab \^4          ⁴
  inoreab \^5          ⁵
  inoreab \^6          ⁶
  inoreab \^7          ⁷
  inoreab \^8          ⁸
  inoreab \^9          ⁹
  inoreab \^+          ⁺
  inoreab \^-          ⁻
  inoreab \^=          ⁼
  inoreab \^(          ⁽
  inoreab \^)          ⁾
  " }}}

  " Circled {{{

  " Numbers {{{
  inoreab \(0)         ⓪
  inoreab \(1)         ①
  inoreab \(2)         ②
  inoreab \(3)         ③
  inoreab \(4)         ④
  inoreab \(5)         ⑤
  inoreab \(6)         ⑥
  inoreab \(7)         ⑦
  inoreab \(8)         ⑧
  inoreab \(9)         ⑨
  inoreab \(10)        ⑩
  inoreab \(11)        ⑪
  inoreab \(12)        ⑫
  inoreab \(13)        ⑬
  inoreab \(14)        ⑭
  inoreab \(15)        ⑮
  inoreab \(16)        ⑯
  inoreab \(17)        ⑰
  inoreab \(18)        ⑱
  inoreab \(19)        ⑲
  inoreab \(20)        ⑳
  " }}}

  " Uppercase {{{
  inoreab \(A)         Ⓐ
  inoreab \(B)         Ⓑ
  inoreab \(C)         Ⓒ
  inoreab \(D)         Ⓓ
  inoreab \(E)         Ⓔ
  inoreab \(F)         Ⓕ
  inoreab \(G)         Ⓖ
  inoreab \(H)         Ⓗ
  inoreab \(I)         Ⓘ
  inoreab \(J)         Ⓙ
  inoreab \(K)         Ⓚ
  inoreab \(L)         Ⓛ
  inoreab \(M)         Ⓜ
  inoreab \(N)         Ⓝ
  inoreab \(O)         Ⓞ
  inoreab \(P)         Ⓟ
  inoreab \(Q)         Ⓠ
  inoreab \(R)         Ⓡ
  inoreab \(S)         Ⓢ
  inoreab \(T)         Ⓣ
  inoreab \(U)         Ⓤ
  inoreab \(V)         Ⓥ
  inoreab \(W)         Ⓦ
  inoreab \(X)         Ⓧ
  inoreab \(Y)         Ⓨ
  inoreab \(Z)         Ⓩ
  " }}}

  " Lowercase {{{
  inoreab \(a)         ⓐ
  inoreab \(b)         ⓑ
  inoreab \(c)         ⓒ
  inoreab \(d)         ⓓ
  inoreab \(e)         ⓔ
  inoreab \(f)         ⓕ
  inoreab \(g)         ⓖ
  inoreab \(h)         ⓗ
  inoreab \(i)         ⓘ
  inoreab \(j)         ⓙ
  inoreab \(k)         ⓚ
  inoreab \(l)         ⓛ
  inoreab \(m)         ⓜ
  inoreab \(n)         ⓝ
  inoreab \(o)         ⓞ
  inoreab \(p)         ⓟ
  inoreab \(q)         ⓠ
  inoreab \(r)         ⓡ
  inoreab \(s)         ⓢ
  inoreab \(t)         ⓣ
  inoreab \(u)         ⓤ
  inoreab \(v)         ⓥ
  inoreab \(w)         ⓦ
  inoreab \(x)         ⓧ
  inoreab \(y)         ⓨ
  inoreab \(z)         ⓩ
  " }}}
  " }}}
endfunction
command! Unicoder call s:setup_abbreviations()
