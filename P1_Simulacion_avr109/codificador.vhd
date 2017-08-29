library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity codificador is
        Port 
(
        a : in std_logic_vector (7 downto 0);
        s : out std_logic
);
end entity;

 architecture rtl of codificador is
signal s1: std_logic_vector(3 downto 0);
signal s2: std_logic;
signal e,f,g,h,i,j,k,l :std_logic_vector(3 downto 0);
begin

	e<="000"& a(0);
	f<="000"& a(1);
	g<="000"& a(2);
	h<="000"& a(3);
	i<="000"& a(4);
	j<="000"& a(5);
	k<="000"& a(6);
	l<="000"& a(7);

          s1<=std_logic_vector(unsigned (e)+ 
										 unsigned (f)+ 
										 unsigned (g)+ 
										 unsigned (h)+ 
										 unsigned (i)+
										 unsigned (j)+ 
										 unsigned (k)+ 
										 unsigned (l)
										 );
			 
			s2<=not(s1(0));
			
			s<= s2;
			
end rtl;
