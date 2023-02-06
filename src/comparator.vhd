library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity comparator is
    port(
            reset   : in  std_logic;
            num_8bit : in  std_logic_vector (7 downto 0);
            module_input : in  std_logic_vector(7 downto 0);
            time_expired : out  std_logic
        );
end comparator;

architecture struct of comparator is

begin
    process(num_8bit, module_input)
    begin
        if (num_8bit = module_input) then
            time_expired <= '1';
        else 
            time_expired <= '0';
        end if;
    end process;
end struct;