# EMMMENU2(SDからEMMへLOAD、EMMの内容をSDへSAVE、EMMスロットからEMMへLOAD、EMMの内容をEMMスロットへSAVE) for MZ-1500_SD+偽RAMFILE複合ボード

MZ-1500_SD+偽RAMFILE複合ボードでEMMボートの内容をまるごとSDへSAVE、またSDにSAVEされたS-RAMの内容をまるごとEMMボートへLOAD、0～9番EMMスロットからEMMへLOAD、EMMの内容を0～9番EMMスロットへSAVEするプログラムです。

SDカードに保存されたEMM DUMPファイルはMZTファイルのヘッダが付加され320KB+128Byte=327808Byteになります。

なお、EMM DUMPファイルはWindowsパソコンのエミュレーターで利用可能であることを確認しています。

## 利用可能なエミュレーター

### TAKEDAさんのEmuZ-700、EmuZ-1500

https://takeda-toshiya.my.coocan.jp/

　EMM DUMPファイルから128Byteのヘッダを除去し、EMM.BINにリネームしてエミュレーターと同じフォルダに置けばエミュレーターから利用できるようになります。

　EmuZ-700、EmuZ-1500は、16MのEMM0として対応しているようです。EMM DUMPファイルから128Byteのヘッダを除去した327808Byteでも問題なく認識しますが、エミュレーターを終了させると16MByteのファイルとして再作成されます。

　16MByteとして作成されたEMM.BINに128Byteのヘッダをつけて拡張子をmztとすればEMM DUMPファイルとしてEMMLOADが可能です。(LOADされるのは先頭320kByte分のみ)

　この時、付加する128Byteのヘッダの内容はどんな内容でも構わないので00hを128Byte等好きにつけてください。

## EMMMENU2の使い方
　EMMMENU2.mztをSDカードに保存し、実行します。

　SD TO EMM LOAD、EMM TO SD SAVE、SLOT TO EMM LOAD、EMM TO SLOT SAVE、EXITを数字で選択します。

## SD TO EMM LOAD
　SDからEMMへの転送にかかる時間は約95秒です。

　起動すると「FNAME:」と聞いてきますので次のうちから選択して入力します。

### [SHIFT+BREAK]キー
　処理が中断されたものとしてMONITOR入力待ちに戻ります。

### DOSファイル名を入力せずそのまま[CR]キー
　選択したEMMに対応するPIO3034_0.mztをDOSファイル名としてSDカードからEMMに転送します。

### DOSファイル名を入力して[CR]キー
　入力されたDOSファイル名のファイルをSDカードからEMMに転送します。拡張子の「mzt」は省略可能です。

### *FDL xxx[CR]キー
　SDカードに保存されている文字列xxxから始まるDOSファイル名を一覧表示します。xxxを省略した場合はすべてのファイルが一覧表示対象となります。

　20件表示したところで指示待ちになるので打ち切るならSHIFT+BREAK又は↑を入力すると打ち切られ、Bキーで前の20件に戻ります。それ以外のキーで次の20件を表示します。

　検索結果の行頭には「FNAME:」を付加して表示してあるのでLOADしたいファイルにカーソルキーを合わせて[CR]キーを押すだけでLOADが可能です。

例)

FNAME:[CR]

FNAME:PIO-3034EMM0[CR]

FNAME:*FDL PIO[CR]

## EMM TO SD SAVE
　選択するとPIO3034-0-SAVE.mztというファイルがSDカードに作成されます。

　同名のファイルがあると上書きされます。SDに保存されるファイル名はPIO3034-0-SAVE.mztに固定されていて指定はできません。

　EMMからSDへの保存にかかる時間は約100秒です。

## SLOT TO EMM LOAD
　LOADするSLOT番号を0～9から選択します。偽RAMFILEは0～31までのSLOTが使えますがEMMMENU2では簡略化しています。

　OK?と聞いてくるので良ければ「Y」、やめるなら「N」を入力します。

　ほぼ一瞬でLOADされます。

## EMM TO SLOT SAVE
　SAVEするSLOT番号を0～9から選択します。偽RAMFILEは0～31までのSLOTが使えますがEMMMENU2では簡略化しています。

　OK?と聞いてくるので良ければ「Y」、やめるなら「N」を入力します。

　MZ-1500本体のRGB出力ではほぼ一瞬で終了しますが、偽RAMFILEのVGA出力は数秒画面が乱れる・止まるなどしたのちに画面が回復します。

　偽RAMFILEのVGA出力のみで運用している場合には画面が乱れてもあわてずにしばらくお待ちください。

### 追記
　MZ-2000_SD用のEMMSAVEで時々失敗することがあり、失敗するとMZ-2000_SDからSDカードにアクセス不可能になってしまう事象が発生します。

　こちらのMZ-1500_SD+偽RAMFILE複合ボード用EMMSAVE2では今のところ発生していませんが、もし発生した場合の復旧方法は以下の通りです。なお、SDカードに多くのファイルが登録されていると発生する可能性が高い気がします。

　EMMSAVE2を実行するときは必要最小限のファイル(EMMMENU2.MZT)だけが登録された専用のSDカードで実行でしてみてください。

　MZ-1500_SD+偽RAMFILE複合ボードからアクセス不可能になったSDカードもWindowsからは問題なくアクセスできるのでSDカードから作成に失敗したPIO3034-0-SAVE.mztを削除したのちにすべての内容を一旦Windowsのフォルダに移動させ、SDカードにファイルが一つもない状態にしてから退避したWindowsのフォルダからすべてのファイルを戻すことで復旧できます。

