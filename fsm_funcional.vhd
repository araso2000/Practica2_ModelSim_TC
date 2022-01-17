library ieee;
use ieee.std_logic_1164.all;

entity practica_2 is
port (clk, rst, x: in std_logic;
 z: out std_logic);
end practica_2;

architecture fsm_funcional of practica_2 is
type estados is (S0, S1, S2, S3);
signal despues, antes: estados; 
begin
process(x,antes,despues)
begin
case antes is
when S0 => if x='0' then despues <= S1; z<= '0';
else despues <= S0; z<= '0';
end if;

when S1 => if x='1' then despues <= S2; z<= '0';
else despues <= S1; z<= '0';
end if;

when S2 => if x='0' then despues <= S3; z<= '0';
else despues <= S0; z<= '0';
end if;

when S3 => if x='1' then despues <= S0; z<= '1';
else despues <= S1; z<= '0';
end if;
end case;
end process;

process(clk,rst)
begin
if rst = '1' then
antes <= S0;
elsif rising_edge(clk) then
antes <= despues;
end if;
end process;
end fsm_funcional;