library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity timer is
    port(
            clock : in  std_logic;
            reset : in  std_logic;
            presc : in  std_logic_vector(3 downto 0);
            module_input : in  std_logic_vector(7 downto 0);
            time_expired : out  std_logic
        );
end timer;

architecture struct of timer is

signal num_8bit : std_logic_vector (7 downto 0);
signal pulse : std_logic;

component prescaler is
    port(
            clock : in std_logic;
		    reset : in std_logic;
            presc : in  std_logic_vector(3 downto 0);
            pulse : out  std_logic
        );
end component;

component counter is
    port( 
            reset   : in  std_logic;
            pulse : in  std_logic;
            num_8bit  : out  std_logic_vector(7 downto 0)
        );
end component;

component comparator is
    port(
            reset   : in  std_logic;
            num_8bit : in  std_logic_vector (7 downto 0);
            module_input : in  std_logic_vector(7 downto 0);
            time_expired : out  std_logic
        );
end component;

begin
    u1: prescaler
        port map(
                clock => clock,
                reset => reset,
                presc => presc,
                pulse => pulse
            );


    u2: counter 
        port map(
                pulse => pulse,
                reset => reset,
                num_8bit => num_8bit
            );

    u3: comparator 
        port map(
                num_8bit => num_8bit,
                module_input => module_input,
                time_expired => time_expired,
                reset => reset
            );
end struct;