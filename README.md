# MZ-1500_SD+偽RAMFILE複合ボード

![MZ-1500_SD](https://github.com/yanataka60/MZ-1500_SD-NiseRamFile/blob/main/JPEG/TITLE.JPG)

MZ-1500_SDとしっぽいいんちょさんが作られた「偽RAMFILE for MZ-1500」を合体させたボードです。

MZ-1500_SD: https://github.com/yanataka60/MZ-1500_SD

偽RAMFILE for MZ-1500: https://github.com/shippoiincho/niseramfile

偽RAMFILEのMZ-1R12 SRAM メモリ エミュレーション機能をMZ-1500_SD起動用に使うことで一枚のボードにまとめています。

機能の詳細についてはそれぞれのウェブページを参照してください。

## 回路図
　KiCadフォルダ内のMZ-1500_SD+NRF.pdfを参照してください。

[回路図](https://github.com/yanataka60/MZ-1500_SD-NiseRamFile/blob/main/Kicad/MZ-1500_SD%2BNRF.pdf)

![MZ-1500_SD](https://github.com/yanataka60/MZ-1500_SD-NiseRamFile/blob/main/Kicad/MZ-1500_SD%2BNRF.jpg)

|番号|品名|数量|備考|
| ------------ | ------------ | ------------ | ------------ |
||J2、J3のいずれか|||
|J2|Micro_SD_Card_Kit|1|秋月電子通商 AE-microSD-LLCNV (注1)|
|J3|MicroSD Card Adapter|1|Arduino等に使われる5V電源に対応したもの(注3)|
|J4,J5|ピンソケット2x15Pin|2|RP2350Bマイコンボード用,秋月電子通商 FHU-2x42SGなど|
|J6|VGA用基板ソケット 3列15ピン|1|マルツ DJ-VGA14.5など|
|U1|74LS04|1||
|U2|74LS30|1||
|U3|8255|1||
|U4|Arduino_Pro_Mini_5V|1|Atmega328版を使用 168版は不可。(注2)|
||RP2350Bボード(Raspberry Pi Pico 2)|1|Amazon WA00021 RP2350Bマイコンボードなど|
|C1-C3|積層セラミックコンデンサ 0.1uF|3||
|C4|電解コンデンサ 16v100uF|1||
|R1-R3|カーボン抵抗 330Ω|3||
||ピンヘッダ|2Pin分|Arduino_Pro_MiniにはA4、A5用のピンヘッダが付いていないため別途調達が必要です 秋月電子通商 PH-1x40SGなど|
||ピンソケット(任意)|26Pin分|Arduino_Pro_Miniを取り外し可能としたい場合に調達します 秋月電子通商 FHU-1x42SGなど|

　　　注1)秋月電子通商　AE-microSD-LLCNVのJ1ジャンパはショートしてください。

　　　注2)Arduino Pro MiniはA4、A5ピンも使っています。

　　　注3)MicroSD Card Adapterを使う場合

　　　　　J3に取り付けます。

MicroSD Card Adapterについているピンヘッダを除去してハンダ付けするのが一番確実ですが、J3の穴にMicroSD Card Adapterをぴったりと押しつけ、裏から多めにハンダを流し込むことでハンダ付けをする方法もあります。なお、この方法の時にはしっかりハンダ付けが出来たかテスターで導通を確認しておいた方が安心です。

ハンダ付けに自信のない方はJ2の秋月電子通商　AE-microSD-LLCNVをお使いください。AE-microSD-LLCNVならパワーLED、アクセスLEDが付いています。

![MicroSD Card Adapter1](https://github.com/yanataka60/MZ-1500_SD-NiseRamFile/blob/main/JPEG/MicroSD%20Card%20Adapter.JPG)

## 偽RAMFILE for MZ-1500の修正
　MZ-1500_SDの起動にはMZ-1R12 SRAM メモリを利用しますが、オリジナルの偽RAMFILE for MZ-1500では電源投入時は Checksum Error で止まるようになっていますので電源投入時に起動できるように修正が必要です。

　niseramfile.cの523行あたりに

//    memcpy(mz1r12,romslots,0x8000);

    memset(mz1r12,0xaa,0x8000);

　となっている個所を

    memcpy(mz1r12,romslots,0x8000);

//    memset(mz1r12,0xaa,0x8000);

　とコメントアウトを修正し、再コンパイルします。

　出来上がったniseramfile.uf2をRP2350Bマイコンボードに書き込みます。

　なお、2026.2.5時点のソースを修正、再コンパイルしたniseramfile.uf2をRP2350Bフォルダに置いてあります。

https://github.com/yanataka60/MZ-1500_SD-NiseRamFile/tree/main/RP2350B

## MZ-1500_SD BOOT PROGRAMをMZ-1R12 SRAM メモリ 0番バックアップスロットへ書き込み
　MZ-1500_SDリポジトリEMMフォルダ内の1Z-009B_SD_Launcher.binをMZ-1R12 SRAM メモリ 0番バックアップスロットへ書き込んでください。

https://github.com/yanataka60/MZ-1500_SD/blob/main/EMM/1Z-009B_SD_Launcher.bin

　書き込み方の詳細は偽RAMFILE for MZ-1500を参照してください。

https://github.com/shippoiincho/niseramfile/tree/main?tab=readme-ov-file#mz-1r12-sram-%E3%83%A1%E3%83%A2%E3%83%AA

　なお、書き込みにpicotool.exeを利用する場合には以下のウェブページ右側の「Releases」からダウンロードできます。

https://github.com/raspberrypi/pico-sdk-tools

## Arduinoプログラム
　MZ-1500_SDを参照してください。

https://github.com/yanataka60/MZ-1500_SD/tree/main?tab=readme-ov-file#arduino%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%A0

## 運用の注意点
　偽RAMFILE for MZ-1500のEMMエミュレーションは自動的にはバックアップされません。

　電源ON時に0番EMMスロットの内容が自動的にEMMにLOADされますが、電源OFF時にEMMの内容は消滅しますのでEMMの内容を書き込み・修正等した場合にはEMMの内容をスロットに書き込む動作を行う必要があります。

https://github.com/shippoiincho/niseramfile/tree/main?tab=readme-ov-file#pio-3034-emm

## EMMからの起動
　「EMM0」に起動可能なMZ-700用HuBASICが存在している場合MZ-1500_SDからコマンド「FDE0」を実行することで「EMM0」のMZ-700用HuBASICから起動可能です。

　なお、EMMの00000番地が「01h」でなければEMMからの起動はせずにコマンド待ちに戻りますが、00000番地以降に異常があってもチェックはしていないので最悪暴走します。

　MZ-1500用HuBASIC、MZ-80K用HuBASICではEMMがサポートされていません。EMMが使えるのはMZ-700用HuBASICのみとなりますが、テープ版しかなくそのままではEMMにHuBASICの起動イメージを作成することが出来ません。

　BouKiCHiさんのHuDiskなどを使いMZ-700用HuBASICの起動ディスクイメージを作成したうえでEMMMENUのEMMLOADでEMMに書き込む必要があります。

## SAMPLEプログラム
　SAMPLEフォルダ内にEMMMENU2を置きました。

　使い方については、フォルダ内のREADME.mdを参照してください。

　SDからEMMへLOAD、EMMの内容をSDへSAVE、EMMスロットからEMMへLOAD、EMMの内容をEMMスロットへSAVEが使えます。

## 謝辞
　素晴らしい拡張モジュールを開発し、複合ボードの公開を快く承諾してくださったしっぽいいんちょさん、ありがとうございました。