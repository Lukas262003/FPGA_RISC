----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.11.2024 08:02:31
-- Design Name: 
-- Module Name: Decoder - Behavioral
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


-- Decoder VHDL Code
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder is
  Port (
    instruction : in STD_LOGIC_VECTOR(15 downto 0);
    alu_op : out STD_LOGIC_VECTOR(3 downto 0);
    reg_dst : out STD_LOGIC_VECTOR(3 downto 0);
    reg_src : out STD_LOGIC_VECTOR(3 downto 0);
    write_enable : out STD_LOGIC
  );
end Decoder;

architecture Behavioral of Decoder is
begin
  process(instruction)
  begin
    alu_op <= instruction(15 downto 12); -- Setzt die ALU-Operation
    reg_dst <= instruction(11 downto 8); -- Zielregister
    reg_src <= instruction(7 downto 4);  -- Quellregister
    write_enable <= instruction(3); -- Schreibt das Ergebnis in das Register
  end process;
end Behavioral;
