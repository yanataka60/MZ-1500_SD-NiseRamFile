MONITOR_80K	EQU		0082H
MONITOR_700	EQU		00ADH
PRTBYT		EQU		03C3H
GETL		EQU		0003H
GETKEY		EQU		001BH
MSGPR		EQU		0015H
PRNT		EQU		0012H
LETLN		EQU		0006H
DISPCH		EQU		0DB5H
DPCT		EQU		0DDCH
LBUF		EQU		11A3H
IBUFE		EQU		10F0H
FNAME		EQU		10F1H
FSIZE		EQU		1102H
SADRS		EQU		1104H

EMM		EQU		00H



		ORG	1200H

		LD	A,(0F000H)			;MZ-1500を判別
		CP	38H
		JR	NZ,MZ700
MZ1500:		LD	A,0A0H				;MZ-1500_SDならSDのI/OポートはA0h～A3h
		JR	SDPORT
MZ700:		LD	A,0D8H				;MZ-700_SD、MZ-80K_SDならI/OポートはD8h～DBh
SDPORT:
		LD	(SND4BIT+1),A			;I/Oポート修正
		INC	A
		LD	(RCVBYTE+4),A
		INC	A
		LD	(F1CHK+1),A
		LD	(F2CHK+1),A
		INC	A
		LD	(RCVBYTE+9),A
		LD	(RCVBYTE+16),A
		LD	(SND4BIT+5),A
		LD	(SND4BIT+12),A

		LD	DE,TITLE			;'******** EMMLOAD,EMMSAVE MENU2 ********'表示
		CALL	MSGPR
		CALL	LETLN
MS2:		CALL	LETLN
		LD	DE,SMENU1			;SMENU表示
		CALL	MSGPR
		CALL	LETLN
		LD	DE,SMENU2
		CALL	MSGPR
		CALL	LETLN
		LD	DE,SMENU3
		CALL	MSGPR
		CALL	LETLN
		CALL	LETLN
		LD	DE,SMENU4
		CALL	MSGPR
SKEY:		CALL	GETKEY				;1文字入力待ち
		OR	A
		JR	Z,SKEY
		LD	B,A
DLY:		CALL	GETKEY				;チャタリングキャンセル
		CP	B
		JR	Z,DLY
		LD	A,B
		CP	'1'
		JR	NZ,SK1
		CALL	PRNT
		CALL	LETLN
		JR	LSTART				;EMMLOAD
SK1:		CP	'2'
		JR	NZ,SK2
		CALL	PRNT
		CALL	LETLN
		JP	SSTART				;EMMSAVE
SK2:		CP	'3'
		JR	NZ,SK3
		CALL	PRNT
		CALL	LETLN
		JP	SLSTART				;EMMSLOTLOAD
SK3:		CP	'4'
		JR	NZ,SK4
		CALL	PRNT
		CALL	LETLN
		JP	SSSTART				;EMMSLOTSAVE
SK4:		CP	'5'
		JR	NZ,SKEY
		CALL	PRNT
EXIT:		CALL	LETLN
		LD	DE,ENDMSG			;'RUN AGAIN:[J12A0]'表示
		CALL	MSGPR
		JP	MONITOR

LSTART:
		LD	DE,MSG3				;「FNAME:」を表示する
		CALL	MSGPR
		LD	DE,LBUF				;DOSファイル名を入力
		CALL	GETL
		LD	A,(LBUF)
		CP	1BH				;BREAKキーが押されたらキャンセル
		JP	Z,EXIT
		LD	DE,LBUF+6			;DOSファイル名をCHECK
		LD	A,(DE)
ST1:		CP	0DH				;入力なしならDefaultの「PIO3034_1」～「PIO3034_3」を採用
		JR	Z,ST0
		CP	' '				;SPACEは読み飛ばし
		JR	NZ,ST2
		INC	DE
		JR	ST1
ST2:		CP	'*'				;*が入力されたら「*FDL」処理へ
		JR	Z,ST3
		LD	(ML0+1),DE			;DOSファイル名が入力されていたらそちらを採用
		LD	(ML1+1),DE
		JR	ST0

;**** FDL処理 ****
ST3:
;**** HL、DE、BCレジスタを保存 ****
		PUSH	HL
		PUSH	DE
		PUSH	BC
		INC	DE
		LD	B,03H
;**** FDLコマンド ****
		LD	HL,CMD1				;「*FDL」と入力されているかチェック
		CALL	CMPSTR
		JR	Z,MLHCMD2
		POP	BC
		POP	DE
		POP	HL
;**** DOSファイル名入力へ復帰 ****
		JR	LSTART				;そうでなければ「*FDL」処理を中止

MLHCMD2:
		INC	DE
		INC	DE
		INC	DE
		LD	HL,MSG3				;行頭に'FNAME:'を付けることでカーソルを移動させリターンで実行できるように
		LD	BC,MSG3END-MSG3
;**** FDLコマンド呼び出し ****
		CALL	DIRLIST				;*FDLの後に入力された文字列から始まるファイル名を一覧表示
		AND	A				;00以外ならERROR
		JP	NZ,SERR
		POP	BC
		POP	DE
		POP	HL
;**** DOSファイル名入力へ復帰 ****
		JP	LSTART

;********************************** EMMLOAD処理本体 ************************************
ST0:		CALL	LETLN
ML1:		LD	DE,LNAME				;DOSファイル名表示
		CALL	MSGPR
		LD	DE,MSG0				;' LOAD START!'表示
		CALL	MSGPR

		CALL	EMMRESET

		CALL	MLHED				;DOSファイル名をArduinoに送信してファイルオープン
		JP	C,EXIT				;DOSファイル名のファイルが存在しない等のエラーがあれば中止
		
		LD	HL,8000H			;IFBにファイル長(8000H)をセット
		LD	(FSIZE),HL
		LD	HL,BUFF
		LD	(SADRS),HL			;IFBにメインメモリ格納先頭アドレス(BUFF)をセット
		LD	B,0AH				;SDからのLOADを8000H(32KB)を10回繰り返し
		LD	C,30H				;ブロック名として0～9を便宜的に表示
		
LOP2:		PUSH	BC
		PUSH	HL
		PUSH	DE
		CALL	BPRINT
		LD	DE,MSG2				;' BLOCK LOADING'を表示
		CALL	MSGPR
		POP	DE
		POP	HL

		CALL	MLDAT				;Arduinoから1ブロックを読み込み
		
		LD	HL,BUFF
		LD	DE,8000H
LOP1:		
		LD	A,(HL)
ML3:		OUT	(EMM+3),A			;BUFFから8000H(32KB)を1Byteずつ読み込み、EMMへ書き込み
		INC	HL
		DEC	DE
		LD	A,E
		OR	D
		JR	NZ,LOP1				;32KB分ループ

		POP	BC
		INC	C
		DJNZ	LOP2				;10回ループ
		
		CALL	LETLN
		LD	DE,MSG1				;'EMMx LOAD END'を表示
		CALL	MSGPR
		JP	EXIT				;終了

;**** DIRLIST本体 (HL=行頭に付加する文字列の先頭アドレス BC=行頭に付加する文字列の長さ) ****
;****              戻り値 A=エラーコード ****
DIRLIST:
		LD	A,83H				;DIRLISTコマンド83Hを送信
		CALL	STCD				;コマンドコード送信
		AND	A				;00以外ならERROR
		JP	NZ,DLRET
		
		PUSH	BC
		LD	B,21H
STLT1:		LD	A,(DE)
		CP	0DH
		JR	NZ,STLT2
		LD	A,00H
STLT2:		CALL	SNDBYTE				;ページ指示を送信
		INC	DE
		DEC	B
		JR	NZ,STLT1
		POP	BC
DL1:
		PUSH	HL
		PUSH	BC
		LD	DE,LBUF
		LDIR
		EX	DE,HL
DL2:		CALL	RCVBYTE				;'00H'を受信するまでを一行とする
		OR	A
		JR	Z,DL3
		CP	0FFH				;'0FFH'を受信したら終了
		JR	Z,DL4
		CP	0FEH				;'0FEH'を受信したら一時停止して一文字入力待ち
		JR	Z,DL5
		LD	(HL),A
		INC	HL
		JR	DL2
DL3:		LD	DE,LBUF				;'00H'を受信したら一行分を表示して改行
		CALL	MSGPR
		CALL	LETLN
		POP	BC
		POP	HL
		JR	DL1
DL4:		CALL	RCVBYTE				;状態取得(00H=OK)
		POP	BC
		POP	HL
		JR	DLRET

DL5:		LD	DE,MSG_KEY1			;HIT ANT KEY表示
		CALL	MSGPR
		LD	A,0C2H
		CALL	DISPCH
		LD	DE,MSG_KEY2			;HIT ANT KEY表示
		CALL	MSGPR
		CALL	LETLN
DL6:		CALL	GETKEY				;1文字入力待ち
		OR	A
		JR	Z,DL6
		CP	64H				;SHIFT+BREAKで打ち切り
		JR	Z,DL7
		CP	12H				;カーソル↑で打ち切り
		JR	Z,DL9
		CP	42H				;「B」で前ページ
		JR	Z,DL8
		LD	A,00H				;それ以外で継続
		JR	DL8
DL9:		LD	A,0C2H				;カーソル↑で打ち切ったときにカーソル2行上へ
		CALL	DPCT
		LD	A,0C2H
		CALL	DPCT
DL7:		LD	A,0FFH				;0FFH中断コードを送信
DL8:		CALL	SNDBYTE
		CALL	LETLN
		JR	DL2
		
DLRET:		
		RET
		

;******* アプリケーション内SD-CARD操作処理用ERROR処理 **************
SERR:
		CP	0F0H
		JR	NZ,SERR3
		LD	DE,MSG_F0
		JR	SERRMSG
		
SERR3:		CP	0F1H
		JR	NZ,SERR99
		LD	DE,MSG_F1
		JR	SERRMSG
		
SERR99:		CALL	PRTBYT
		LD	DE,MSG99
		
SERRMSG:
		CALL	MSGPR
		CALL	LETLN
		POP	BC
		POP	DE
		POP	HL
;**** DOSファイル名入力へ復帰 ****
		JP	LSTART

;**** コマンド文字列比較 ****
CMPSTR:
		PUSH	BC
		PUSH	DE
CMP1:		LD	A,(DE)
		CP	(HL)
		JR	NZ,CMP2
		DEC	B
		JR	Z,CMP2
		CP	0Dh
		JR	Z,CMP2
		INC	DE
		INC	HL
		JR	CMP1
CMP2:		POP	DE
		POP	BC
		RET

;**** コマンドリスト ****
; 将来拡張用
CMD1:		DB	'FDL',0DH

;************************ セットされたDOSファイル名でファイルオープンするためのMLHED処理 **************
MLHED:
		DI
		PUSH	DE
		PUSH	BC
		PUSH	HL
ML0:		LD	DE,LNAME

		LD	A,93H				;HEADER LOADコマンド93H
		CALL	MCMD				;コマンドコード送信
		AND	A				;00以外ならERROR
		JP	NZ,MERR

MLH1:
		LD	A,(DE)
		CP	20H				;行頭のスペースをファイルネームまで読み飛ばし
		JR	NZ,MLH2
		INC	DE
		JR	MLH1

MLH2:		LD	B,20H
MLH4:		LD	A,(DE)				;FNAME送信
		CALL	SNDBYTE
		INC	DE
		DEC	B
		JR	NZ,MLH4
		LD	A,0DH
		CALL	SNDBYTE
		
		CALL	RCVBYTE				;状態取得(00H=OK)
		AND	A				;00以外ならERROR
		JP	NZ,MERR

		CALL	RCVBYTE				;状態取得(00H=OK)
		AND	A				;00以外ならERROR
		JP	NZ,MERR

		LD	HL,IBUFE
		LD	B,80H
MLH5:		CALL	RCVBYTE				;読みだされたインフォメーションブロックを受信
		LD	(HL),A
		INC	HL
		DEC	B
		JR	NZ,MLH5

		CALL	RCVBYTE				;状態取得(00H=OK)
		AND	A				;00以外ならERROR
		JP	NZ,MERR

		JP	MRET				;正常RETURN

;******* 代替処理用コマンドコード送信 (IN:A コマンドコード) **********
MCMD:
		CALL	SNDBYTE				;コマンドコード送信
		CALL	RCVBYTE				;状態取得(00H=OK)
		RET

;****** 代替処理用正常RETURN処理 **********
MRET:		POP	HL
		POP	BC
		POP	DE
		XOR	A				;正常終了フラグ
		
		RET

;******* 代替処理用ERROR処理 **************
MERR:
		CP	0F0H
		JR	NZ,MERR3
		LD	DE,MSG_F0
		JR	MERRMSG
		
MERR3:		CP	0F1H
		JR	NZ,MERR99
		LD	DE,MSG_F1
		JR	MERRMSG
		
MERR99:		CALL	PRTBYT
		LD	DE,MSG99
		
MERRMSG:
		CALL	MSGPR
		CALL	LETLN
		POP	HL
		POP	BC
		POP	DE
		LD	A,02H
		SCF

		RET

;**** 1BYTE受信 ****
;受信DATAをAレジスタにセットしてリターン
RCVBYTE:
		CALL	F1CHK				;PORTC BIT7が1になるまでLOOP
		IN	A,(0D9h)			;PORTB -> A
		PUSH 	AF
		LD	A,05H
		OUT	(0DBH),A			;PORTC BIT2 <- 1
		CALL	F2CHK				;PORTC BIT7が0になるまでLOOP
		LD	A,04H
		OUT	(0DBH),A			;PORTC BIT2 <- 0
		POP 	AF
		RET
		
;**** 1BYTE送信 ****
;Aレジスタの内容をPORTA下位4BITに4BITずつ送信
SNDBYTE:
		PUSH	AF
		RRA
		RRA
		RRA
		RRA
		AND	0FH
		CALL	SND4BIT
		POP	AF
		AND	0FH
		CALL	SND4BIT
		RET

;**** 4BIT送信 ****
;Aレジスタ下位4ビットを送信する
SND4BIT:
		OUT	(0D8H),A
		LD	A,05H
		OUT	(0DBH),A			;PORTC BIT2 <- 1
		CALL	F1CHK				;PORTC BIT7が1になるまでLOOP
		LD	A,04H
		OUT	(0DBH),A			;PORTC BIT2 <- 0
		CALL	F2CHK
		RET
		
;**** BUSYをCHECK(1) ****
; 82H BIT7が1になるまでLOP
F1CHK:		IN	A,(0DAH)
		AND	80H				;PORTC BIT7 = 1?
		JR	Z,F1CHK
		RET

;**** BUSYをCHECK(0) ****
; 82H BIT7が0になるまでLOOP
F2CHK:		IN	A,(0DAH)
		AND	80H				;PORTC BIT7 = 0?
		JR	NZ,F2CHK
		RET

;**************************** 04F8H MONITOR リード データ代替処理 ********************
MLDAT:
		DI
		PUSH	DE
		PUSH	BC
		PUSH	HL
		LD	A,94H				;DATA LOADコマンド94H
		CALL	MCMD				;コマンドコード送信
		AND	A				;00以外ならERROR
		JP	NZ,MERR

		CALL	RCVBYTE				;状態取得(00H=OK)
		AND	A				;00以外ならERROR
		JP	NZ,MERR

		CALL	RCVBYTE				;状態取得(00H=OK)
		AND	A				;00以外ならERROR
		JP	NZ,MERR

		LD	DE,FSIZE			;FSIZE送信
		LD	A,(DE)
		CALL	SNDBYTE
		INC	DE
		LD	A,(DE)
		CALL	SNDBYTE
		CALL	DBRCV				;FSIZE分のデータを受信し、SADRSから格納。分割ロードの場合、直前に0436HでOPENされたファイルを対象として256バイトずつSADRSが加算されて04F8HがCALLされる。

		CALL	RCVBYTE				;状態取得(00H=OK)
		AND	A				;00以外ならERROR
		JP	NZ,MERR

		JP	MRET				;正常RETURN

;データ受信
DBRCV:		LD	DE,(FSIZE)
		LD	HL,(SADRS)
DBRLOP:		CALL	RCVBYTE
		LD	(HL),A
		DEC	DE
		LD	A,D
		OR	E
		INC	HL
		JR	NZ,DBRLOP			;DE=0までLOOP
		RET

;**** コマンド送信 (IN:A コマンドコード)****
STCD:		CALL	SNDBYTE				;Aレジスタのコマンドコードを送信
		CALL	RCVBYTE				;状態取得(00H=OK)
		RET




;**************************** EMMSAVE ***************************************************
SSTART:
		CALL	LETLN
		LD	DE,SNAME			;DOSファイル名表示
		CALL	MSGPR
		LD	DE,MSG6				;' SAVE START!'表示
		CALL	MSGPR

		CALL	EMMRESET
		LD	A,01H				;IFBにファイル種別をセット(実は値が何でもOK)
		LD	(IBUFE),A
		LD	HL,SNAME			;IFBにファイル名をセット(実は値が何でもOK)
		LD	DE,FNAME
		LD	BC,10H
		LDIR
		
		LD	HL,8000H			;IFBにファイル長をセット(実は値が何でもOK)
		LD	(FSIZE),HL
		LD	HL,BUFF				;IFBにメインメモリ格納先頭アドレスをセット(実は値が何でもOK)
		LD	(SADRS),HL

		CALL	MSHED				;ArduinoにIFBを送信、DOSファイルオープン
		
		LD	HL,8000H			;IFBにファイル長(8000H)をセット
		LD	(FSIZE),HL
		LD	HL,BUFF
		LD	(SADRS),HL			;IFBにメインメモリ格納先頭アドレス(BUFF)をセット
		LD	B,0AH				;EMMから8000H(32KB)分読み出しを10回繰り返し
		LD	C,30H				;ブロック名として0～Fを便宜的に表示
		
LOP3:		PUSH	BC

		PUSH	HL
		PUSH	DE
		CALL	BPRINT
		LD	DE,MSG5				;' BLOCK SAVEING'を表示
		CALL	MSGPR
		POP	DE
		POP	HL

		LD	HL,BUFF
		LD	DE,8000H
LOP4:
ML4:		
		IN	A,(EMM+3)			;EMMから8000H(32KB)分読み出してBUFFへ書き込み
		LD	(HL),A
		INC	HL
		DEC	DE
		LD	A,E
		OR	D
		JR	NZ,LOP4				;32KB分ループ
		
		CALL	MSDAT				;Arduinoへ1ブロックを送信し、SDへ書き込み

		POP	BC
		INC	C
		DJNZ	LOP3				;16回ループ
		
		CALL	LETLN
		LD	DE,MSG4				;'EMMx SAVE END'を表示
		CALL	MSGPR
		JP	EXIT				;終了

;*********************** 0436H MONITOR ライト インフォメーション代替処理 ************
MSHED:
		DI
		PUSH	DE
		PUSH	BC
		PUSH	HL
		LD	A,91H				;HEADER SAVEコマンド91H
		CALL	MCMD				;コマンドコード送信
		AND	A				;00以外ならERROR
		JP	NZ,MERR

;S-OS SWORD、8080用テキスト・エディタ＆アセンブラはファイルネームの後ろが20h詰めとなるため0dhに修正
		LD	B,11H
		LD	HL,FNAME+10H			;ファイルネーム
		LD	A,0DH				;17文字目には常に0DHをセットする
		LD	(HL),A
MSH0:		LD	A,(HL)
		CP	0DH				;0DHであればひとつ前の文字の検査に移る
		JR	Z,MSH1
		CP	20H				;20Hであれば0DHをセットしてひとつ前の文字の検査に移る
		JR	NZ,MSH2				;0DH、20H以外の文字であれば終了
		LD	A,0DH
		LD	(HL),A
		
MSH1:		DEC	HL
		DEC	B
		JR	NZ,MSH0

MSH2:		CALL	LETLN
		LD	DE,WRMSG			;'WRITING '
		CALL	MSGPR				;メッセージ表示
		LD	DE,FNAME			;ファイルネーム
		CALL	MSGPR				;メッセージ表示

		LD	HL,IBUFE
		LD	B,80H
MSH3:		LD	A,(HL)				;インフォメーション ブロック送信
		CALL	SNDBYTE
		INC	HL
		DEC	B
		JR	NZ,MSH3

		CALL	RCVBYTE				;状態取得(00H=OK)
		AND	A				;00以外ならERROR
		JP	NZ,MERR

		JP	MRET				;正常RETURN

;******************** 0475H MONITOR ライト データ代替処理 **********************
MSDAT:
		DI
		PUSH	DE
		PUSH	BC
		PUSH	HL
		LD	A,92H				;DATA SAVEコマンド92H
		CALL	MCMD				;コマンドコード送信
		AND	A				;00以外ならERROR
		JP	NZ,MERR

		LD	HL,FSIZE			;FSIZE送信
		LD	A,(HL)
		CALL	SNDBYTE
		INC	HL
		LD	A,(HL)
		CALL	SNDBYTE

		CALL	RCVBYTE				;状態取得(00H=OK)
		AND	A				;00以外ならERROR
		JP	NZ,MERR

		LD	DE,(FSIZE)
		LD	HL,(SADRS)
MSD1:		LD	A,(HL)
		CALL	SNDBYTE				;SADRSからFSIZE Byteを送信。分割セーブの場合、直前に0436HでOPENされたファイルを対象として256バイトずつ0475HがCALLされる。
		DEC	DE
		LD	A,D
		OR	E
		INC	HL
		JR	NZ,MSD1
		
		JP	MRET				;正常RETURN

SLSTART:
		CALL	NUMGET
		LD	B,A
		CALL	PRNT
		CALL	LETLN
		LD	DE,SLOK1
		CALL	MSGPR
		LD	A,B
		CALL	PRNT
		LD	DE,SLOK2
		CALL	MSGPR
		CALL	YESNO
		JP	C,EXIT
		LD	A,B
		SUB	30H
		OUT	(0BCH),A
		CALL	LETLN
		LD	DE,SLOK3
		CALL	MSGPR
		CALL	LETLN
		JP	EXIT

SSSTART:
		CALL	NUMGET
		LD	B,A
		CALL	PRNT
		CALL	LETLN
		LD	DE,SSOK1
		CALL	MSGPR
		LD	A,B
		CALL	PRNT
		LD	DE,SSOK2
		CALL	MSGPR
		CALL	YESNO
		JP	C,EXIT
		LD	A,B
		SUB	30H
		OUT	(0BDH),A
		CALL	LETLN
		LD	DE,SSOK3
		CALL	MSGPR
		CALL	LETLN
		JP	EXIT

NUMGET:
		CALL	LETLN
		LD	DE,SLNO				;'SLOT NO(0-9)?'表示
		CALL	MSGPR
SLKEY:		CALL	GETKEY				;1文字入力待ち
		OR	A
		JR	Z,SLKEY
		CP	'0'
		JR	C,SLKEY
		CP	'9'+1
		JR	NC,SLKEY
		RET

YESNO:		CALL	GETKEY
		OR	A
		JR	Z,YESNO
		CP	'N'
		JP	NZ,YN1
		SCF
		RET
YN1:		CP	'Y'
		JR	NZ,YESNO
		XOR	A
		RET

EMMRESET:
		XOR	A				;EMMアドレスリセット
ML2:		OUT	(EMM),A
		OUT	(EMM+1),A
		OUT	(EMM+2),A
		RET

EMMADRS:
		LD	(ML2+1),A
		INC	A
		LD	(ML2+3),A
		INC	A
		LD	(ML2+5),A
		INC	A
		LD	(ML3+1),A
		LD	(ML4+1),A
		RET

BPRINT:
		CALL	LETLN
		LD	A,C				;ブロック名としてA～Fを表示するための処理
		CP	3AH
		JR	C,ALPHA
		ADD	A,07H
ALPHA:		CALL	PRNT
		RET

MONITOR:	LD	HL,014EH
		LD	A,(HL)
		CP	'P'				;014EHが'P'ならMZ-80K
		JP	Z,MONITOR_80K
		CP	'N'				;014EHが'N'ならFN-700
		JP	Z,MONITOR_80K
		LD	HL,06EBH
		LD	A,(HL)
		CP	'M'				;06EBHが'M'ならMZ-700
		JP	Z,MONITOR_700
		JP	0000H				;識別できなかったら0000Hへジャンプ

TITLE:
		DB	16H,'******** EMMLOAD,EMMSAVE MENU2 ********'
		DB	0DH

SMENU1:		DB	'1)SD TO EMM LOAD   2)EMM TO SD SAVE'
		DB	0DH

SMENU2:		DB	'3)SLOT TO EMM LOAD 4)EMM TO SLOT SAVE'
		DB	0DH

SMENU3:		DB	'5)EXIT'
		DB	0DH

SMENU4:		DB	'SELECT JOB?'
		DB	0DH

SLNO:		DB	'SLOT NO(0-9)?'
		DB	0DH

SLOK1:		DB	'SLOT'
		DB	0DH

SLOK2:		DB	' TO EMM LOAD OK?'
		DB	0DH

SLOK3:
		DB	'SLOT TO EMM0 LOAD END'
		DB	0DH

SSOK1:		DB	'EMM TO SLOT'
		DB	0DH

SSOK2:		DB	' SAVE OK?'
		DB	0DH

SSOK3:
		DB	'EMM0 TO SLOT SAVE END'
		DB	0DH

ENDMSG:		DB	'RUN AGAIN:[J1200]'
		DB	0DH

LNAME:
		DB	'PIO3034_1'
		DB	0DH
NAME_END:

SNAME:
		DB	'PIO3034-1-SAVE'
		DB	0DH
SNAME_END:


MSG0:		DB	' LOAD START!'
		DB	0DH

MSG1:
		DB	'EMM0 LOAD END'
		DB	0DH

MSG2:		DB	' BLOCK LOADING'
		DB	0DH
		
MSG3:		DB	'FNAME:'
MSG3END:
		DB	0DH

MSG4:
		DB	'EMM0 SAVE END'
		DB	0DH

MSG5:		DB	' BLOCK SAVEING'
		DB	0DH

MSG6:		DB	' SAVE START!'
		DB	0DH

MSG_F0:
		DB	'SD-CARD INITIALIZE ERROR'
		DB	0DH
		
MSG_F1:
		DB	'NOT FIND FILE'
		DB	0DH
		
MSG99:
		DB	' ERROR'
		DB	0DH
		
MSG_KEY1:
		DB	'NEXT:ANY BACK:B BREAK:'
		DB	0DH
MSG_KEY2:
		DB	' OR SHIFT+BREAK'
		DB	0DH
		
WRMSG:
		DB	'WRITING '
		DB	0DH

BUFF:
		DS	8000H
		END

