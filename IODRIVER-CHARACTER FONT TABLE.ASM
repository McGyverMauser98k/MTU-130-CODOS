; .org BANK1 - END OF VISABLE MEMORY in MTU-130 - 1 FD50 -> 1 FFE0 
; FILE HEADER: 58 00 01 00 0F 03 50 FD A0 02

;        CHARACTER FONT TABLE
;        ENTRIES IN ORDER STARTING AT ASCII BLANK
;        96 ENTRIES
;        EACH ENTRY CONTAINS 7 BYTES
;        7 BYTES ARE CHARACTER MATRIX, TOP ROW FIRST, LEFTMOST DOT
;        IS LEFTMOST IN BYTE
;        LOWER CASE FONT IS SMALL UPPER CASE, 5 BY 5 MATRIX

CHTB:    .BYTE  $00,$00,$00    		; BLANK
         .BYTE  $00,$00,$00,$00
         .BYTE  $20,$20,$20    		; !
         .BYTE  $20,$20,$00,$20
         .BYTE  $50,$50,$50    		; "
         .BYTE  $00,$00,$00,$00
         .BYTE       $50,$50,$F8    ; #
         .BYTE  $50,$F8,$50,$50
         .BYTE       $20,$78,$A0    ; $
         .BYTE  $70,$28,$F0,$20
         .BYTE       $C8,$C8,$10    ; %
         .BYTE  $20,$40,$98,$98
         .BYTE       $40,$A0,$A0    ; &
         .BYTE  $40,$A8,$90,$68
         .BYTE       $30,$30,$30    ; '
         .BYTE  $00,$00,$00,$00
         .BYTE       $20,$40,$40    ; (
         .BYTE  $40,$40,$40,$20
         .BYTE       $20,$10,$10    ; )
         .BYTE  $10,$10,$10,$20
         .BYTE       $20,$A8,$70    ; *
         .BYTE  $20,$70,$A8,$20
         .BYTE       $00,$20,$20    ; +
         .BYTE  $F8,$20,$20,$00
         .BYTE       $00,$00,$00    ; ,
         .BYTE  $30,$30,$10,$20
         .BYTE       $00,$00,$00    ; -
         .BYTE  $F8,$00,$00,$00
         .BYTE       $00,$00,$00    ; .
         .BYTE  $00,$00,$30,$30
         .BYTE       $08,$08,$10    ; /
         .BYTE  $20,$40,$80,$80
         .BYTE       $60,$90,$90    ; 0
         .BYTE  $90,$90,$90,$60
         .BYTE       $20,$60,$20    ; 1
         .BYTE  $20,$20,$20,$70
         .BYTE       $70,$88,$10    ; 2
         .BYTE  $20,$40,$80,$F8
         .BYTE       $70,$88,$08    ; 3
         .BYTE  $30,$08,$88,$70
         .BYTE       $10,$30,$50    ; 4
         .BYTE  $90,$F8,$10,$10
         .BYTE       $F8,$80,$F0    ; 5
         .BYTE  $08,$08,$08,$F0
         .BYTE       $70,$80,$80    ; 6
         .BYTE  $F0,$88,$88,$70
         .BYTE       $F8,$08,$10    ; 7
         .BYTE  $20,$40,$80,$80
         .BYTE       $70,$88,$88    ; 8
         .BYTE  $70,$88,$88,$70
         .BYTE       $70,$88,$88    ; 9
         .BYTE  $78,$08,$08,$70
         .BYTE       $30,$30,$00    ; :
         .BYTE  $00,$00,$30,$30
         .BYTE       $30,$30,$00    ; ;
         .BYTE  $30,$30,$10,$20
         .BYTE       $10,$20,$40    ; LESS THAN
         .BYTE  $80,$40,$20,$10
         .BYTE       $00,$00,$F8    ; =
         .BYTE  $00,$F8,$00,$00
         .BYTE       $40,$20,$10    ; GREATER THAN
         .BYTE  $08,$10,$20,$40
         .BYTE       $70,$88,$08    ; ?
         .BYTE  $10,$20,$00,$20
         .BYTE       $70,$88,$08    ; @
         .BYTE  $68,$A8,$A8,$D0
         .BYTE       $20,$50,$88    ; A
         .BYTE  $88,$F8,$88,$88
         .BYTE       $F0,$48,$48    ; B
         .BYTE  $70,$48,$48,$F0
         .BYTE       $70,$88,$80    ; C
         .BYTE  $80,$80,$88,$70
         .BYTE       $F0,$48,$48    ; D
         .BYTE  $48,$48,$48,$F0
         .BYTE       $F8,$80,$80    ; E
         .BYTE  $F0,$80,$80,$F8
         .BYTE       $F8,$80,$80    ; F
         .BYTE  $F0,$80,$80,$80
         .BYTE       $70,$88,$80    ; G
         .BYTE  $B8,$88,$88,$70
         .BYTE       $88,$88,$88    ; H
         .BYTE  $F8,$88,$88,$88
         .BYTE       $70,$20,$20    ; I
         .BYTE  $20,$20,$20,$70
         .BYTE       $38,$10,$10    ; J
         .BYTE  $10,$10,$90,$60
         .BYTE       $88,$90,$A0    ; K
         .BYTE  $C0,$A0,$90,$88
         .BYTE       $80,$80,$80    ; L
         .BYTE  $80,$80,$80,$F8
         .BYTE       $88,$D8,$A8    ; M
         .BYTE  $A8,$88,$88,$88
         .BYTE       $88,$88,$C8    ; N
         .BYTE  $A8,$98,$88,$88
         .BYTE       $70,$88,$88    ; O
         .BYTE  $88,$88,$88,$70
         .BYTE       $F0,$88,$88    ; P
         .BYTE  $F0,$80,$80,$80
         .BYTE       $70,$88,$88    ; Q
         .BYTE  $88,$A8,$90,$68
         .BYTE       $F0,$88,$88    ; R
         .BYTE  $F0,$A0,$90,$88
         .BYTE       $78,$80,$80    ; S
         .BYTE  $70,$08,$08,$F0
         .BYTE       $F8,$20,$20    ; T
         .BYTE  $20,$20,$20,$20
         .BYTE       $88,$88,$88    ; U
         .BYTE  $88,$88,$88,$70
         .BYTE       $88,$88,$88    ; V
         .BYTE  $50,$50,$20,$20
         .BYTE       $88,$88,$88    ; W
         .BYTE  $A8,$A8,$D8,$88
         .BYTE       $88,$88,$50    ; X
         .BYTE  $20,$50,$88,$88
         .BYTE       $88,$88,$50    ; Y
         .BYTE  $20,$20,$20,$20
         .BYTE       $F8,$08,$10    ; Z
         .BYTE  $20,$40,$80,$F8
         .BYTE       $70,$40,$40    ; LEFT BRACKET
         .BYTE  $40,$40,$40,$70
         .BYTE       $80,$80,$40    ; BACKSLASH
         .BYTE  $20,$10,$08,$08
         .BYTE       $70,$10,$10    ; RIGHT BRACKET
         .BYTE  $10,$10,$10,$70
         .BYTE       $20,$50,$88    ; CARROT
         .BYTE  $00,$00,$00,$00
         .BYTE       $00,$00,$00    ; UNDERLINE
         .BYTE  $00,$00,$00,$F8
         .BYTE       $C0,$60,$30    ; GRAVE ACCENT
         .BYTE  $00,$00,$00,$00
         .BYTE       $00,$00,$20    ; A (LC)
         .BYTE  $50,$88,$F8,$88
         .BYTE       $00,$00,$F0    ; B (LC)
         .BYTE  $48,$70,$48,$F0
         .BYTE       $00,$00,$78    ; C (LC)
         .BYTE  $80,$80,$80,$78
         .BYTE       $00,$00,$F0    ; D (LC)
         .BYTE  $48,$48,$48,$F0
         .BYTE       $00,$00,$F8    ; E (LC)
         .BYTE  $80,$E0,$80,$F8
         .BYTE       $00,$00,$F8    ; F (LC)
         .BYTE  $80,$E0,$80,$80
         .BYTE       $00,$00,$78    ; G (LC)
         .BYTE  $80,$98,$88,$78
         .BYTE       $00,$00,$88    ; H (LC)
         .BYTE  $88,$F8,$88,$88
         .BYTE       $00,$00,$70    ; I (LC)
         .BYTE  $20,$20,$20,$70
         .BYTE       $00,$00,$38    ; J (LC)
         .BYTE  $10,$10,$50,$20
         .BYTE       $00,$00,$90    ; K (LC)
         .BYTE  $A0,$C0,$A0,$90
         .BYTE       $00,$00,$80    ; L (LC)
         .BYTE  $80,$80,$80,$F8
         .BYTE       $00,$00,$88    ; M (LC)
         .BYTE  $D8,$A8,$88,$88
         .BYTE       $00,$00,$88    ; N (LC)
         .BYTE  $C8,$A8,$98,$88
         .BYTE       $00,$00,$70    ; O (LC)
         .BYTE  $88,$88,$88,$70
         .BYTE       $00,$00,$F0    ; P (LC)
         .BYTE  $88,$F0,$80,$80
         .BYTE       $00,$00,$70    ; Q (LC)
         .BYTE  $88,$A8,$90,$68
         .BYTE       $00,$00,$F0    ; R (LC)
         .BYTE  $88,$F0,$A0,$90
         .BYTE       $00,$00,$78    ; S (LC)
         .BYTE  $80,$70,$08,$F0
         .BYTE       $00,$00,$F8    ; T (LC)
         .BYTE  $20,$20,$20,$20
         .BYTE       $00,$00,$88    ; U (LC)
         .BYTE  $88,$88,$88,$70
         .BYTE       $00,$00,$88    ; V (LC)
         .BYTE  $88,$88,$50,$20
         .BYTE       $00,$00,$88    ; W (LC)
         .BYTE  $88,$A8,$D8,$88
         .BYTE       $00,$00,$88    ; X (LC)
         .BYTE  $50,$20,$50,$88
         .BYTE       $00,$00,$88    ; Y (LC)
         .BYTE  $50,$20,$20,$20
         .BYTE       $00,$00,$F8    ; Z (LC)
         .BYTE  $10,$20,$40,$F8
         .BYTE       $10,$20,$20    ; LEFT BRACE
         .BYTE  $60,$20,$20,$10
         .BYTE       $20,$20,$20    ; VERTICAL BAR
         .BYTE  $20,$20,$20,$20
         .BYTE       $40,$20,$20    ; RIGHT BRACE
         .BYTE  $30,$20,$20,$40
         .BYTE       $10,$A8,$40    ; TILDA
         .BYTE  $00,$00,$00,$00
         .BYTE       $A8,$50,$A8    ; RUBOUT
         .BYTE  $50,$A8,$50,$A8