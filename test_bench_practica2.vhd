library ieee;  
use ieee.std_logic_1164.all;

entity test_multiple_2 is
end test_multiple_2;

architecture test of test_multiple_2 is
    signal x, rst, z: std_logic;
    signal clk: std_logic := '0';
    signal z1,z2,z3: std_logic;
begin
  
  ffD: entity work.practica_2(estructural_D) port map (clk, rst, x, z1);
  ffJK: entity work.practica_2(estructural_JK) port map (clk, rst, x, z2);
  fsmF: entity work.practica_2(fsm_funcional) port map (clk, rst, x, z3);

  clk <= not clk after 5 ns;
  rst <= '1', '0' after 20 ns;
  x <= '1', '0' after 30 ns,  '1' after 40 ns, '1' after 70 ns, '0' after 100 ns, '0' after 120 ns, '1' after 140 ns, '1' after 160 ns; 

end test;  