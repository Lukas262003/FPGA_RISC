----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.11.2024 08:03:47
-- Design Name: 
-- Module Name: Control_Unit - Behavioral
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


-- Control Unit VHDL Code
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlUnit is
  Port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    alu_op : in STD_LOGIC_VECTOR(3 downto 0);
    pc_enable : out STD_LOGIC
  );
end ControlUnit;

architecture Behavioral of ControlUnit is
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        pc_enable <= '0';
      else
        pc_enable <= '1';
      end if;
    end if;
  end process;
end Behavioral;
