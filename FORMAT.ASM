;58 00 00 00 00 B4 00 B4 9E 08 - FORMAT MAIN PROGRAM

                            * = $B400
B400   A2 00                LDX #$00					;INITIALIZE DISK CONTROLLER
B402   8E E8 FF             STX $FFE8					;
B405   D8                   CLD
B406   A4 EB                LDY $EB
B408   20 1D B4             JSR LB41D
B40B   90 03                BCC LB410
B40D   20 0D EA             JSR $EA0D
B410   AD 4F E7   LB410     LDA $E74F
B413   C9 02                CMP #$02
B415   B0 03                BCS LB41A
B417   4C 64 B4             JMP LB464
B41A   4C 3D B5   LB41A     JMP LB53D
B41D   A9 08      LB41D     LDA #$08
B41F   8D BA BC             STA $BCBA
B422   A9 30                LDA #$30
B424   8D BB BC             STA $BCBB
B427   20 25 F9   LB427     JSR $F925
B42A   F0 34                BEQ LB460
B42C   A2 FF                LDX #$FF
B42E   C9 53                CMP #$53
B430   F0 05                BEQ LB437
B432   C9 54                CMP #$54
B434   D0 2C                BNE LB462
B436   E8                   INX
B437   E8         LB437     INX
B438   20 24 F9             JSR $F924
B43B   F0 1A                BEQ LB457
B43D   C9 3D                CMP #$3D
B43F   D0 16                BNE LB457
B441   20 24 F9             JSR $F924
B444   20 CC FB             JSR $FBCC
B447   90 19                BCC LB462
B449   C9 19                CMP #$19
B44B   B0 15                BCS LB462
B44D   0A         LB44D     ASL A
B44E   0A                   ASL A
B44F   F0 11                BEQ LB462
B451   9D BA BC             STA $BCBA,X
B454   4C 27 B4             JMP LB427
B457   E0 00      LB457     CPX #$00
B459   D0 07                BNE LB462
B45B   A9 03                LDA #$03
B45D   4C 4D B4             JMP LB44D
B460   18         LB460     CLC
B461   60                   RTS
B462   38         LB462     SEC
B463   60                   RTS
B464   2C 54 E7   LB464     BIT $E754
B467   10 05                BPL LB46E
B469   A2 00                LDX #$00
B46B   20 2D F4             JSR $F42D
B46E   20 50 FA   LB46E     JSR $FA50
B471   0D 50 55             ORA $5550
B474   54                   ???                ;%01010100 'T'
B475   20 49 4E             JSR $4E49
B478   20 44 49             JSR $4944
B47B   53                   ???                ;%01010011 'S'
B47C   4B                   ???                ;%01001011 'K'
B47D   20 54 4F             JSR $4F54
B480   20 42 45             JSR $4542
B483   20 46 4F             JSR $4F46
B486   52                   ???                ;%01010010 'R'
B487   4D 41 54             EOR $5441
B48A   54                   ???                ;%01010100 'T'
B48B   45 44                EOR $44
B48D   2E 00 20             ROL $2000
B490   0C                   ???                ;%00001100
B491   B9 20 50             LDA $5020,Y
B494   FA                   ???                ;%11111010
B495   2E 00 20             ROL $2000
B498   D1 B8                CMP ($B8),Y
B49A   B0 01                BCS LB49D
B49C   60         LB49C     RTS
B49D   A2 00      LB49D     LDX #$00
B49F   8E DC E6             STX $E6DC
B4A2   20 19 B6             JSR LB619
B4A5   A2 00                LDX #$00
B4A7   20 0B F4             JSR $F40B
B4AA   A2 00                LDX #$00
B4AC   8E DC E6             STX $E6DC
B4AF   A2 0C                LDX #$0C
B4B1   20 6E BA             JSR LBA6E
B4B4   B0 E6                BCS LB49C
B4B6   20 E7 B8             JSR LB8E7
B4B9   90 14                BCC LB4CF
B4BB   A2 00                LDX #$00
B4BD   20 B2 B9             JSR LB9B2
B4C0   A2 00                LDX #$00
B4C2   8E DC E6             STX $E6DC
B4C5   20 6E BA   LB4C5     JSR LBA6E
B4C8   B0 D2                BCS LB49C
B4CA   E8                   INX
B4CB   E0 4D                CPX #$4D
B4CD   90 F6                BCC LB4C5
B4CF   A2 00      LB4CF     LDX #$00
B4D1   20 D5 B9             JSR LB9D5
B4D4   20 74 B9             JSR LB974
B4D7   A2 00                LDX #$00
B4D9   20 C1 B9             JSR LB9C1
B4DC   A0 28                LDY #$28
B4DE   A9 FE                LDA #$FE
B4E0   91 E9                STA ($E9),Y
B4E2   C8                   INY
B4E3   2C 50 E7             BIT $E750
B4E6   30 02                BMI LB4EA
B4E8   91 E9                STA ($E9),Y
B4EA   20 A5 EE   LB4EA     JSR $EEA5
B4ED   A2 00                LDX #$00
B4EF   20 2D F4             JSR $F42D
B4F2   20 50 FA             JSR $FA50
B4F5   0D 54 4F             ORA $4F54
B4F8   20 43 4F             JSR $4F43
B4FB   50 59                BVC LB556
B4FD   20 53 59             JSR $5953
B500   53                   ???                ;%01010011 'S'
B501   54                   ???                ;%01010100 'T'
B502   45 4D                EOR $4D
B504   2C 00 20             BIT $2000
B507   04                   ???                ;%00000100
B508   B7                   ???                ;%10110111
B509   A2 00                LDX #$00
B50B   8E A1 BC             STX $BCA1
B50E   AE A1 BC   LB50E     LDX $BCA1
B511   BD BC BC             LDA $BCBC,X
B514   F0 0C                BEQ LB522
B516   20 58 B8             JSR LB858
B519   8E A1 BC             STX $BCA1
B51C   20 AB B7             JSR LB7AB
B51F   4C 0E B5             JMP LB50E
B522   20 50 FA   LB522     JSR $FA50
B525   0D 4E 45             ORA $454E
B528   57                   ???                ;%01010111 'W'
B529   20 44 49             JSR $4944
B52C   53                   ???                ;%01010011 'S'
B52D   4B                   ???                ;%01001011 'K'
B52E   20 49 53             JSR $5349
B531   20 4E 4F             JSR $4F4E
B534   57                   ???                ;%01010111 'W'
B535   20 4F 50             JSR $504F
B538   45 4E                EOR $4E
B53A   2E 00 60             ROL $6000
B53D   2C 55 E7   LB53D     BIT $E755
B540   10 05                BPL LB547
B542   A2 01                LDX #$01
B544   20 2D F4             JSR $F42D
B547   20 0C B9   LB547     JSR LB90C
B54A   20 50 FA             JSR $FA50
B54D   31 2E                AND ($2E),Y
B54F   00                   BRK
B550   20 D1 B8             JSR LB8D1
B553   B0 01                BCS LB556
B555   60         LB555     RTS
B556   A2 01      LB556     LDX #$01
B558   8E DC E6             STX $E6DC
B55B   20 19 B6             JSR LB619
B55E   A2 01                LDX #$01
B560   20 0B F4             JSR $F40B
B563   A2 0C                LDX #$0C
B565   20 6E BA             JSR LBA6E
B568   B0 EB                BCS LB555
B56A   A2 01                LDX #$01
B56C   20 B2 B9             JSR LB9B2
B56F   20 E7 B8             JSR LB8E7
B572   90 11                BCC LB585
B574   A2 01                LDX #$01
B576   8E DC E6             STX $E6DC
B579   A2 00                LDX #$00
B57B   20 6E BA   LB57B     JSR LBA6E
B57E   B0 D5                BCS LB555
B580   E8                   INX
B581   E0 4D                CPX #$4D
B583   90 F6                BCC LB57B
B585   A2 01      LB585     LDX #$01
B587   20 D5 B9             JSR LB9D5
B58A   20 74 B9             JSR LB974
B58D   A2 01                LDX #$01
B58F   20 C1 B9             JSR LB9C1
B592   20 A5 EE             JSR $EEA5
B595   20 50 FA             JSR $FA50
B598   0D 57 41             ORA $4157
B59B   4E 54 20             LSR $2054
B59E   54                   ???                ;%01010100 'T'
B59F   4F                   ???                ;%01001111 'O'
B5A0   20 43 4F             JSR $4F43
B5A3   50 59                BVC LB5FE
B5A5   20 44 52             JSR $5244
B5A8   49 56                EOR #$56
B5AA   45 20                EOR $20
B5AC   30 20                BMI LB5CE
B5AE   53                   ???                ;%01010011 'S'
B5AF   59 53 54             EOR $5453,Y
B5B2   45 4D                EOR $4D
B5B4   00                   BRK
B5B5   20 55 B9             JSR LB955
B5B8   8D AF BC             STA $BCAF
B5BB   B0 04                BCS LB5C1
B5BD   C9 53                CMP #$53
B5BF   D0 55                BNE LB616
B5C1   A2 01      LB5C1     LDX #$01
B5C3   8E DC E6             STX $E6DC
B5C6   20 78 EE             JSR $EE78
B5C9   A0 28                LDY #$28
B5CB   A9 FE                LDA #$FE
B5CD   91 E9                STA ($E9),Y
B5CF   C8                   INY
B5D0   91 E9                STA ($E9),Y
B5D2   C8                   INY
B5D3   2C 51 E7             BIT $E751
B5D6   30 02                BMI LB5DA
B5D8   91 E9                STA ($E9),Y
B5DA   20 A5 EE   LB5DA     JSR $EEA5
B5DD   AD AF BC             LDA $BCAF
B5E0   C9 53                CMP #$53
B5E2   F0 32                BEQ LB616
B5E4   A9 01                LDA #$01
B5E6   8D A2 BC             STA $BCA2
B5E9   AD A2 BC   LB5E9     LDA $BCA2
B5EC   CD 94 E7             CMP $E794
B5EF   B0 0C                BCS LB5FD
B5F1   20 33 EF             JSR $EF33
B5F4   20 F2 B9             JSR LB9F2
B5F7   EE A2 BC             INC $BCA2
B5FA   4C E9 B5             JMP LB5E9
B5FD   A2 00      LB5FD     LDX #$00
B5FF   8E A1 BC             STX $BCA1
B602   AE A1 BC   LB602     LDX $BCA1
B605   BD BC BC             LDA $BCBC,X
B608   F0 0C                BEQ LB616
B60A   20 58 B8             JSR LB858
B60D   8E A1 BC             STX $BCA1
B610   20 5D B7             JSR LB75D
B613   4C 02 B6             JMP LB602
B616   4C 22 B5   LB616     JMP LB522
B619   D8         LB619     CLD
B61A   A9 00                LDA #$00
B61C   8D E8 FF             STA $FFE8
B61F   8D 9E BC             STA $BC9E
B622   8D 84 02             STA $0284
B625   AE DC E6             LDX $E6DC
B628   8E 40 E7             STX $E740
B62B   20 C4 EC             JSR $ECC4
B62E   A9 02                LDA #$02
B630   8D A0 BC             STA $BCA0
B633   AE DC E6   LB633     LDX $E6DC
B636   AD 9E BC             LDA $BC9E
B639   20 0E ED             JSR $ED0E
B63C   A2 67      LB63C     LDX #$67
B63E   A9 01      LB63E     LDA #$01
B640   9D 00 E5             STA $E500,X
B643   CA                   DEX
B644   A9 FF                LDA #$FF
B646   9D 00 E5             STA $E500,X
B649   CA                   DEX
B64A   AD 84 02             LDA $0284
B64D   9D 00 E5             STA $E500,X
B650   CA                   DEX
B651   AD 9E BC             LDA $BC9E
B654   9D 00 E5             STA $E500,X
B657   CA                   DEX
B658   10 E4                BPL LB63E
B65A   A0 00                LDY #$00
B65C   AD A0 BC             LDA $BCA0
B65F   AA         LB65F     TAX
B660   BD 00 E5   LB660     LDA $E500,X
B663   C9 FF                CMP #$FF
B665   F0 0B                BEQ LB672
B667   E8                   INX
B668   E8                   INX
B669   E8                   INX
B66A   E8                   INX
B66B   8A                   TXA
B66C   C9 68                CMP #$68
B66E   90 F0                BCC LB660
B670   B0 12                BCS LB684
B672   98         LB672     TYA
B673   9D 00 E5             STA $E500,X
B676   C8                   INY
B677   C0 1A                CPY #$1A
B679   F0 0E                BEQ LB689
B67B   8A                   TXA
B67C   18                   CLC
B67D   6D BA BC             ADC $BCBA
B680   C9 68                CMP #$68
B682   90 DB                BCC LB65F
B684   E9 68      LB684     SBC #$68
B686   4C 5F B6             JMP LB65F
B689   A9 94      LB689     LDA #$94
B68B   8E A0 BC             STX $BCA0
B68E   8D EA FF             STA $FFEA
B691   AD 84 02             LDA $0284
B694   F0 08                BEQ LB69E
B696   A9 04                LDA #$04
B698   0D 40 E7             ORA $E740
B69B   8D 40 E7             STA $E740
B69E   A2 17      LB69E     LDX #$17
B6A0   20 45 EC             JSR $EC45
B6A3   AD E8 FF   LB6A3     LDA $FFE8
B6A6   30 FB                BMI LB6A3
B6A8   20 94 EC             JSR $EC94
B6AB   AD 48 E7             LDA $E748
B6AE   29 D8                AND #$D8
B6B0   F0 03                BEQ LB6B5
B6B2   20 D5 E9             JSR $E9D5
B6B5   A2 00      LB6B5     LDX #$00
B6B7   CA         LB6B7     DEX
B6B8   D0 FD                BNE LB6B7
B6BA   AD 40 E7             LDA $E740
B6BD   29 03                AND #$03
B6BF   8D 40 E7             STA $E740
B6C2   AA                   TAX
B6C3   BD 50 E7             LDA $E750,X
B6C6   10 1E                BPL LB6E6
B6C8   AD 84 02             LDA $0284
B6CB   D0 16                BNE LB6E3
B6CD   EE 84 02             INC $0284
B6D0   AD A0 BC             LDA $BCA0
B6D3   18                   CLC
B6D4   6D BA BC             ADC $BCBA
B6D7   C9 68                CMP #$68
B6D9   90 02                BCC LB6DD
B6DB   E9 68                SBC #$68
B6DD   8D A0 BC   LB6DD     STA $BCA0
B6E0   4C 3C B6             JMP LB63C
B6E3   CE 84 02   LB6E3     DEC $0284
B6E6   AD A0 BC   LB6E6     LDA $BCA0
B6E9   18                   CLC
B6EA   6D BB BC             ADC $BCBB
B6ED   C9 68                CMP #$68
B6EF   90 02                BCC LB6F3
B6F1   E9 68                SBC #$68
B6F3   8D A0 BC   LB6F3     STA $BCA0
B6F6   EE 9E BC             INC $BC9E
B6F9   AD 9E BC             LDA $BC9E
B6FC   C9 4D                CMP #$4D
B6FE   F0 03                BEQ LB703
B700   4C 33 B6             JMP LB633
B703   60         LB703     RTS
B704   20 6E B8             JSR LB86E
B707   AD C2 E7             LDA $E7C2
B70A   85 C9                STA $C9
B70C   AD C3 E7             LDA $E7C3
B70F   85 CA                STA $CA
B711   A9 01                LDA #$01
B713   8D A2 BC             STA $BCA2
B716   AD A2 BC   LB716     LDA $BCA2
B719   CD 94 E7             CMP $E794
B71C   B0 15                BCS LB733
B71E   20 33 EF             JSR $EF33
B721   A0 00                LDY #$00
B723   B9 00 FE   LB723     LDA $FE00,Y
B726   91 C9                STA ($C9),Y
B728   C8                   INY
B729   D0 F8                BNE LB723
B72B   E6 CA                INC $CA
B72D   EE A2 BC             INC $BCA2
B730   4C 16 B7             JMP LB716
B733   20 A1 B8   LB733     JSR LB8A1
B736   AD C2 E7             LDA $E7C2
B739   85 C9                STA $C9
B73B   AD C3 E7             LDA $E7C3
B73E   85 CA                STA $CA
B740   A0 00      LB740     LDY #$00
B742   B1 C9      LB742     LDA ($C9),Y
B744   99 00 FE             STA $FE00,Y
B747   C8                   INY
B748   D0 F8                BNE LB742
B74A   20 30 BA             JSR LBA30
B74D   AE 00 FE             LDX $FE00
B750   E8                   INX
B751   8A                   TXA
B752   CD 94 E7             CMP $E794
B755   B0 05                BCS LB75C
B757   E6 CA                INC $CA
B759   4C 40 B7             JMP LB740
B75C   60         LB75C     RTS
B75D   A2 00      LB75D     LDX #$00
B75F   8E DC E6             STX $E6DC
B762   20 92 F5             JSR $F592
B765   A2 01                LDX #$01
B767   8E DC E6             STX $E6DC
B76A   A2 09                LDX #$09
B76C   BD 52 E6   LB76C     LDA $E652,X
B76F   F0 06                BEQ LB777
B771   CA                   DEX
B772   D0 F8                BNE LB76C
B774   20 D1 E9             JSR $E9D1
B777   8E A3 BC   LB777     STX $BCA3
B77A   20 A2 F4             JSR $F4A2
B77D   A2 03                LDX #$03
B77F   BD C2 E7   LB77F     LDA $E7C2,X
B782   95 C3                STA $C3,X
B784   CA                   DEX
B785   10 F8                BPL LB77F
B787   A2 00                LDX #$00
B789   20 FC F0             JSR $F0FC
B78C   B0 13                BCS LB7A1
B78E   AD C2 E7             LDA $E7C2
B791   85 C3                STA $C3
B793   AD C3 E7             LDA $E7C3
B796   85 C4                STA $C4
B798   AE A3 BC             LDX $BCA3
B79B   20 98 F2             JSR $F298
B79E   4C 7F B7             JMP LB77F
B7A1   AE A3 BC   LB7A1     LDX $BCA3
B7A4   20 C5 F5             JSR $F5C5
B7A7   20 C3 F5             JSR $F5C3
B7AA   60                   RTS
B7AB   A9 00      LB7AB     LDA #$00
B7AD   A2 05                LDX #$05
B7AF   9D A4 BC   LB7AF     STA $BCA4,X
B7B2   CA                   DEX
B7B3   10 FA                BPL LB7AF
B7B5   A2 00      LB7B5     LDX #$00
B7B7   8E AA BC             STX $BCAA
B7BA   8E DC E6             STX $E6DC
B7BD   20 6E B8             JSR LB86E
B7C0   20 92 F5             JSR $F592
B7C3   A2 02                LDX #$02
B7C5   BD A4 BC   LB7C5     LDA $BCA4,X
B7C8   95 CF                STA $CF,X
B7CA   CA                   DEX
B7CB   10 F8                BPL LB7C5
B7CD   A2 00                LDX #$00
B7CF   20 A4 F0             JSR $F0A4
B7D2   A2 03                LDX #$03
B7D4   BD C2 E7   LB7D4     LDA $E7C2,X
B7D7   95 C3                STA $C3,X
B7D9   CA                   DEX
B7DA   10 F8                BPL LB7D4
B7DC   A2 00                LDX #$00
B7DE   20 FC F0             JSR $F0FC
B7E1   B0 6E                BCS LB851
B7E3   A5 C5                LDA $C5
B7E5   8D AB BC             STA $BCAB
B7E8   CD C4 E7             CMP $E7C4
B7EB   A5 C6                LDA $C6
B7ED   8D AC BC             STA $BCAC
B7F0   ED C5 E7             SBC $E7C5
B7F3   90 05                BCC LB7FA
B7F5   A9 80                LDA #$80
B7F7   8D AA BC             STA $BCAA
B7FA   A5 E2      LB7FA     LDA $E2
B7FC   38                   SEC
B7FD   E9 40                SBC #$40
B7FF   8D A4 BC             STA $BCA4
B802   A5 E3                LDA $E3
B804   E9 00                SBC #$00
B806   8D A5 BC             STA $BCA5
B809   A5 E4                LDA $E4
B80B   E9 00                SBC #$00
B80D   8D A6 BC             STA $BCA6
B810   20 A1 B8             JSR LB8A1
B813   20 A0 F4             JSR $F4A0
B816   A2 02                LDX #$02
B818   BD A7 BC   LB818     LDA $BCA7,X
B81B   95 CF                STA $CF,X
B81D   CA                   DEX
B81E   10 F8                BPL LB818
B820   A2 00                LDX #$00
B822   20 A4 F0             JSR $F0A4
B825   AD C2 E7             LDA $E7C2
B828   85 C3                STA $C3
B82A   AD C3 E7             LDA $E7C3
B82D   85 C4                STA $C4
B82F   AD AB BC             LDA $BCAB
B832   85 C5                STA $C5
B834   AD AC BC             LDA $BCAC
B837   85 C6                STA $C6
B839   A2 00                LDX #$00
B83B   20 98 F2             JSR $F298
B83E   A2 02                LDX #$02
B840   BD A4 BC   LB840     LDA $BCA4,X
B843   9D A7 BC             STA $BCA7,X
B846   CA                   DEX
B847   10 F7                BPL LB840
B849   2C AA BC             BIT $BCAA
B84C   10 06                BPL LB854
B84E   4C B5 B7             JMP LB7B5
B851   20 A1 B8   LB851     JSR LB8A1
B854   20 C3 F5   LB854     JSR $F5C3
B857   60                   RTS
B858   A0 00      LB858     LDY #$00
B85A   BD BC BC   LB85A     LDA $BCBC,X
B85D   99 DE E6             STA $E6DE,Y
B860   E8                   INX
B861   C8                   INY
B862   C9 2E                CMP #$2E
B864   D0 F4                BNE LB85A
B866   BD BC BC             LDA $BCBC,X
B869   99 DE E6             STA $E6DE,Y
B86C   E8                   INX
B86D   60                   RTS
B86E   2C 54 E7   LB86E     BIT $E754
B871   10 05                BPL LB878
B873   A2 00                LDX #$00
B875   20 2D F4             JSR $F42D
B878   20 50 FA   LB878     JSR $FA50
B87B   0D 50 55             ORA $5550
B87E   54                   ???                ;%01010100 'T'
B87F   20 53 4F             JSR $4F53
B882   55 52                EOR $52,X
B884   43                   ???                ;%01000011 'C'
B885   45 20                EOR $20
B887   44                   ???                ;%01000100 'D'
B888   49 53                EOR #$53
B88A   4B                   ???                ;%01001011 'K'
B88B   20 49 4E             JSR $4E49
B88E   2E 00 20             ROL $2000
B891   D1 B8                CMP ($B8),Y
B893   B0 03                BCS LB898
B895   4C 9E B8             JMP LB89E
B898   A2 00      LB898     LDX #$00
B89A   20 0B F4             JSR $F40B
B89D   60                   RTS
B89E   4C FD EA   LB89E     JMP $EAFD
B8A1   2C 54 E7   LB8A1     BIT $E754
B8A4   10 05                BPL LB8AB
B8A6   A2 00                LDX #$00
B8A8   20 2D F4             JSR $F42D
B8AB   20 50 FA   LB8AB     JSR $FA50
B8AE   0D 50 55             ORA $5550
B8B1   54                   ???                ;%01010100 'T'
B8B2   20 4E 45             JSR $454E
B8B5   57                   ???                ;%01010111 'W'
B8B6   20 44 45             JSR $4544
B8B9   53                   ???                ;%01010011 'S'
B8BA   54                   ???                ;%01010100 'T'
B8BB   2E 20 44             ROL $4420
B8BE   49 53                EOR #$53
B8C0   4B                   ???                ;%01001011 'K'
B8C1   20 49 4E             JSR $4E49
B8C4   2E 00 20             ROL $2000
B8C7   D1 B8                CMP ($B8),Y
B8C9   90 D3                BCC LB89E
B8CB   A2 00                LDX #$00
B8CD   20 0B F4             JSR $F40B
B8D0   60                   RTS
B8D1   20 50 FA   LB8D1     JSR $FA50
B8D4   0D 41 52             ORA $5241
B8D7   45 20                EOR $20
B8D9   59 4F 55             EOR $554F,Y
B8DC   20 52 45             JSR $4552
B8DF   41 44                EOR ($44,X)
B8E1   59 00 20             EOR $2000,Y
B8E4   55 B9                EOR $B9,X
B8E6   60                   RTS
B8E7   20 50 FA   LB8E7     JSR $FA50
B8EA   0D 57 41             ORA $4157
B8ED   4E 54 20             LSR $2054
B8F0   54                   ???                ;%01010100 'T'
B8F1   4F                   ???                ;%01001111 'O'
B8F2   20 54 45             JSR $4554
B8F5   53                   ???                ;%01010011 'S'
B8F6   54                   ???                ;%01010100 'T'
B8F7   20 46 4F             JSR $4F46
B8FA   52                   ???                ;%01010010 'R'
B8FB   20 42 41             JSR $4142
B8FE   44                   ???                ;%01000100 'D'
B8FF   20 53 45             JSR $4553
B902   43                   ???                ;%01000011 'C'
B903   54                   ???                ;%01010100 'T'
B904   4F                   ???                ;%01001111 'O'
B905   52                   ???                ;%01010010 'R'
B906   53                   ???                ;%01010011 'S'
B907   00                   BRK
B908   20 55 B9             JSR LB955
B90B   60                   RTS
B90C   20 50 FA   LB90C     JSR $FA50
B90F   0D 57 41             ORA $4157
B912   52                   ???                ;%01010010 'R'
B913   4E 49 4E             LSR $4E49
B916   47                   ???                ;%01000111 'G'
B917   3A                   ???                ;%00111010 ':'
B918   20 46 4F             JSR $4F46
B91B   52                   ???                ;%01010010 'R'
B91C   4D 41 54             EOR $5441
B91F   20 57 49             JSR $4957
B922   4C 4C 20             JMP $204C
B925   49 52                EOR #$52
B927   52                   ???                ;%01010010 'R'
B928   45 56                EOR $56
B92A   4F                   ???                ;%01001111 'O'
B92B   43                   ???                ;%01000011 'C'
B92C   41 42                EOR ($42,X)
B92E   4C 59 0D             JMP $0D59
B931   45 52                EOR $52
B933   41 53                EOR ($53,X)
B935   45 20                EOR $20
B937   45 56                EOR $56
B939   45 52                EOR $52
B93B   59 54 48             EOR $4854,Y
B93E   49 4E                EOR #$4E
B940   47                   ???                ;%01000111 'G'
B941   20 4F 4E             JSR $4E4F
B944   20 44 49             JSR $4944
B947   53                   ???                ;%01010011 'S'
B948   4B                   ???                ;%01001011 'K'
B949   20 49 4E             JSR $4E49
B94C   20 44 52             JSR $5244
B94F   49 56                EOR #$56
B951   45 20                EOR $20
B953   00                   BRK
B954   60                   RTS
B955   20 50 FA   LB955     JSR $FA50
B958   20 28 59             JSR $5928
B95B   2F                   ???                ;%00101111 '/'
B95C   4E 29 3F             LSR $3F29
B95F   3D 20 00             AND $0020,X
B962   A2 01                LDX #$01
B964   20 F1 F9             JSR $F9F1
B967   20 25 F9             JSR $F925
B96A   F0 06                BEQ LB972
B96C   C9 59                CMP #$59
B96E   F0 02                BEQ LB972
B970   18                   CLC
B971   60                   RTS
B972   38         LB972     SEC
B973   60                   RTS
B974   20 50 FA   LB974     JSR $FA50
B977   0D 44 49             ORA $4944
B97A   53                   ???                ;%01010011 'S'
B97B   4B                   ???                ;%01001011 'K'
B97C   20 56 4F             JSR $4F56
B97F   4C 55 4D             JMP $4D55
B982   45 20                EOR $20
B984   53                   ???                ;%01010011 'S'
B985   45 52                EOR $52
B987   49 41                EOR #$41
B989   4C 20 4E             JMP $4E20
B98C   4F                   ???                ;%01001111 'O'
B98D   2E 20 28             ROL $2820
B990   56 53                LSR $53,X
B992   4E 29 3F             LSR $3F29
B995   3D 20 00             AND $0020,X
B998   A2 01                LDX #$01
B99A   20 F1 F9             JSR $F9F1
B99D   20 25 F9             JSR $F925
B9A0   A2 02                LDX #$02
B9A2   20 E1 FB             JSR $FBE1
B9A5   90 CD                BCC LB974
B9A7   A5 C3                LDA $C3
B9A9   8D AD BC             STA $BCAD
B9AC   A5 C4                LDA $C4
B9AE   8D AE BC             STA $BCAE
B9B1   60                   RTS
B9B2   8E DC E6   LB9B2     STX $E6DC
B9B5   20 78 EE             JSR $EE78
B9B8   A0 00                LDY #$00
B9BA   98                   TYA
B9BB   91 E9      LB9BB     STA ($E9),Y
B9BD   C8                   INY
B9BE   D0 FB                BNE LB9BB
B9C0   60                   RTS
B9C1   8E DC E6   LB9C1     STX $E6DC
B9C4   20 78 EE             JSR $EE78
B9C7   A0 FA                LDY #$FA
B9C9   AD AD BC             LDA $BCAD
B9CC   91 E9                STA ($E9),Y
B9CE   C8                   INY
B9CF   AD AE BC             LDA $BCAE
B9D2   91 E9                STA ($E9),Y
B9D4   60                   RTS
B9D5   8E DC E6   LB9D5     STX $E6DC
B9D8   A9 00                LDA #$00
B9DA   AA                   TAX
B9DB   9D 00 E5   LB9DB     STA $E500,X
B9DE   E8                   INX
B9DF   D0 FA                BNE LB9DB
B9E1   A9 11                LDA #$11
B9E3   8D 75 E7             STA $E775
B9E6   AE DC E6   LB9E6     LDX $E6DC
B9E9   20 AA EE             JSR $EEAA
B9EC   CE 75 E7             DEC $E775
B9EF   D0 F5                BNE LB9E6
B9F1   60                   RTS
B9F2   A2 00      LB9F2     LDX #$00
B9F4   8E 6F E7             STX $E76F
B9F7   AD 00 FE             LDA $FE00
B9FA   A2 0C                LDX #$0C
B9FC   C9 09                CMP #$09
B9FE   90 0C                BCC LBA0C
BA00   E8                   INX
BA01   2C 51 E7             BIT $E751
BA04   10 06                BPL LBA0C
BA06   CA                   DEX
BA07   A9 01                LDA #$01
BA09   8D 6F E7             STA $E76F
BA0C   8A         LBA0C     TXA
BA0D   A2 01                LDX #$01
BA0F   20 0B ED             JSR $ED0B
BA12   A2 F8                LDX #$F8
BA14   86 E7                STX $E7
BA16   A2 01                LDX #$01
BA18   AD 00 FE             LDA $FE00
BA1B   18                   CLC
BA1C   69 11                ADC #$11
BA1E   C9 1A                CMP #$1A
BA20   90 08                BCC LBA2A
BA22   2C 51 E7             BIT $E751
BA25   30 03                BMI LBA2A
BA27   38                   SEC
BA28   E9 1A                SBC #$1A
BA2A   A2 01      LBA2A     LDX #$01
BA2C   20 A6 ED             JSR $EDA6
BA2F   60                   RTS
BA30   A9 00      LBA30     LDA #$00
BA32   8D 6F E7             STA $E76F
BA35   AD 00 FE             LDA $FE00
BA38   A2 0C                LDX #$0C
BA3A   C9 09                CMP #$09
BA3C   90 0C                BCC LBA4A
BA3E   E8                   INX
BA3F   2C 50 E7             BIT $E750
BA42   10 06                BPL LBA4A
BA44   CA                   DEX
BA45   A9 01                LDA #$01
BA47   8D 6F E7             STA $E76F
BA4A   8A         LBA4A     TXA
BA4B   A2 00                LDX #$00
BA4D   20 0B ED             JSR $ED0B
BA50   A2 F8                LDX #$F8
BA52   86 E7                STX $E7
BA54   A2 00                LDX #$00
BA56   AD 00 FE             LDA $FE00
BA59   18                   CLC
BA5A   69 11                ADC #$11
BA5C   C9 1A                CMP #$1A
BA5E   90 08                BCC LBA68
BA60   2C 50 E7             BIT $E750
BA63   30 03                BMI LBA68
BA65   38                   SEC
BA66   E9 1A                SBC #$1A
BA68   A2 00      LBA68     LDX #$00
BA6A   20 A6 ED             JSR $EDA6
BA6D   60                   RTS
BA6E   8E B0 BC   LBA6E     STX $BCB0
BA71   D8                   CLD
BA72   AE DC E6             LDX $E6DC
BA75   BD 50 E7             LDA $E750,X
BA78   8D 72 E7             STA $E772
BA7B   10 04                BPL LBA81
BA7D   A9 34                LDA #$34
BA7F   D0 02                BNE LBA83
BA81   A9 1A      LBA81     LDA #$1A
BA83   8D CA E7   LBA83     STA $E7CA
BA86   A9 FE                LDA #$FE
BA88   8D C8 E7             STA $E7C8
BA8B   A9 BA                LDA #$BA
BA8D   8D C9 E7             STA $E7C9
BA90   AD B4 BC             LDA $BCB4
BA93   8D B6 BC             STA $BCB6
BA96   AD B5 BC             LDA $BCB5
BA99   8D B7 BC             STA $BCB7
BA9C   A9 00                LDA #$00
BA9E   8D B1 BC             STA $BCB1
BAA1   20 4F BC   LBAA1     JSR LBC4F
BAA4   AD B1 BC             LDA $BCB1
BAA7   69 03                ADC #$03
BAA9   8D B1 BC             STA $BCB1
BAAC   38                   SEC
BAAD   ED CA E7             SBC $E7CA
BAB0   F0 08                BEQ LBABA
BAB2   90 ED                BCC LBAA1
BAB4   8D B1 BC             STA $BCB1
BAB7   4C A1 BA             JMP LBAA1
BABA   AD B6 BC   LBABA     LDA $BCB6
BABD   8D B4 BC             STA $BCB4
BAC0   AD B7 BC             LDA $BCB7
BAC3   8D B5 BC             STA $BCB5
BAC6   A9 00                LDA #$00
BAC8   8D B1 BC             STA $BCB1
BACB   20 13 BC   LBACB     JSR LBC13
BACE   90 08                BCC LBAD8
BAD0   20 3A BB             JSR LBB3A
BAD3   90 03                BCC LBAD8
BAD5   38                   SEC
BAD6   B0 18                BCS LBAF0
BAD8   AD B1 BC   LBAD8     LDA $BCB1
BADB   18                   CLC
BADC   69 03                ADC #$03
BADE   8D B1 BC             STA $BCB1
BAE1   38                   SEC
BAE2   ED CA E7             SBC $E7CA
BAE5   F0 08                BEQ LBAEF
BAE7   90 E2                BCC LBACB
BAE9   8D B1 BC             STA $BCB1
BAEC   4C CB BA             JMP LBACB
BAEF   18         LBAEF     CLC
BAF0   AE B0 BC   LBAF0     LDX $BCB0
BAF3   A9 18                LDA #$18
BAF5   8D C8 E7             STA $E7C8
BAF8   A9 EA                LDA #$EA
BAFA   8D C9 E7             STA $E7C9
BAFD   60                   RTS
BAFE   8D B8 BC             STA $BCB8
BB01   A5 ED                LDA $ED
BB03   C9 28                CMP #$28
BB05   F0 14                BEQ LBB1B
BB07   C9 1E                CMP #$1E
BB09   F0 10                BEQ LBB1B
BB0B   A9 18                LDA #$18
BB0D   8D C8 E7             STA $E7C8
BB10   A9 EA                LDA #$EA
BB12   8D C9 E7             STA $E7C9
BB15   AD B8 BC             LDA $BCB8
BB18   4C 18 EA             JMP $EA18
BB1B   8C B9 BC   LBB1B     STY $BCB9
BB1E   A9 00                LDA #$00
BB20   85 ED                STA $ED
BB22   20 3A BB             JSR LBB3A
BB25   08                   PHP
BB26   20 50 FA             JSR $FA50
BB29   20 28 43             JSR $4328			; (C
BB2C   52                   ???                	;R
BB2D   43                   ???                	;C
BB2E   29 00                AND #$00			;)
BB30   AC B9 BC             LDY $BCB9			
BB33   28                   PLP
BB34   B0 01                BCS LBB37
BB36   60                   RTS
BB37   4C FD EA   LBB37     JMP $EAFD
BB3A   20 50 FA   LBB3A     JSR $FA50
BB3D   0D 42 41             ORA $4142
BB40   44                   ???                ;%01000100 'D'
BB41   20 54 52             JSR $5254			;TR
BB44   41 43                EOR ($43,X)			;AC
BB46   4B                   ???                	;K
BB47   20 24 00             JSR $0024			; $ 
BB4A   A0 00                LDY #$00			
BB4C   AD B0 BC             LDA $BCB0
BB4F   20 A2 F8             JSR $F8A2
BB52   20 DB F9             JSR $F9DB
BB55   20 50 FA             JSR $FA50
BB58   20 53 45             JSR $4553			;S E
BB5B   43                   ???                ;%01000011 'C'
BB5C   54                   ???                ;%01010100 'T'
BB5D   4F                   ???                ;%01001111 'O'
BB5E   52                   ???                ;%01010010 'R'
BB5F   20 24 00             JSR $0024
BB62   AD B1 BC             LDA $BCB1
BB65   A0 00                LDY #$00
BB67   20 A2 F8             JSR $F8A2
BB6A   20 DB F9             JSR $F9DB
BB6D   20 A5 BB             JSR LBBA5
BB70   B0 18                BCS LBB8A
BB72   20 78 EE             JSR $EE78
BB75   A9 FF                LDA #$FF
BB77   20 85 EE             JSR $EE85
BB7A   20 50 FA             JSR $FA50
BB7D   20 42 59             JSR $5942
BB80   50 41                BVC LBBC3
BB82   53                   ???                ;%01010011 'S'
BB83   53                   ???                ;%01010011 'S'
BB84   45 44                EOR $44
BB86   2E 00 18             ROL $1800
BB89   60                   RTS
BB8A   20 50 FA   LBB8A     JSR $FA50
BB8D   20 4D 41             JSR $414D
BB90   4B                   ???                ;%01001011 'K'
BB91   45 53                EOR $53
BB93   20 44 49             JSR $4944
BB96   53                   ???                ;%01010011 'S'
BB97   4B                   ???                ;%01001011 'K'
BB98   20 55 4E             JSR $4E55
BB9B   55 53                EOR $53,X
BB9D   41 42                EOR ($42,X)
BB9F   4C 45 2E             JMP $2E45
BBA2   00                   BRK
BBA3   38                   SEC
BBA4   60                   RTS
BBA5   A9 00      LBBA5     LDA #$00
BBA7   8D B2 BC             STA $BCB2
BBAA   8D B3 BC             STA $BCB3
BBAD   AE B0 BC             LDX $BCB0
BBB0   E8                   INX
BBB1   CA         LBBB1     DEX
BBB2   F0 12                BEQ LBBC6
BBB4   AD CA E7             LDA $E7CA
BBB7   18                   CLC
BBB8   6D B2 BC             ADC $BCB2
BBBB   8D B2 BC             STA $BCB2
BBBE   90 F1                BCC LBBB1
BBC0   EE B3 BC             INC $BCB3
BBC3   4C B1 BB   LBBC3     JMP LBBB1
BBC6   AD B2 BC   LBBC6     LDA $BCB2
BBC9   18                   CLC
BBCA   6D B1 BC             ADC $BCB1
BBCD   8D B2 BC             STA $BCB2
BBD0   90 03                BCC LBBD5
BBD2   EE B3 BC             INC $BCB3
BBD5   AD B0 BC   LBBD5     LDA $BCB0
BBD8   C9 0C                CMP #$0C
BBDA   F0 35                BEQ LBC11
BBDC   90 10                BCC LBBEE
BBDE   AD B2 BC             LDA $BCB2
BBE1   E9 12                SBC #$12
BBE3   8D B2 BC             STA $BCB2
BBE6   AD B3 BC             LDA $BCB3
BBE9   E9 00                SBC #$00
BBEB   8D B3 BC             STA $BCB3
BBEE   A2 03      LBBEE     LDX #$03
BBF0   2C 72 E7             BIT $E772
BBF3   10 02                BPL LBBF7
BBF5   A2 04                LDX #$04
BBF7   4E B3 BC   LBBF7     LSR $BCB3
BBFA   6E B2 BC             ROR $BCB2
BBFD   CA                   DEX
BBFE   D0 F7                BNE LBBF7
BC00   EE B2 BC             INC $BCB2
BC03   AC B2 BC             LDY $BCB2
BC06   2C 72 E7             BIT $E772
BC09   30 04                BMI LBC0F
BC0B   C0 29                CPY #$29
BC0D   F0 02                BEQ LBC11
BC0F   18         LBC0F     CLC
BC10   60                   RTS
BC11   38         LBC11     SEC
BC12   60                   RTS
BC13   A9 00      LBC13     LDA #$00
BC15   8D 6F E7             STA $E76F
BC18   AD B1 BC             LDA $BCB1
BC1B   C9 1A                CMP #$1A
BC1D   90 03                BCC LBC22
BC1F   EE 6F E7             INC $E76F
BC22   AE DC E6   LBC22     LDX $E6DC
BC25   AD B0 BC             LDA $BCB0
BC28   20 0B ED             JSR $ED0B
BC2B   A9 94                LDA #$94
BC2D   85 E7                STA $E7
BC2F   AE DC E6             LDX $E6DC
BC32   AD B1 BC             LDA $BCB1
BC35   20 B5 ED             JSR $EDB5
BC38   A2 00                LDX #$00
BC3A   20 80 BC   LBC3A     JSR LBC80
BC3D   DD 00 E5             CMP $E500,X
BC40   D0 08                BNE LBC4A
BC42   E8                   INX
BC43   D0 F5                BNE LBC3A
BC45   18                   CLC
BC46   60                   RTS
BC47   20 80 BC   LBC47     JSR LBC80
BC4A   E8         LBC4A     INX
BC4B   D0 FA                BNE LBC47
BC4D   38                   SEC
BC4E   60                   RTS
BC4F   A2 00      LBC4F     LDX #$00
BC51   20 80 BC   LBC51     JSR LBC80
BC54   9D 00 E5             STA $E500,X
BC57   E8                   INX
BC58   D0 F7                BNE LBC51
BC5A   A9 00                LDA #$00
BC5C   8D 6F E7             STA $E76F
BC5F   AD B1 BC             LDA $BCB1
BC62   C9 1A                CMP #$1A
BC64   90 03                BCC LBC69
BC66   EE 6F E7             INC $E76F
BC69   AE DC E6   LBC69     LDX $E6DC
BC6C   AD B0 BC             LDA $BCB0
BC6F   20 0B ED             JSR $ED0B
BC72   A9 94                LDA #$94
BC74   85 E7                STA $E7
BC76   AE DC E6             LDX $E6DC
BC79   AD B1 BC             LDA $BCB1
BC7C   20 A6 ED             JSR $EDA6
BC7F   60                   RTS
BC80   AD B4 BC   LBC80     LDA $BCB4
BC83   4A                   LSR A
BC84   4D B4 BC             EOR $BCB4
BC87   4A                   LSR A
BC88   4A                   LSR A
BC89   4D B4 BC             EOR $BCB4
BC8C   4A                   LSR A
BC8D   4D B5 BC             EOR $BCB5
BC90   4A                   LSR A
BC91   4A                   LSR A
BC92   4A                   LSR A
BC93   4A                   LSR A
BC94   2E B5 BC             ROL $BCB5
BC97   2E B4 BC             ROL $BCB4
BC9A   AD B4 BC             LDA $BCB4
BC9D   60                   RTS
                            .END

;auto-generated symbols and labels
 LB41D      $B41D
 LB410      $B410
 LB41A      $B41A
 LB464      $B464
 LB53D      $B53D
 LB460      $B460
 LB437      $B437
 LB462      $B462
 LB457      $B457
 LB427      $B427
 LB44D      $B44D
 LB46E      $B46E
 LB49D      $B49D
 LB619      $B619
 LBA6E      $BA6E
 LB49C      $B49C
 LB8E7      $B8E7
 LB4CF      $B4CF
 LB9B2      $B9B2
 LB4C5      $B4C5
 LB9D5      $B9D5
 LB974      $B974
 LB9C1      $B9C1
 LB4EA      $B4EA
 LB556      $B556
 LB522      $B522
 LB858      $B858
 LB7AB      $B7AB
 LB50E      $B50E
 LB547      $B547
 LB90C      $B90C
 LB8D1      $B8D1
 LB555      $B555
 LB585      $B585
 LB57B      $B57B
 LB5FE      $B5FE
 LB5CE      $B5CE
 LB955      $B955
 LB5C1      $B5C1
 LB616      $B616
 LB5DA      $B5DA
 LB5FD      $B5FD
 LB9F2      $B9F2
 LB5E9      $B5E9
 LB75D      $B75D
 LB602      $B602
 LB63E      $B63E
 LB672      $B672
 LB660      $B660
 LB684      $B684
 LB689      $B689
 LB65F      $B65F
 LB69E      $B69E
 LB6A3      $B6A3
 LB6B5      $B6B5
 LB6B7      $B6B7
 LB6E6      $B6E6
 LB6E3      $B6E3
 LB6DD      $B6DD
 LB63C      $B63C
 LB6F3      $B6F3
 LB703      $B703
 LB633      $B633
 LB86E      $B86E
 LB733      $B733
 LB723      $B723
 LB716      $B716
 LB8A1      $B8A1
 LB742      $B742
 LBA30      $BA30
 LB75C      $B75C
 LB740      $B740
 LB777      $B777
 LB76C      $B76C
 LB77F      $B77F
 LB7A1      $B7A1
 LB7AF      $B7AF
 LB7C5      $B7C5
 LB7D4      $B7D4
 LB851      $B851
 LB7FA      $B7FA
 LB818      $B818
 LB840      $B840
 LB854      $B854
 LB7B5      $B7B5
 LB85A      $B85A
 LB878      $B878
 LB898      $B898
 LB89E      $B89E
 LB8AB      $B8AB
 LB972      $B972
 LB9BB      $B9BB
 LB9DB      $B9DB
 LB9E6      $B9E6
 LBA0C      $BA0C
 LBA2A      $BA2A
 LBA4A      $BA4A
 LBA68      $BA68
 LBA81      $BA81
 LBA83      $BA83
 LBC4F      $BC4F
 LBABA      $BABA
 LBAA1      $BAA1
 LBC13      $BC13
 LBAD8      $BAD8
 LBB3A      $BB3A
 LBAF0      $BAF0
 LBAEF      $BAEF
 LBACB      $BACB
 LBB1B      $BB1B
 LBB37      $BB37
 LBBA5      $BBA5
 LBB8A      $BB8A
 LBBC3      $BBC3
 LBBC6      $BBC6
 LBBB1      $BBB1
 LBBD5      $BBD5
 LBC11      $BC11
 LBBEE      $BBEE
 LBBF7      $BBF7
 LBC0F      $BC0F
 LBC22      $BC22
 LBC80      $BC80
 LBC4A      $BC4A
 LBC3A      $BC3A
 LBC47      $BC47
 LBC51      $BC51
 LBC69      $BC69
