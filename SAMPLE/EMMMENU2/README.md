# EMMMENU(SDからEMMへLOAD、EMMからSDへSAVE) for MZ-700_SD

MZ-700_SD、MZ-80K_SD、MZ-1500_SDを使い、EMMボートの512K S-RAMの内容をまるごとSDへSAVE、またSDにSAVEされたS-RAMの内容をまるごとEMMボートへLOADするプログラムです。

MZ-700、MZ-80K、MZ-80C、MZ-1200、MZ-1500で実行可能です。

SDカードに保存されたEMM DUMPファイルはMZTファイルのヘッダが付加され512KB+128Byte=524416Byteになります。

なお、EMM DUMPファイルはWindowsパソコンのエミュレーターで利用可能であることを確認しています。

## 利用可能なエミュレーター

### TAKEDAさんのEmuZ-700、EmuZ-1500

https://takeda-toshiya.my.coocan.jp/

　EMM DUMPファイルから128Byteのヘッダを除去し、EMM.BINにリネームしてエミュレーターと同じフォルダに置けばエミュレーターから利用できるようになります。

　EmuZ-700、EmuZ-1500は、16MのEMM0として対応しているようです。EMM DUMPファイルから128Byteのヘッダを除去した524288Byte、327680Byte(Hu-BASICから認識可能分)のEMM.BINでも問題なく認識しますが、エミュレーターを終了させると16MByteのファイルとして再作成されます。

　16MByteとして作成されたEMM.BINに128Byteのヘッダをつけて拡張子をmztとすればEMM DUMPファイルとしてEMMLOADが可能です。(LOADされるのは先頭512kByte分のみ)

　この時、付加する32Byteのヘッダの内容はどんな内容でも構わないので00hを128Byte等好きにつけてください。

## EMMMENUの使い方
　EMMMENU.mztをSDカードに保存し、実行します。

　起動したらまず対象とするEMMをEMM0～EMM3の中から数字で選択します。

　次にEMMLOAD、EMMSAVE、EXITを数字で選択します。

## EMMLOADの使い方
　SDからEMMへの転送にかかる時間は約150秒です。

　起動すると「FNAME:」と聞いてきますので次のうちから選択して入力します。

### [SHIFT+BREAK]キー
　処理が中断されたものとしてMONITOR入力待ちに戻ります。

### DOSファイル名を入力せずそのまま[CR]キー
　選択したEMMに対応するPIO3034_x.mzt(PIO3034_1.mzt、PIO3034_2.mzt、PIO3034_3.mzt)をDOSファイル名としてSDカードからEMMに転送します。

### DOSファイル名を入力して[CR]キー
　入力されたDOSファイル名のファイルをSDカードからEMMに転送します。拡張子の「mzt」は省略可能です。

### *FDL xxx[CR]キー
　SDカードに保存されている文字列xxxから始まるDOSファイル名を一覧表示します。xxxを省略した場合はすべてのファイルが一覧表示対象となります。

　20件表示したところで指示待ちになるので打ち切るならSHIFT+BREAK又は↑を入力すると打ち切られ、Bキーで前の20件に戻ります。それ以外のキーで次の20件を表示します。

　検索結果の行頭には「FNAME:」を付加して表示してあるのでLOADしたいファイルにカーソルキーを合わせて[CR]キーを押すだけでLOADが可能です。

例)

FNAME:[CR]

FNAME:PIO-3034EMM1[CR]

FNAME:*FDL PIO[CR]

## EMMSAVEの使い方
　選択すると先に選択していたEMMによりPIO3034-x-SAVE.mzt(PIO3034-1-SAVE.mzt、PIO3034-2-SAVE.mzt、PIO3034-3-SAVE.mzt)というファイルがSDカードに作成されます。

　同名のファイルがあると上書きされます。SDに保存されるファイル名はPIO3034-x-SAVE.mzt(PIO3034-1-SAVE.mzt、PIO3034-2-SAVE.mzt、PIO3034-3-SAVE.mzt)に固定されていて指定はできません。

　EMMからSDへの保存にかかる時間は約160秒です。

### 追記
　MZ-2000_SD用のEMMSAVEで時々失敗することがあり、失敗するとMZ-2000_SDからSDカードにアクセス不可能になってしまう事象が発生します。

　こちらのMZ-700用EMMSAVEでは今のところ発生していませんが、もし発生した場合の復旧方法は以下の通りです。なお、SDカードに多くのファイルが登録されていると発生する可能性が高い気がします。

　EMMSAVEを実行するときは必要最小限のファイル(EMMMENU.MZT)だけが登録された専用のSDカードで実行でしてみてください。

　MZ-700_SD、MZ-80K_SD、MZ-1500_SDからアクセス不可能になったSDカードもWindowsからは問題なくアクセスできるのでSDカードから作成に失敗したPIO3034-x-SAVE.mztを削除したのちにすべての内容を一旦Windowsのフォルダに移動させ、SDカードにファイルが一つもない状態にしてから退避したWindowsのフォルダからすべてのファイルを戻すことで復旧できます。

