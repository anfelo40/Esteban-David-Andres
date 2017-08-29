library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


package pkg_USART_transm is

component registro is
 
		generic(
					DATA_WIDTH: natural:= 8
					);

			port(
			
				D: in std_logic_vector((DATA_WIDTH -1) downto 0);
				clk, ena: in std_logic;
				reset: in std_logic;
				Q: out std_logic_vector((DATA_WIDTH -1) downto 0)
				);
				
end component;

component codificador is
        Port 
(
        a : in std_logic_vector (7 downto 0);
        s : out std_logic
);
end component;

component contador_104us is 

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
    
end component;

component control_path_us is


	port 
	(
		clk		   : in  std_logic;
		reset_n	   : in  std_logic;
		ena_in	   : in  std_logic;
		in_cont	   : in  std_logic;
		hab_cont	   : out std_logic;
		cont_mux    : out std_logic_vector(3 downto 0)
	);

end component;

component preescal is 

			generic(
					DATA_WIDTH: natural:= 5;
					MAX_NUM: natural:=31
						);


			port(
			
				clk: in std_logic;
				reset: in std_logic;
				Q: out std_logic
				
				);
				
end component;

component registro1bit is
 
			port(
			
				D: in std_logic;
				clk, ena: in std_logic;
				reset: in std_logic;
				Q: out std_logic
				);
				
end component;

end package;