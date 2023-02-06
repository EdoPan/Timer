library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is
  port (
    reset   : in  std_logic;
    pulse : in  std_logic;
    num_8bit  : out  std_logic_vector(7 downto 0)
  );

end counter;

architecture struct of counter is

signal pulse_count: std_logic_vector(7 downto 0);

  begin
  process(pulse, reset)
  begin
    if (reset='0') then
      pulse_count<="00000000";
    elsif pulse = '1' then
      pulse_count <= pulse_count + 1;
    end if;
    num_8bit<=pulse_count;
  end process;
end struct;