----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.11.2024 08:10:04
-- Design Name: 
-- Module Name: Top_Level_Entity - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments: Test This is a Test
-- 
----------------------------------------------------------------------------------


-- Top Level Entity (Processor) VHDL Code
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Processor is
  Port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC
  );
end Processor;

architecture Behavioral of Processor is
  -- Hier werden alle Signale und Komponenten instanziiert
begin
  -- Instanziere Register File, ALU, Decoder, Program Counter usw.
  -- Verknüpfe Signale zwischen den Komponenten
end Behavioral;
