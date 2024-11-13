----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.11.2024 08:01:33
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
  Port (
    operand1 : in STD_LOGIC_VECTOR(15 downto 0);
    operand2 : in STD_LOGIC_VECTOR(15 downto 0);
    operation : in STD_LOGIC_VECTOR(3 downto 0); -- 4-bit Opcode
    result : out STD_LOGIC_VECTOR(15 downto 0);
    zero_flag : out STD_LOGIC
  );
end ALU;

architecture Behavioral of ALU is
  signal temp_result : STD_LOGIC_VECTOR(15 downto 0);
begin
  process(operand1, operand2, operation)
  begin
    case operation is
      when "0000" => temp_result <= std_logic_vector(unsigned(operand1) + unsigned(operand2)); -- Addition
      when "0001" => temp_result <= std_logic_vector(unsigned(operand1) - unsigned(operand2)); -- Subtraktion
      when "0010" => temp_result <= operand1 and operand2; -- AND
      when "0011" => temp_result <= operand1 or operand2;  -- OR
      when "0100" => temp_result <= std_logic_vector(unsigned(operand1) sll 1); -- Shift left
      when "0101" => temp_result <= std_logic_vector(unsigned(operand1) srl 1); -- Shift right
      when others => temp_result <= (others => '0'); -- Defaultwert
    end case;

    -- Setze Zero Flag, wenn das Ergebnis Null ist
    if temp_result = "0000000000000000" then
      zero_flag <= '1';
    else
      zero_flag <= '0';
    end if;
  end process;

  -- Ausgabe zuweisen
  result <= temp_result;

end Behavioral;

