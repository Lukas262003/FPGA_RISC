----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.11.2024 08:41:08
-- Design Name: 
-- Module Name: ALU_Testbench - Behavioral
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


-- Testbench for ALU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU_tb is
end ALU_tb;

architecture Behavioral of ALU_tb is
  component ALU
    Port (
      operand1 : in STD_LOGIC_VECTOR(15 downto 0);
      operand2 : in STD_LOGIC_VECTOR(15 downto 0);
      operation : in STD_LOGIC_VECTOR(3 downto 0);
      result : out STD_LOGIC_VECTOR(15 downto 0);
      zero_flag : out STD_LOGIC
    );
  end component;

  -- Signals
  signal operand1 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
  signal operand2 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
  signal operation : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
  signal result : STD_LOGIC_VECTOR(15 downto 0);
  signal zero_flag : STD_LOGIC;

begin
  -- Instantiate the ALU component
  UUT: ALU
    Port map (
      operand1 => operand1,
      operand2 => operand2,
      operation => operation,
      result => result,
      zero_flag => zero_flag
    );

  -- Stimulus process
  stim_proc: process
  begin
    -- Test Addition
    operand1 <= x"0005";
    operand2 <= x"0003";
    operation <= "0000";  -- Add operation code
    wait for 20 ns;
    assert (result = x"0008")
      report "Test Addition Failed" severity error;

    -- Test Subtraction
    operand1 <= x"0008";
    operand2 <= x"0003";
    operation <= "0001";  -- Subtraction operation code
    wait for 20 ns;
    assert (result = x"0005")
      report "Test Subtraction Failed" severity error;

    -- Test AND Operation
    operand1 <= x"00FF";
    operand2 <= x"0F0F";
    operation <= "0010";  -- AND operation code
    wait for 20 ns;
    assert (result = x"000F")
      report "Test AND Failed" severity error;

    -- Additional operations and checks here

    wait;
  end process;
end Behavioral;

