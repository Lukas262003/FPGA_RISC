----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.11.2024 08:04:37
-- Design Name: 
-- Module Name: Program_Counter - Behavioral
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


-- Program Counter VHDL Code
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ProgramCounter is
  Port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    pc_enable : in STD_LOGIC;
    pc_out : out STD_LOGIC_VECTOR(15 downto 0)
  );
end ProgramCounter;

architecture Behavioral of ProgramCounter is
  signal pc : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        pc <= (others => '0');
      elsif pc_enable = '1' then
        pc <= pc + 1;
      end if;
    end if;
  end process;
  pc_out <= pc;
end Behavioral;
