-- Structural VAMS generated by gnetlist
-- Secondary unit
ARCHITECTURE transistor_test OF top_entity IS
    terminal unnamed_net5 :  electrical;
    terminal unnamed_net4 :  electrical;
    terminal unnamed_net3 :  electrical;
    terminal unnamed_net2 :  electrical;
    terminal unnamed_net1 :  electrical;
BEGIN
-- Architecture statement part
    BJT1 : ENTITY BJT_transistor_simple(simple_arc)
	GENERIC MAP (
			NEL => 5.0)
	PORT MAP (	Base => unnamed_net2,
			Collector => unnamed_net5,
			Emitter => unnamed_net1);

    VS_base : ENTITY VOLTAGE_SOURCE(sinusodial)
	GENERIC MAP (
			amplitude => 1.0, 
			k => 150.0)
	PORT MAP (	LT => unnamed_net3,
			RT => unnamed_net1);

    VS_collector : ENTITY VOLTAGE_SOURCE(sinusodial)
	GENERIC MAP (
			amplitude => 2.0, 
			offset => 10.2, 
			k => 100.0)
	PORT MAP (	LT => unnamed_net4,
			RT => unnamed_net1);

    RES_collecter : ENTITY RESISTOR
	GENERIC MAP (
			r => 60.0)
	PORT MAP (	RT => unnamed_net4,
			LT => unnamed_net5);

    RES_base : ENTITY RESISTOR
	GENERIC MAP (
			r => 10000.0)
	PORT MAP (	RT => unnamed_net2,
			LT => unnamed_net3);

    GND : ENTITY GROUND_NODE
	PORT MAP (	T1 => unnamed_net1);

END ARCHITECTURE transistor_test;