v 20021103
C 96400 50800 1 90 0 resistor.sym
{
T 96100 51100 5 10 0 1 90 0
refdes=RES
T 96400 50800 5 5 0 1 90 0
r=RS
}
N 96300 52300 96300 52100 4
N 96300 49800 96300 50000 4
N 97500 49900 96300 49900 4
N 97500 51000 96300 51000 4
N 96300 51200 96300 51000 4
N 96300 51000 96300 50900 4
N 97500 51000 97500 50800 4
T 94100 52500 8 10 1 1 0 0
architecture=SPICE Diode Model
T 97200 52500 8 10 1 1 0 0
entity=sp Diode
T 95900 50900 9 20 1 0 0 0
+
T 95900 49900 9 20 1 0 0 0
-
T 95800 50400 9 15 1 0 0 0
V
T 95900 50300 9 7 1 0 0 0
D
T 97800 50300 9 15 1 0 0 0
Q
T 96700 50300 9 7 1 0 0 0
D
T 98000 50200 9 7 1 0 0 0
D
T 96600 50400 9 15 1 0 0 0
I
T 96600 51700 9 10 1 0 0 6
R
T 96700 51700 9 10 1 0 0 4
s
C 97800 49500 1 90 0 sp_voltage_dependend_capacitor.sym
{
T 97300 49700 5 10 0 1 90 0
refdes=VD_CAP
T 97300 49800 5 10 0 1 90 0
v_init=?0.0
T 97300 49700 5 10 0 1 90 0
CJ0=CJ0
T 97300 49700 5 10 0 1 90 0
TT=TT
T 97300 49700 5 10 0 1 90 0
ISS=ISS
T 97300 49700 5 10 0 1 90 0
VT=VT
T 97300 49700 5 10 0 1 90 0
M=M
T 97300 49700 5 10 0 1 90 0
PB=PB
}
C 96600 52100 1 90 0 port.sym
{
T 96800 52800 5 8 1 1 180 0
refdes=anode
}
C 96000 50000 1 270 0 port.sym
{
T 96100 49300 5 8 1 1 0 0
refdes=kathode
}
C 96100 51100 1 270 0 current_source.sym
{
T 97300 50700 5 7 0 0 270 0
refdes=CS1
T 97000 51300 5 4 0 0 270 0
ISS=ISS
T 97000 50600 5 4 0 0 270 0
VT=VT
T 97000 49900 5 4 0 0 270 0
N=N
T 97200 51100 5 4 0 0 270 0
architecture=?voltage_dependend
}