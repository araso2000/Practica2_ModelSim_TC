library ieee;
use ieee.std_logic_1164.all;

entity practica_2 is
port (clk, rst, x: in std_logic;
	z: out std_logic);
end practica_2;

architecture estructural_d of practica_2 is
signal D: std_logic_vector(1 downto 0);
signal Q: std_logic_vector(1 downto 0);

begin
flipflopD0: entity work.flipflopD port map(clk, rst, D(0), Q(0));
D(0) <= ((not Q(0) and Q(1) and x) or
	(Q(0) and not Q(1)) or
	(Q(0) and not x));

flipflopD1: entity work.flipflopD port map(clk, rst, D(1), Q(1));
D(1) <= (not x);

z <= (Q(1) and Q(0) and x);

end estructural_d;
