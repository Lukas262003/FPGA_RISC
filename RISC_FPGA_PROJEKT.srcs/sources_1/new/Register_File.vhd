----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.11.2024 08:00:31
-- Design Name: 
-- Module Name: Register_File - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RegisterFile is
  Port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    read_addr1 : in STD_LOGIC_VECTOR(3 downto 0);
    read_addr2 : in STD_LOGIC_VECTOR(3 downto 0);
    write_addr : in STD_LOGIC_VECTOR(3 downto 0);
    write_data : in STD_LOGIC_VECTOR(15 downto 0);
    write_enable : in STD_LOGIC;
    read_data1 : out STD_LOGIC_VECTOR(15 downto 0);
    read_data2 : out STD_LOGIC_VECTOR(15 downto 0)
  );
end RegisterFile;

architecture Behavioral of RegisterFile is
  type reg_array is array (0 to 15) of STD_LOGIC_VECTOR(15 downto 0);
  signal registers : reg_array := (others => (others => '0'));
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        registers <= (others => (others => '0'));
      elsif write_enable = '1' then
        registers(to_integer(unsigned(write_addr))) <= write_data;
      end if;
    end if;
  end process;

  read_data1 <= registers(to_integer(unsigned(read_addr1)));
  read_data2 <= registers(to_integer(unsigned(read_addr2)));
end Behavioral;

