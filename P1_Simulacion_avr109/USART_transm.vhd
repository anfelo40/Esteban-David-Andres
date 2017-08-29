library work;
use work.pkg_USART_transm.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity USART_transm is

				generic
						(
							DATA_WIDTH: natural:=8
						);
				port 
						(
							data_in	:	in std_logic_vector(7 downto 0);
							ena_in	:	in std_logic;
							clk		:	in std_logic;
							reset_n	:	in std_logic;
							data_out	:	out std_logic
						);
end entity;

architecture rtl of USART_transm is

signal out_reg   : std_logic_vector(7 downto 0);
signal out_codi  : std_logic;
signal out_cont  : std_logic;
signal cont_mux  : std_logic_vector(3 downto 0);
signal hab_cont  : std_logic;
signal idle      : std_logic;
signal bit_start : std_logic;
signal bit_stop  : std_logic;

begin 

					idle      <= '1';
					bit_start <= '0';
					bit_stop  <= '1';

reg_data : registro

	generic map
				(
					DATA_WIDTH => DATA_WIDTH
				)

	port map
				(			
					D       => data_in,
					clk     => clk,
					ena     => ena_in,
					reset => reset_n,
					Q       => out_reg
				);

codificador_data : codificador
	 
	Port map
				(
					a => out_reg,
					s => out_codi
				);

time_cont : contador_104us

   generic map
				(
					DATA_WIDTH => DATA_WIDTH
				)


   port map
				(
   
					 hab_cont => hab_cont,
					 clk      => clk,
					 reset_n  => reset_n,
					 hab_sm   => out_cont
				);

unidad_de_control : control_path_us

	port map 
				(
					clk		   => clk,
					reset_n	   => reset_n,
					ena_in	   => ena_in,
					in_cont	   => out_cont,
					hab_cont	   => hab_cont,
					cont_mux    => cont_mux
				);
				
	with cont_mux select

			data_out <=	idle       when "0000",
							bit_start  when "0001",
							out_reg(0) when "0010",
							out_reg(1) when "0011",
							out_reg(2) when "0100",
							out_reg(3) when "0101",
							out_reg(4) when "0110",
							out_reg(5) when "0111",
							out_reg(6) when "1000",
							out_reg(7) when "1001",
							out_codi   when "1010",
							bit_stop   when others;

end rtl;