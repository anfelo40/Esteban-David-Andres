library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador_104us is 

   generic(
				DATA_WIDTH: natural:=8;
				MAX_NUM104: natural:=163
			 );


   port(
   
    hab_cont: in std_logic;
    clk     : in std_logic;
    reset_n : in std_logic;
    hab_sm  : out std_logic
    
    );
    
end entity;

architecture rtl of contador_104us is

component registro is
 
			generic
					(
					DATA_WIDTH: natural:= 15
					);

			port(
			
				D: in std_logic_vector((DATA_WIDTH -1) downto 0);
				clk, ena: in std_logic;
				reset: in std_logic;
				Q: out std_logic_vector((DATA_WIDTH -1) downto 0)
				);
				
end component;


signal SalReg,suma,SalSum: std_logic_vector((DATA_WIDTH -1) downto 0);
signal sig_hab_cont,comp104: std_logic;
--signal comp156: std_logic;


begin 

reg_cont_104 : registro 

  generic map(
					DATA_WIDTH=>DATA_WIDTH
				 )
       
  Port map 
    (
		  clk     => clk,
		  reset => reset_n,
		  D       => SalSum,
		  ena     => hab_cont,
		  Q       =>SalReg
     );
   

suma<= std_logic_vector(unsigned (SalReg) + to_unsigned(1,DATA_WIDTH ));

comp104<= '1' when unsigned(SalReg) = MAX_NUM104 else '0';


with comp104 select 
 SalSum<= suma when '0',
         (others=>'0') when '1',
			(others=>'0') when others;
 

hab_sm <= comp104;

end rtl;