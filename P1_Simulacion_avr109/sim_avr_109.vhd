library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity sim_avr_109 is

			
				port 
						(
							--USART transmision
							data_in	:	in std_logic_vector(7 downto 0);
							ena_in	:	in std_logic;
							reset_n	:	in std_logic;
							
							--avr109
							 
							 clk : in std_logic;
							 
							 txd : out std_logic;
							 intercept_mode: out std_logic;
							 prog_mode: out std_logic;
							 prog_addr :	out std_logic_vector(15 downto 0);
							 prog_data :	out std_logic_vector(15 downto 0);
							 prog_data_in:	in std_logic_vector(15 downto 0);
							 prog_low : out std_logic;
							 prog_high: out std_logic;
							 debug :	out std_logic_vector(7 downto 0)
						);
end entity;

architecture rtl of sim_avr_109 is

component USART_transm is

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
end component;

component avr109 is 
           
			 port(
			 
	       rst : in std_logic;
	       clk : in std_logic;
	       rxd : in std_logic;
	       txd : out std_logic;
	       intercept_mode: out std_logic;
	       prog_mode: out std_logic;
	       prog_addr :	out std_logic_vector(15 downto 0);
	       prog_data :	out std_logic_vector(15 downto 0);
	       prog_data_in:	in std_logic_vector(15 downto 0);
	       prog_low : out std_logic;
	       prog_high: out std_logic;
	       debug :	out std_logic_vector(7 downto 0)
	       );
end component;

signal us_to_rxd : std_logic;

begin 

USART_transmision:USART_transm

port map (

		data_in=>data_in,
		ena_in=>ena_in,
		clk=>clk,
		reset_n=>reset_n,
      data_out=>us_to_rxd
		);

avr_109 :avr109
port map (
				rst => reset_n,
	       clk =>clk,
	       rxd=>us_to_rxd, 
	       txd =>txd,
	       intercept_mode=>intercept_mode,
	       prog_mode=>prog_mode , 
	       prog_addr=> prog_addr,
	       prog_data =>prog_data ,	
	       prog_data_in	=>prog_data_in,
	       prog_low  =>prog_low,
	       prog_high =>prog_high,
	       debug =>debug	
		);
		
end rtl;
