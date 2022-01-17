library ieee;
use ieee.std_logic_1164.all;

entity flipflopD is
  port(clk, rst, D: in std_logic;
       Q: out std_logic);
end flipflopD;

architecture funcional of flipflopD is
begin
  process(clk,rst)
  begin
    if rst = '1' then
      Q <= '0';
    elsif rising_edge(clk) then
      Q <= D;
    end if;
  end process;
end funcional;

---------------------------------------------------
---------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity flipflopJK is
  port(clk, rst, J, K: in std_logic;
       Q: out std_logic);
end flipflopJK;

architecture funcional of flipflopJK is
signal JK: std_logic_vector(1 downto 0);
signal Q_aux: std_logic;
begin
  JK <= J&K;
  process(clk, rst)
    begin
    if rst = '1' then
      Q_aux <= '0';
    elsif rising_edge(clk) then
      case JK is
        when "00" => Q_aux <= Q_aux;
        when "01" => Q_aux <= '0';
        when "10" => Q_aux <= '1';
        when others => Q_aux <= not Q_aux;
      end case;
    end if;
  end process;
  Q <= Q_aux;
end funcional;

---------------------------------------------------
---------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity flipflopSR is
  port(clk, rst, S, R: in std_logic;
       Q: out std_logic);
end flipflopSR;

architecture funcional of flipflopSR is
begin
  process(clk, rst)
    begin
    if rst = '1' then
      Q <= '0';
    elsif rising_edge(clk) then
      if S = '1' then
        Q <= '1';
      elsif R = '1' then
        Q <= '0';
      end if;
    end if;
  end process;
end funcional;


---------------------------------------------------
---------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity flipflopT is
  port(clk, rst, T: in std_logic;
       Q: out std_logic);
end flipflopT;

architecture funcional of flipflopT is
signal Q_aux: std_logic;
begin
  process(clk,rst)
  begin
    if rst = '1' then
      Q_aux <= '0';
    elsif rising_edge(clk) then
      if T = '1' then
        Q_aux <= not Q_aux;
      end if;
    end if;
  end process;
  Q <= Q_aux;
end funcional;
