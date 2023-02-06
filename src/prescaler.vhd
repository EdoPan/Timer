library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity prescaler is
    port ( 
	        clock : in std_logic;
		      reset : in std_logic;
          presc : in  std_logic_vector(3 downto 0);
          pulse : out  std_logic
        );
end prescaler;

architecture struct of prescaler is

signal count : integer;
signal tmp : std_logic;
signal num : integer;

begin
  num <= to_integer(signed(presc));
  process(clock, reset, tmp)
  begin
      if (reset = '0') then
          count <= 1;
          tmp <= '0';
      elsif (clock'event and clock='1') then
        count <= count + 1;
      if count = num then
        tmp <= not tmp;
        count <= 1;
      end if;
      end if;
      pulse <= tmp;
  end process;
end struct;