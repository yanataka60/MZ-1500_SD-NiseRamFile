EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "MZ-1500_SD+NiseRamFile"
Date "2022-01-14"
Rev "Rev1.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 1000 4300 0    50   ~ 0
~EXWAIT
Text Label 1000 3100 0    50   ~ 0
~M1
Text Label 1000 3400 0    50   ~ 0
~IORQ
Text Label 1000 3200 0    50   ~ 0
~WR
Text Label 1000 4000 0    50   ~ 0
RESET
Text Label 1900 3500 0    50   ~ 0
A9
Text Label 1900 3300 0    50   ~ 0
A11
Text Label 1900 3700 0    50   ~ 0
A7
Text Label 1900 3200 0    50   ~ 0
A12
Text Label 1900 3000 0    50   ~ 0
A14
Text Label 1900 4300 0    50   ~ 0
A1
Text Label 1900 4100 0    50   ~ 0
A3
Text Label 1900 3900 0    50   ~ 0
A5
Text Label 1900 2600 0    50   ~ 0
D1
Text Label 1000 2500 0    50   ~ 0
D3
Text Label 1000 2700 0    50   ~ 0
D5
Text Label 1000 2900 0    50   ~ 0
D7
Text Label 1900 4500 0    50   ~ 0
GND
Text Label 1000 3500 0    50   ~ 0
~MREQ
Text Label 1900 3400 0    50   ~ 0
A10
Text Label 1900 3800 0    50   ~ 0
A6
Text Label 1900 3600 0    50   ~ 0
A8
Text Label 1900 3100 0    50   ~ 0
A13
Text Label 1900 4400 0    50   ~ 0
A0
Text Label 1900 4200 0    50   ~ 0
A2
Text Label 1900 4000 0    50   ~ 0
A4
Text Label 1900 2700 0    50   ~ 0
D0
Text Label 1900 2500 0    50   ~ 0
D2
Wire Wire Line
	1900 3500 2100 3500
Wire Wire Line
	1000 4000 1400 4000
Wire Wire Line
	1000 3200 1400 3200
Wire Wire Line
	1000 3400 1400 3400
Wire Wire Line
	1000 3100 1400 3100
Wire Wire Line
	1000 4300 1400 4300
Wire Wire Line
	1000 3700 1400 3700
Wire Wire Line
	1900 3200 2100 3200
Wire Wire Line
	1900 3000 2100 3000
Wire Wire Line
	1900 4300 2100 4300
Wire Wire Line
	1900 4100 2100 4100
Wire Wire Line
	1900 3900 2100 3900
Wire Wire Line
	1900 2600 2100 2600
Wire Wire Line
	1000 2500 1400 2500
Wire Wire Line
	1000 2700 1400 2700
Wire Wire Line
	1900 2500 2100 2500
Wire Wire Line
	1000 2900 1400 2900
Wire Wire Line
	1900 2700 2100 2700
Wire Wire Line
	1900 4200 2100 4200
Wire Wire Line
	1900 4000 2100 4000
Wire Wire Line
	1900 3400 2100 3400
Wire Wire Line
	1900 3800 2100 3800
Wire Wire Line
	1900 3600 2100 3600
Wire Wire Line
	1900 3100 2100 3100
Wire Wire Line
	1900 3700 2100 3700
Wire Wire Line
	1900 3300 2100 3300
Wire Wire Line
	1000 3500 1400 3500
Wire Wire Line
	2100 2800 1900 2800
Wire Wire Line
	1400 2400 1000 2400
Text Label 1900 2800 0    50   ~ 0
GND
Text Label 1000 2400 0    50   ~ 0
+5V
Text Label 1900 2400 0    50   ~ 0
+5V
Wire Wire Line
	1000 4200 1400 4200
Wire Wire Line
	1000 3300 1400 3300
Wire Wire Line
	1900 2900 2100 2900
Wire Wire Line
	1000 2600 1400 2600
Wire Wire Line
	1000 2800 1400 2800
Wire Wire Line
	1000 3000 1400 3000
Text Label 1000 4200 0    50   ~ 0
~INT
Text Label 1000 3300 0    50   ~ 0
~RD
Text Label 1900 2900 0    50   ~ 0
A15
Text Label 1000 2600 0    50   ~ 0
D4
Text Label 1000 2800 0    50   ~ 0
D6
Text Label 1000 3000 0    50   ~ 0
CLK
$Comp
L Connector_Generic:Conn_02x25_Odd_Even J1
U 1 1 61ABAF01
P 1600 3600
F 0 "J1" H 1650 2175 50  0000 C CNN
F 1 "MZ-1500 BUS" H 1650 2266 50  0000 C CNN
F 2 "MZ-1500:BUS_50Pin" H 1600 3600 50  0001 C CNN
F 3 "~" H 1600 3600 50  0001 C CNN
	1    1600 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 1250 9000 1250
$Comp
L Interface:8255 U?
U 1 1 6690AC69
P 9700 2550
AR Path="/636550FF/6690AC69" Ref="U?"  Part="1" 
AR Path="/6690AC69" Ref="U3"  Part="1" 
AR Path="/6687DD68/6690AC69" Ref="U?"  Part="1" 
F 0 "U3" H 9300 4050 50  0000 C CNN
F 1 "8255" H 10100 4050 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_LongPads" H 9700 2850 50  0001 C CNN
F 3 "http://aturing.umcs.maine.edu/~meadow/courses/cos335/Intel8255A.pdf" H 9700 2850 50  0001 C CNN
	1    9700 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 1750 9000 1750
Wire Wire Line
	7900 1650 9000 1650
$Comp
L Device:C C?
U 1 1 6690AC71
P 9200 4200
AR Path="/636550FF/6690AC71" Ref="C?"  Part="1" 
AR Path="/6690AC71" Ref="C3"  Part="1" 
AR Path="/6687DD68/6690AC71" Ref="C?"  Part="1" 
F 0 "C3" V 9050 4300 50  0000 C CNN
F 1 "0.1uF" V 9050 4050 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 9238 4050 50  0001 C CNN
F 3 "~" H 9200 4200 50  0001 C CNN
	1    9200 4200
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6690AC77
P 9700 4250
AR Path="/636550FF/6690AC77" Ref="#PWR?"  Part="1" 
AR Path="/6690AC77" Ref="#PWR06"  Part="1" 
AR Path="/6687DD68/6690AC77" Ref="#PWR?"  Part="1" 
F 0 "#PWR06" H 9700 4000 50  0001 C CNN
F 1 "GND" H 9705 4077 50  0000 C CNN
F 2 "" H 9700 4250 50  0001 C CNN
F 3 "" H 9700 4250 50  0001 C CNN
	1    9700 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 4200 9700 4200
Wire Wire Line
	9700 4200 9700 4250
Wire Wire Line
	9700 4150 9700 4200
Connection ~ 9700 4200
Wire Wire Line
	9050 4200 8950 4200
Wire Wire Line
	8950 4200 8950 950 
Wire Wire Line
	8950 950  9700 950 
$Comp
L power:+5V #PWR?
U 1 1 6690AC84
P 9700 950
AR Path="/636550FF/6690AC84" Ref="#PWR?"  Part="1" 
AR Path="/6690AC84" Ref="#PWR05"  Part="1" 
AR Path="/6687DD68/6690AC84" Ref="#PWR?"  Part="1" 
F 0 "#PWR05" H 9700 800 50  0001 C CNN
F 1 "+5V" H 9715 1123 50  0000 C CNN
F 2 "" H 9700 950 50  0001 C CNN
F 3 "" H 9700 950 50  0001 C CNN
	1    9700 950 
	1    0    0    -1  
$EndComp
Connection ~ 9700 950 
Wire Wire Line
	10400 2850 10900 2850
Wire Wire Line
	10400 2750 10900 2750
Wire Wire Line
	10400 2350 10900 2350
Wire Wire Line
	10400 2250 10900 2250
Wire Wire Line
	10400 2150 10900 2150
Wire Wire Line
	10400 3750 12450 3750
Wire Wire Line
	12450 3750 12450 2450
Wire Wire Line
	12450 2450 12100 2450
Wire Wire Line
	10400 3250 10550 3250
Wire Wire Line
	10550 3250 10550 3850
Wire Wire Line
	10550 3850 12550 3850
Wire Wire Line
	12550 3850 12550 2350
Wire Wire Line
	12550 2350 12100 2350
Wire Wire Line
	10400 1250 12550 1250
Wire Wire Line
	12550 1250 12550 2250
Wire Wire Line
	12550 2250 12100 2250
Wire Wire Line
	10400 1350 12450 1350
Wire Wire Line
	12450 1350 12450 2150
Wire Wire Line
	12450 2150 12100 2150
Wire Wire Line
	10400 1450 10700 1450
Wire Wire Line
	10700 1450 10700 3350
Wire Wire Line
	10700 3350 11600 3350
Wire Wire Line
	11600 3350 11600 3250
Wire Wire Line
	10400 1550 10650 1550
Wire Wire Line
	10650 1550 10650 3450
Wire Wire Line
	10650 3450 11700 3450
Wire Wire Line
	11700 3450 11700 3250
$Comp
L power:GND #PWR?
U 1 1 6690ACA6
P 12200 3050
AR Path="/636550FF/6690ACA6" Ref="#PWR?"  Part="1" 
AR Path="/6690ACA6" Ref="#PWR08"  Part="1" 
AR Path="/6687DD68/6690ACA6" Ref="#PWR?"  Part="1" 
F 0 "#PWR08" H 12200 2800 50  0001 C CNN
F 1 "GND" H 12205 2877 50  0000 C CNN
F 2 "" H 12200 3050 50  0001 C CNN
F 3 "" H 12200 3050 50  0001 C CNN
	1    12200 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	12100 1850 12200 1850
Wire Wire Line
	12200 1850 12200 3050
$Comp
L power:+5V #PWR?
U 1 1 6690ACAE
P 12300 1750
AR Path="/636550FF/6690ACAE" Ref="#PWR?"  Part="1" 
AR Path="/6690ACAE" Ref="#PWR09"  Part="1" 
AR Path="/6687DD68/6690ACAE" Ref="#PWR?"  Part="1" 
F 0 "#PWR09" H 12300 1600 50  0001 C CNN
F 1 "+5V" H 12315 1923 50  0000 C CNN
F 2 "" H 12300 1750 50  0001 C CNN
F 3 "" H 12300 1750 50  0001 C CNN
	1    12300 1750
	1    0    0    -1  
$EndComp
NoConn ~ 10400 1650
NoConn ~ 10400 1750
NoConn ~ 10400 1850
NoConn ~ 10400 1950
NoConn ~ 10400 3050
NoConn ~ 10400 3150
NoConn ~ 10400 3350
NoConn ~ 10400 3450
NoConn ~ 10400 3550
NoConn ~ 10400 3650
Wire Wire Line
	12100 2550 12850 2550
Wire Wire Line
	12100 2650 12850 2650
Wire Wire Line
	12100 2750 12850 2750
Wire Wire Line
	12100 2850 12850 2850
NoConn ~ 12850 2250
NoConn ~ 12850 2350
NoConn ~ 12850 2950
$Comp
L power:+5V #PWR?
U 1 1 6690ACC5
P 12700 2000
AR Path="/636550FF/6690ACC5" Ref="#PWR?"  Part="1" 
AR Path="/6690ACC5" Ref="#PWR010"  Part="1" 
AR Path="/6687DD68/6690ACC5" Ref="#PWR?"  Part="1" 
F 0 "#PWR010" H 12700 1850 50  0001 C CNN
F 1 "+5V" H 12715 2173 50  0000 C CNN
F 2 "" H 12700 2000 50  0001 C CNN
F 3 "" H 12700 2000 50  0001 C CNN
	1    12700 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	12700 2000 12700 2150
Wire Wire Line
	12700 2150 12850 2150
$Comp
L power:GND #PWR?
U 1 1 6690ACCD
P 12700 3100
AR Path="/636550FF/6690ACCD" Ref="#PWR?"  Part="1" 
AR Path="/6690ACCD" Ref="#PWR011"  Part="1" 
AR Path="/6687DD68/6690ACCD" Ref="#PWR?"  Part="1" 
F 0 "#PWR011" H 12700 2850 50  0001 C CNN
F 1 "GND" H 12705 2927 50  0000 C CNN
F 2 "" H 12700 3100 50  0001 C CNN
F 3 "" H 12700 3100 50  0001 C CNN
	1    12700 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	12850 2450 12700 2450
Wire Wire Line
	12700 2450 12700 3100
NoConn ~ 12100 1750
NoConn ~ 12100 1950
NoConn ~ 11500 3250
NoConn ~ 11400 3250
NoConn ~ 10900 2050
NoConn ~ 10900 1850
NoConn ~ 10900 1750
Wire Wire Line
	12100 2050 12300 2050
Wire Wire Line
	12300 2050 12300 1750
Wire Wire Line
	10800 1950 10900 1950
Text Label 12650 2550 0    50   ~ 0
SCK
Text Label 12650 2650 0    50   ~ 0
MISO
Text Label 12650 2750 0    50   ~ 0
MOSI
Text Label 12650 2850 0    50   ~ 0
CS
$Comp
L Connector_Generic:Conn_01x06 J?
U 1 1 6690AD5A
P 13750 3700
AR Path="/636550FF/6690AD5A" Ref="J?"  Part="1" 
AR Path="/6690AD5A" Ref="J3"  Part="1" 
AR Path="/6687DD68/6690AD5A" Ref="J?"  Part="1" 
F 0 "J3" H 13830 3692 50  0000 L CNN
F 1 "MicroSD Card Adapter" H 13350 3200 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x06_P2.54mm_Vertical" H 13750 3700 50  0001 C CNN
F 3 "~" H 13750 3700 50  0001 C CNN
	1    13750 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	13550 3500 13350 3500
Wire Wire Line
	13550 3600 13350 3600
Wire Wire Line
	13550 3700 13350 3700
Wire Wire Line
	13550 3800 13350 3800
Wire Wire Line
	13550 3900 13350 3900
Wire Wire Line
	13550 4000 13350 4000
Text Label 13350 3500 0    50   ~ 0
GND
Text Label 13350 3600 0    50   ~ 0
+5V
Text Label 13350 3700 0    50   ~ 0
MISO
Text Label 13350 3800 0    50   ~ 0
MOSI
Text Label 13350 3900 0    50   ~ 0
SCK
Text Label 13350 4000 0    50   ~ 0
CS
$Comp
L 74xx:74LS30 U?
U 1 1 6690AD72
P 6950 1550
AR Path="/636550FF/6690AD72" Ref="U?"  Part="1" 
AR Path="/6690AD72" Ref="U2"  Part="1" 
AR Path="/6687DD68/6690AD72" Ref="U?"  Part="1" 
F 0 "U2" H 6950 2075 50  0000 C CNN
F 1 "74LS30" H 6950 1984 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6950 1550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS30" H 6950 1550 50  0001 C CNN
	1    6950 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 4150 5250 4150
Text Label 5000 4150 0    50   ~ 0
~IORQ
$Comp
L 74xx:74LS04 U?
U 2 1 6690ADD8
P 5550 2450
AR Path="/636550FF/6690ADD8" Ref="U?"  Part="2" 
AR Path="/6690ADD8" Ref="U1"  Part="2" 
AR Path="/6687DD68/6690ADD8" Ref="U?"  Part="2" 
F 0 "U1" H 5550 2767 50  0000 C CNN
F 1 "74LS04" H 5550 2676 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5550 2450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 5550 2450 50  0001 C CNN
	2    5550 2450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 3 1 6690ADDE
P 5550 3000
AR Path="/636550FF/6690ADDE" Ref="U?"  Part="3" 
AR Path="/6690ADDE" Ref="U1"  Part="3" 
AR Path="/6687DD68/6690ADDE" Ref="U?"  Part="3" 
F 0 "U1" H 5550 3317 50  0000 C CNN
F 1 "74LS04" H 5550 3226 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5550 3000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 5550 3000 50  0001 C CNN
	3    5550 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10800 4950 10800 1950
Wire Wire Line
	6200 2000 6200 1450
Wire Wire Line
	6200 1450 6650 1450
Wire Wire Line
	6650 1550 6250 1550
Wire Wire Line
	6650 1650 6300 1650
Wire Wire Line
	6650 1750 6350 1750
Wire Wire Line
	6350 1750 6350 3550
Wire Wire Line
	6650 1850 6400 1850
Wire Wire Line
	5000 1650 5250 1650
Wire Wire Line
	5000 2450 5250 2450
Wire Wire Line
	5000 3000 5250 3000
Text Label 5000 1250 0    50   ~ 0
A7
Text Label 5000 1650 0    50   ~ 0
A6
Text Label 5000 2000 0    50   ~ 0
A5
Text Label 5000 2450 0    50   ~ 0
A4
Text Label 5000 3000 0    50   ~ 0
A3
Wire Wire Line
	10400 2650 10900 2650
Wire Wire Line
	10400 2550 10900 2550
Wire Wire Line
	10400 2450 10900 2450
Text Label 7950 3150 0    50   ~ 0
D7
Text Label 7950 3050 0    50   ~ 0
D6
Text Label 7950 2950 0    50   ~ 0
D5
Text Label 7950 2850 0    50   ~ 0
D4
Text Label 7950 2750 0    50   ~ 0
D3
Wire Wire Line
	7900 2750 9000 2750
Wire Wire Line
	7900 2850 9000 2850
Wire Wire Line
	7900 2950 9000 2950
Wire Wire Line
	7900 3050 9000 3050
Wire Wire Line
	7900 3150 9000 3150
Text Label 7950 2650 0    50   ~ 0
D2
Text Label 7950 2550 0    50   ~ 0
D1
Text Label 7950 2450 0    50   ~ 0
D0
Wire Wire Line
	7900 2650 9000 2650
Wire Wire Line
	7900 2550 9000 2550
Wire Wire Line
	7900 2450 9000 2450
Text Label 7950 2050 0    50   ~ 0
A0
Text Label 7950 2150 0    50   ~ 0
A1
Text Label 7950 1750 0    50   ~ 0
~WR
Text Label 7950 1650 0    50   ~ 0
~RD
Wire Wire Line
	7900 2050 9000 2050
Wire Wire Line
	7900 2150 9000 2150
Wire Wire Line
	7250 1550 9000 1550
$Comp
L 74xx:74LS04 U1
U 7 1 6690AE28
P 3350 7450
F 0 "U1" H 3580 7496 50  0000 L CNN
F 1 "74LS04" H 3580 7405 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3350 7450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 3350 7450 50  0001 C CNN
	7    3350 7450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS30 U2
U 2 1 6690AE3A
P 4600 7450
F 0 "U2" H 4830 7496 50  0000 L CNN
F 1 "74LS30" H 4830 7405 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4600 7450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS30" H 4600 7450 50  0001 C CNN
	2    4600 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 6950 3350 6850
Wire Wire Line
	3350 6850 4050 6850
Wire Wire Line
	4600 6850 4600 6950
Wire Wire Line
	3350 7950 3350 8050
Wire Wire Line
	3350 8050 4050 8050
Wire Wire Line
	4600 8050 4600 7950
$Comp
L power:GND #PWR?
U 1 1 6690AE5D
P 3350 8050
AR Path="/6274F952/6690AE5D" Ref="#PWR?"  Part="1" 
AR Path="/6690AE5D" Ref="#PWR02"  Part="1" 
AR Path="/636550FF/6690AE5D" Ref="#PWR?"  Part="1" 
AR Path="/6687DD68/6690AE5D" Ref="#PWR?"  Part="1" 
F 0 "#PWR02" H 3350 7800 50  0001 C CNN
F 1 "GND" H 3355 7877 50  0000 C CNN
F 2 "" H 3350 8050 50  0001 C CNN
F 3 "" H 3350 8050 50  0001 C CNN
	1    3350 8050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6690AE63
P 3350 6850
AR Path="/6274F952/6690AE63" Ref="#PWR?"  Part="1" 
AR Path="/6690AE63" Ref="#PWR01"  Part="1" 
AR Path="/636550FF/6690AE63" Ref="#PWR?"  Part="1" 
AR Path="/6687DD68/6690AE63" Ref="#PWR?"  Part="1" 
F 0 "#PWR01" H 3350 6700 50  0001 C CNN
F 1 "+5V" H 3365 7023 50  0000 C CNN
F 2 "" H 3350 6850 50  0001 C CNN
F 3 "" H 3350 6850 50  0001 C CNN
	1    3350 6850
	1    0    0    -1  
$EndComp
Connection ~ 3350 6850
$Comp
L Device:C C?
U 1 1 6690AE6A
P 2800 7350
AR Path="/6274F952/6690AE6A" Ref="C?"  Part="1" 
AR Path="/6690AE6A" Ref="C1"  Part="1" 
AR Path="/636550FF/6690AE6A" Ref="C?"  Part="1" 
AR Path="/6687DD68/6690AE6A" Ref="C?"  Part="1" 
F 0 "C1" H 2915 7396 50  0000 L CNN
F 1 "0.1uF" H 2915 7305 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 2838 7200 50  0001 C CNN
F 3 "~" H 2800 7350 50  0001 C CNN
	1    2800 7350
	1    0    0    -1  
$EndComp
Connection ~ 3350 8050
$Comp
L Device:C C?
U 1 1 6690AE7D
P 4050 7300
AR Path="/6274F952/6690AE7D" Ref="C?"  Part="1" 
AR Path="/6690AE7D" Ref="C2"  Part="1" 
AR Path="/636550FF/6690AE7D" Ref="C?"  Part="1" 
AR Path="/6687DD68/6690AE7D" Ref="C?"  Part="1" 
F 0 "C2" H 4165 7346 50  0000 L CNN
F 1 "0.1uF" H 4165 7255 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 4088 7150 50  0001 C CNN
F 3 "~" H 4050 7300 50  0001 C CNN
	1    4050 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 7200 2800 6850
Wire Wire Line
	2800 6850 3350 6850
Wire Wire Line
	2800 8050 3350 8050
Wire Wire Line
	2800 7500 2800 8050
Wire Wire Line
	4050 7450 4050 8050
Wire Wire Line
	4050 8050 4600 8050
Wire Wire Line
	4050 7150 4050 6850
Wire Wire Line
	4050 6850 4600 6850
Wire Wire Line
	5250 3550 5000 3550
Text Label 5000 3550 0    50   ~ 0
A2
Wire Wire Line
	5000 1250 6650 1250
Wire Wire Line
	5000 2000 6200 2000
Wire Wire Line
	5850 1650 5950 1650
Wire Wire Line
	5950 1650 5950 1350
Wire Wire Line
	5950 1350 6650 1350
Wire Wire Line
	6250 1550 6250 2450
Wire Wire Line
	6250 2450 5850 2450
Wire Wire Line
	6300 1650 6300 3000
Wire Wire Line
	6300 3000 5850 3000
$Comp
L power:+5V #PWR?
U 1 1 6690AED7
P 6800 2250
AR Path="/636550FF/6690AED7" Ref="#PWR?"  Part="1" 
AR Path="/6690AED7" Ref="#PWR04"  Part="1" 
AR Path="/6687DD68/6690AED7" Ref="#PWR?"  Part="1" 
F 0 "#PWR04" H 6800 2100 50  0001 C CNN
F 1 "+5V" H 6815 2423 50  0000 C CNN
F 2 "" H 6800 2250 50  0001 C CNN
F 3 "" H 6800 2250 50  0001 C CNN
	1    6800 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 1950 6500 2350
Wire Wire Line
	6500 2350 6800 2350
Wire Wire Line
	6800 2350 6800 2250
Wire Wire Line
	6500 1950 6650 1950
Wire Wire Line
	1900 4400 2100 4400
Text Label 1000 3600 0    50   ~ 0
GND
Wire Wire Line
	1000 3600 1400 3600
Text Label 1000 3700 0    50   ~ 0
~HALT
Wire Wire Line
	1000 3800 1400 3800
Text Label 1000 3800 0    50   ~ 0
IE1
Wire Wire Line
	1000 3900 1400 3900
Text Label 1000 3900 0    50   ~ 0
IE0
Text Label 1000 4100 0    50   ~ 0
~EXRESET
Wire Wire Line
	1000 4100 1400 4100
Text Label 1000 4400 0    50   ~ 0
~NMI
Wire Wire Line
	1000 4400 1400 4400
Text Label 1000 4500 0    50   ~ 0
GND
Wire Wire Line
	1000 4500 1400 4500
Wire Wire Line
	10050 4950 10800 4950
Wire Wire Line
	8800 4950 9450 4950
Connection ~ 8800 4300
Wire Wire Line
	8800 4300 8800 4950
Wire Wire Line
	8800 4300 8800 1250
Text Label 7950 4300 0    50   ~ 0
RESET
Wire Wire Line
	7900 4300 8800 4300
NoConn ~ 1400 4600
NoConn ~ 1400 4700
NoConn ~ 1400 4800
NoConn ~ 1900 4600
NoConn ~ 1900 4700
NoConn ~ 1900 4800
NoConn ~ 1000 3700
NoConn ~ 1000 3800
NoConn ~ 1000 3900
NoConn ~ 1000 4100
NoConn ~ 1000 4200
NoConn ~ 1000 4400
NoConn ~ 1000 3000
NoConn ~ 1000 3100
Wire Wire Line
	2750 2400 2750 3800
Wire Wire Line
	1900 2400 2750 2400
Wire Wire Line
	2750 4500 2750 4100
Wire Wire Line
	1900 4500 2750 4500
$Comp
L power:PWR_FLAG #FLG01
U 1 1 668DA65A
P 2750 2400
F 0 "#FLG01" H 2750 2475 50  0001 C CNN
F 1 "PWR_FLAG" H 2750 2573 50  0000 C CNN
F 2 "" H 2750 2400 50  0001 C CNN
F 3 "~" H 2750 2400 50  0001 C CNN
	1    2750 2400
	1    0    0    -1  
$EndComp
Connection ~ 2750 2400
$Comp
L power:PWR_FLAG #FLG02
U 1 1 668DAEB5
P 3050 4500
F 0 "#FLG02" H 3050 4575 50  0001 C CNN
F 1 "PWR_FLAG" H 3050 4673 50  0000 C CNN
F 2 "" H 3050 4500 50  0001 C CNN
F 3 "~" H 3050 4500 50  0001 C CNN
	1    3050 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 4500 3050 4500
Connection ~ 2750 4500
$Comp
L Arduino:Arduino_Pro_Mini U4
U 1 1 6690B269
P 11500 2350
F 0 "U4" H 11500 3239 60  0000 C CNN
F 1 "Arduino_Pro_Mini" H 11500 3133 60  0000 C CNN
F 2 "MZ-1500:Arduino_Pro_Mini" H 12300 1600 60  0001 C CNN
F 3 "https://www.sparkfun.com/products/11113" H 11700 1150 60  0001 C CNN
	1    11500 2350
	1    0    0    -1  
$EndComp
$Comp
L Memory_RAM2:Micro_SD_Card_Kit J2
U 1 1 66911760
P 13750 2450
F 0 "J2" H 14580 2446 50  0000 L CNN
F 1 "Micro_SD_Card_Kit" H 14580 2355 50  0000 L CNN
F 2 "MZ-1500:AE-microSD-LLCNV" H 14900 2750 50  0001 C CNN
F 3 "http://katalog.we-online.de/em/datasheet/693072010801.pdf" H 13750 2450 50  0001 C CNN
	1    13750 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C4
U 1 1 69A696DB
P 2750 3950
F 0 "C4" H 2868 3996 50  0000 L CNN
F 1 "100uF" H 2868 3905 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 2788 3800 50  0001 C CNN
F 3 "~" H 2750 3950 50  0001 C CNN
	1    2750 3950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U1
U 1 1 67E83B7A
P 5550 1650
F 0 "U1" H 5550 1967 50  0000 C CNN
F 1 "74LS04" H 5550 1876 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5550 1650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 5550 1650 50  0001 C CNN
	1    5550 1650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U1
U 6 1 67E84BBD
P 9750 4950
F 0 "U1" H 9750 5267 50  0000 C CNN
F 1 "74LS04" H 9750 5176 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 9750 4950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 9750 4950 50  0001 C CNN
	6    9750 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 3550 6350 3550
Wire Wire Line
	6400 1850 6400 4150
Wire Wire Line
	5850 4150 6400 4150
$Comp
L Connector_Generic:Conn_02x15_Top_Bottom J?
U 1 1 69A469B4
P 7350 7100
AR Path="/69A38FBD/69A469B4" Ref="J?"  Part="1" 
AR Path="/69A469B4" Ref="J4"  Part="1" 
F 0 "J4" H 7400 8017 50  0000 C CNN
F 1 "RP2350B Left" H 7400 7926 50  0000 C CNN
F 2 "MZ-1500:PinHeader_2x15_P2.54mm_Vertical" H 7350 7100 50  0001 C CNN
F 3 "~" H 7350 7100 50  0001 C CNN
	1    7350 7100
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x15_Top_Bottom J?
U 1 1 69A469BA
P 10250 7150
AR Path="/69A38FBD/69A469BA" Ref="J?"  Part="1" 
AR Path="/69A469BA" Ref="J5"  Part="1" 
F 0 "J5" H 10300 8067 50  0000 C CNN
F 1 "RP2350B Right" H 10300 7976 50  0000 C CNN
F 2 "MZ-1500:PinHeader_2x15_P2.54mm_Vertical" H 10250 7150 50  0001 C CNN
F 3 "~" H 10250 7150 50  0001 C CNN
	1    10250 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 69A469C0
P 12150 6750
AR Path="/69A38FBD/69A469C0" Ref="R?"  Part="1" 
AR Path="/69A469C0" Ref="R1"  Part="1" 
F 0 "R1" V 11943 6750 50  0000 C CNN
F 1 "330" V 12034 6750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 12080 6750 50  0001 C CNN
F 3 "~" H 12150 6750 50  0001 C CNN
	1    12150 6750
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 69A469C6
P 12150 7150
AR Path="/69A38FBD/69A469C6" Ref="R?"  Part="1" 
AR Path="/69A469C6" Ref="R3"  Part="1" 
F 0 "R3" V 11943 7150 50  0000 C CNN
F 1 "330" V 12034 7150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 12080 7150 50  0001 C CNN
F 3 "~" H 12150 7150 50  0001 C CNN
	1    12150 7150
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 69A469CC
P 12150 7550
AR Path="/69A38FBD/69A469CC" Ref="R?"  Part="1" 
AR Path="/69A469CC" Ref="R2"  Part="1" 
F 0 "R2" V 11943 7550 50  0000 C CNN
F 1 "330" V 12034 7550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 12080 7550 50  0001 C CNN
F 3 "~" H 12150 7550 50  0001 C CNN
	1    12150 7550
	0    1    1    0   
$EndComp
$Comp
L Connector:DB15_Female_HighDensity J?
U 1 1 69A469D2
P 13250 7150
AR Path="/69A38FBD/69A469D2" Ref="J?"  Part="1" 
AR Path="/69A469D2" Ref="J6"  Part="1" 
F 0 "J6" H 13250 8017 50  0000 C CNN
F 1 "VGA" H 13250 7926 50  0000 C CNN
F 2 "Connector_Dsub:DSUB-15-HD_Female_Horizontal_P2.29x1.98mm_EdgePinOffset3.03mm_Housed_MountingHolesOffset4.94mm" H 12300 7550 50  0001 C CNN
F 3 " ~" H 12300 7550 50  0001 C CNN
	1    13250 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 6400 6750 6400
Text Label 6750 6400 0    50   ~ 0
+5V
Text Label 6750 6800 0    50   ~ 0
D3
Text Label 6750 6900 0    50   ~ 0
D5
Text Label 6750 7000 0    50   ~ 0
D7
Wire Wire Line
	6750 6800 7150 6800
Wire Wire Line
	6750 6900 7150 6900
Wire Wire Line
	6750 7000 7150 7000
Wire Wire Line
	8050 6800 7650 6800
Wire Wire Line
	8050 6900 7650 6900
Text Label 8050 6800 2    50   ~ 0
D4
Text Label 8050 6900 2    50   ~ 0
D6
Text Label 6750 6700 0    50   ~ 0
D1
Text Label 8050 6600 2    50   ~ 0
D0
Text Label 8050 6700 2    50   ~ 0
D2
Wire Wire Line
	7650 6700 8050 6700
Wire Wire Line
	7650 6600 8050 6600
Wire Wire Line
	6750 6700 7150 6700
Text Label 6750 7500 0    50   ~ 0
A9
Text Label 6750 7600 0    50   ~ 0
A11
Text Label 6750 7400 0    50   ~ 0
A7
Text Label 8050 7600 2    50   ~ 0
A12
Text Label 8050 7700 2    50   ~ 0
A14
Text Label 6750 7100 0    50   ~ 0
A1
Text Label 6750 7200 0    50   ~ 0
A3
Text Label 6750 7300 0    50   ~ 0
A5
Text Label 8050 7500 2    50   ~ 0
A10
Text Label 8050 7300 2    50   ~ 0
A6
Text Label 8050 7400 2    50   ~ 0
A8
Text Label 6750 7700 0    50   ~ 0
A13
Text Label 8050 7000 2    50   ~ 0
A0
Text Label 8050 7100 2    50   ~ 0
A2
Text Label 8050 7200 2    50   ~ 0
A4
Text Label 6750 7800 0    50   ~ 0
A15
Wire Wire Line
	7650 7000 8050 7000
Wire Wire Line
	7650 7100 8050 7100
Wire Wire Line
	7650 7200 8050 7200
Wire Wire Line
	7650 7300 8050 7300
Wire Wire Line
	7650 7400 8050 7400
Wire Wire Line
	7650 7500 8050 7500
Wire Wire Line
	7650 7600 8050 7600
Wire Wire Line
	7650 7700 8050 7700
Wire Wire Line
	6750 7100 7150 7100
Wire Wire Line
	6750 7200 7150 7200
Wire Wire Line
	6750 7300 7150 7300
Wire Wire Line
	6750 7400 7150 7400
Wire Wire Line
	6750 7500 7150 7500
Wire Wire Line
	6750 7600 7150 7600
Wire Wire Line
	6750 7700 7150 7700
Wire Wire Line
	6750 7800 7150 7800
NoConn ~ 7650 7800
NoConn ~ 7150 6500
NoConn ~ 7150 6600
NoConn ~ 7650 6400
NoConn ~ 7650 6500
NoConn ~ 10050 6450
NoConn ~ 10050 6550
NoConn ~ 10050 6650
NoConn ~ 10050 6750
NoConn ~ 10050 6850
NoConn ~ 10050 6950
NoConn ~ 10050 7050
NoConn ~ 10050 7150
NoConn ~ 10050 7750
NoConn ~ 10550 6550
NoConn ~ 10550 6650
NoConn ~ 10550 6750
NoConn ~ 10550 6850
NoConn ~ 10550 6950
NoConn ~ 10550 7050
NoConn ~ 10550 7150
NoConn ~ 10550 7250
NoConn ~ 10550 7850
Wire Wire Line
	9650 7550 10050 7550
Text Label 9650 7550 0    50   ~ 0
~RD
Text Label 9650 7650 0    50   ~ 0
~IORQ
Wire Wire Line
	9650 7650 10050 7650
Text Label 9650 7850 0    50   ~ 0
RESET
Wire Wire Line
	9650 7850 10050 7850
Text Label 10950 7550 2    50   ~ 0
~EXWAIT
Wire Wire Line
	10950 7550 10550 7550
Text Label 10950 7650 2    50   ~ 0
~WR
Wire Wire Line
	10950 7650 10550 7650
Text Label 10950 7750 2    50   ~ 0
~MREQ
Wire Wire Line
	10950 7750 10550 7750
Wire Wire Line
	10550 7350 11400 7350
Wire Wire Line
	11400 7350 11400 6750
Wire Wire Line
	11400 6750 12000 6750
Wire Wire Line
	12300 6750 12950 6750
Wire Wire Line
	12300 7150 12950 7150
Wire Wire Line
	12000 7150 11500 7150
Wire Wire Line
	11500 7150 11500 8400
Wire Wire Line
	11500 8400 9200 8400
Wire Wire Line
	9200 8400 9200 7350
Wire Wire Line
	9200 7350 10050 7350
Wire Wire Line
	12300 7550 12400 7550
Wire Wire Line
	12400 7550 12400 6950
Wire Wire Line
	12400 6950 12950 6950
Wire Wire Line
	12000 7550 11600 7550
Wire Wire Line
	11600 7550 11600 8500
Wire Wire Line
	11600 8500 9100 8500
Wire Wire Line
	9100 8500 9100 7250
Wire Wire Line
	9100 7250 10050 7250
Wire Wire Line
	10050 7450 9300 7450
Wire Wire Line
	9300 7450 9300 8600
Wire Wire Line
	9300 8600 13850 8600
Wire Wire Line
	13850 8600 13850 7150
Wire Wire Line
	13850 7150 13550 7150
Wire Wire Line
	10550 7450 11400 7450
Wire Wire Line
	11400 7450 11400 8300
Wire Wire Line
	11400 8300 13750 8300
Wire Wire Line
	13750 8300 13750 7350
Wire Wire Line
	13750 7350 13550 7350
Wire Wire Line
	12950 6650 12750 6650
Wire Wire Line
	12750 6650 12750 6850
Wire Wire Line
	12750 6850 12950 6850
Wire Wire Line
	12750 6850 12750 7050
Wire Wire Line
	12750 7050 12950 7050
Connection ~ 12750 6850
Wire Wire Line
	12750 7050 12750 7450
Wire Wire Line
	12750 7450 12950 7450
Connection ~ 12750 7050
NoConn ~ 13550 6750
NoConn ~ 13550 6950
NoConn ~ 13550 7550
NoConn ~ 12950 7250
NoConn ~ 12950 7350
NoConn ~ 12950 7550
Wire Wire Line
	10550 6450 10950 6450
Wire Wire Line
	10950 6450 10950 6800
$Comp
L power:GND #PWR?
U 1 1 69A46A5A
P 10950 6800
AR Path="/69A38FBD/69A46A5A" Ref="#PWR?"  Part="1" 
AR Path="/69A46A5A" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 10950 6550 50  0001 C CNN
F 1 "GND" H 10955 6627 50  0000 C CNN
F 2 "" H 10950 6800 50  0001 C CNN
F 3 "" H 10950 6800 50  0001 C CNN
	1    10950 6800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 69A46A60
P 12750 7600
AR Path="/69A38FBD/69A46A60" Ref="#PWR?"  Part="1" 
AR Path="/69A46A60" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 12750 7350 50  0001 C CNN
F 1 "GND" H 12755 7427 50  0000 C CNN
F 2 "" H 12750 7600 50  0001 C CNN
F 3 "" H 12750 7600 50  0001 C CNN
	1    12750 7600
	1    0    0    -1  
$EndComp
Wire Wire Line
	12750 7600 12750 7450
Connection ~ 12750 7450
$Comp
L 74xx:74LS04 U1
U 4 1 69B77BC4
P 5550 3550
F 0 "U1" H 5550 3867 50  0000 C CNN
F 1 "74LS04" H 5550 3776 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5550 3550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 5550 3550 50  0001 C CNN
	4    5550 3550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U1
U 5 1 69B7A0BC
P 5550 4150
F 0 "U1" H 5550 4467 50  0000 C CNN
F 1 "74LS04" H 5550 4376 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5550 4150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 5550 4150 50  0001 C CNN
	5    5550 4150
	1    0    0    -1  
$EndComp
Connection ~ 4050 6850
Connection ~ 4050 8050
$EndSCHEMATC
