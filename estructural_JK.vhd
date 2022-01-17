library ieee;
use ieee.std_logic_1164.all;

entity practica_2 is
port (clk, rst, x: in std_logic;
z: out std_logic);
end practica_2;

architecture estructural_JK of practica_2 is
signal Q: std_logic_vector(1 downto 0);
signal J, K: std_logic_vector(1 downto 0);

begin

flipflop_JK0: entity work.flipflopJK port map(clk, rst, J(0), K(0), Q(0));
J(0) <= (not Q(0) and Q(1) and x);
K(0) <= ((Q(0) and x) or (Q(0) and Q(1)));

flipflop_JK1: entity work.flipflopJK port map(clk, rst, J(1), K(1), Q(1));
J(1) <= (not Q(1) and not x);
K(1) <= (Q(1) and x);


z <= (Q(0) and Q(1) and x);

end estructural_JK;
