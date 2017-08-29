-- Quartus Prime VHDL Template
-- Basic Shift Register

library ieee;
use ieee.std_logic_1164.all;

entity control_path_us is


	port 
	(
		clk		   : in  std_logic;
		reset_n	   : in  std_logic;
		ena_in	   : in  std_logic;
		in_cont	   : in  std_logic;
		hab_cont	   : out std_logic;
		cont_mux    : out std_logic_vector(3 downto 0)
	);

end entity;

architecture rtl of control_path_us is

type state_usart is (idle,bit_start,date1,date2,date3,
							date4,date5,date6,date7,date8,
							paridad,bit_stop);

signal CS,NS: state_usart;


begin

	CS<= idle when reset_n='1' else NS when rising_edge(clk);

	--logica de estados
	process (CS,ena_in,in_cont)
	
	begin
	
	case CS is
	
		when idle=>
			if ena_in='1' then
				NS<=bit_start;
			else
				NS<=idle;
			end if;
			
			
		when bit_start=>
			if in_cont ='1' then
				NS<=date1;
			else
				NS<=bit_start;
			end if;
			
		
		when date1=>
			if in_cont='1' then
				NS<=date2;
			else
				NS<=date1;
			end if;
			
			
		when date2=>
			if in_cont='1' then
				NS<=date3;
			else
				NS<=date2;
			end if;
			
			
		when date3=>
			if in_cont='1' then
				NS<=date4;
			else
				NS<=date3;
			end if;
			
			
		when date4=>
			if in_cont='1' then
				NS<=date5;
			else
				NS<=date4;
			end if;
			
			
		when date5=>
			if in_cont='1' then
				NS<=date6;
			else
				NS<=date5;
			end if;
			
			
		when date6=>
			if in_cont='1' then
				NS<=date7;
			else
				NS<=date6;
			end if;
		
		
		when date7=>
			if in_cont='1' then
				NS<=date8;
			else
				NS<=date7;
			end if;
		
		
		when date8=>
			if in_cont='1' then
				NS<=paridad;
			else
				NS<=date8;
			end if;
			
			
		when paridad=>
			if in_cont='1' then
				NS<=bit_stop;
			else
				NS<=paridad;
			end if;
		
		when bit_stop=>
			if in_cont='1' then
				NS<=idle;
			else
				NS<=bit_stop;
			end if;
			
		
		end case;
	end process;

-- lógica de salida	
	process(CS)
	begin
		case CS is
			when idle=>
				hab_cont<='0';
				cont_mux<="0000";
				
			when bit_start=>
				hab_cont<='1';
				cont_mux<="0001";
				
			when date1=>
				hab_cont<='1';
				cont_mux<="0010";
				
			when date2=>
				hab_cont<='1';
				cont_mux<="0011";
				
			when date3=>
				hab_cont<='1';
				cont_mux<="0100";
				
			when date4=>
				hab_cont<='1';
				cont_mux<="0101";
				
			when date5=>
				hab_cont<='1';
				cont_mux<="0110";
				
			when date6=>
				hab_cont<='1';
				cont_mux<="0111";
				
			when date7=>
				hab_cont<='1';
				cont_mux<="1000";
				
			when date8=>
				hab_cont<='1';
				cont_mux<="1001";
				
			when paridad=>
				hab_cont<='1';
				cont_mux<="1010";
				
			when bit_stop=>
				hab_cont<='1';
				cont_mux<="1011";
				
				
		end case;	
	end process;
	
	
end rtl;