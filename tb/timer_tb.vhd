library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
 
entity timer_tb is
end timer_tb;
 
architecture struct of timer_tb is

   -- Component declaration for the Unit Under Test (UUT)
   component timer
      port(
            clock : in  std_logic;
            reset : in  std_logic;
            presc : in  std_logic_vector(3 downto 0);
            module_input : in  std_logic_vector(7 downto 0);
            time_expired : out  std_logic
         );
   end component;
    
   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal presc : std_logic_vector(3 downto 0) := (others => '0');
   signal module_input : std_logic_vector(7 downto 0) := (others => '0');

 	-- Output
   signal time_expired : std_logic := '0';
  
   -- Clock period definition (500 MHz)
   constant clock_period : time := 2 ns;
   constant t_reset : time := 25 ns;

begin
 
	-- Instantiate the Unit Under Test (UUT)
   uut: timer port map (
         clock => clock,
         reset => reset,
         presc => presc,
         module_input => module_input,
         time_expired => time_expired
        );

   clock <= (not(clock) and not(time_expired)) after clock_period/2;
   reset <= '1' after t_reset;

   stim_proc : process(clock, reset)
   begin
      if (reset = '0') then 
         presc <= "0001";
         module_input <= "00000000";
      else
         presc <= "0011";
         module_input <= "00000101";
      end if;
   end process;
end;