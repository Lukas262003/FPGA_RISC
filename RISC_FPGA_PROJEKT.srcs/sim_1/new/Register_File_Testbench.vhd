----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.11.2024 08:11:17
-- Design Name: 
-- Module Name: Register_File_Testbench - Behavioral
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

entity RegisterFile_tb is
end RegisterFile_tb;

architecture Behavioral of RegisterFile_tb is
  -- Component declaration for RegisterFile
  component RegisterFile
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
  end component;

  -- Signals for simulation
  signal clk : STD_LOGIC := '0';
  signal rst : STD_LOGIC := '1';
  signal read_addr1 : STD_LOGIC_VECTOR(3 downto 0) := "0000";
  signal read_addr2 : STD_LOGIC_VECTOR(3 downto 0) := "0001";
  signal write_addr : STD_LOGIC_VECTOR(3 downto 0) := "0000";
  signal write_data : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
  signal write_enable : STD_LOGIC := '0';
  signal read_data1 : STD_LOGIC_VECTOR(15 downto 0);
  signal read_data2 : STD_LOGIC_VECTOR(15 downto 0);

begin
  -- Instantiation of the RegisterFile component
  UUT: RegisterFile
    Port map (
      clk => clk,
      rst => rst,
      read_addr1 => read_addr1,
      read_addr2 => read_addr2,
      write_addr => write_addr,
      write_data => write_data,
      write_enable => write_enable,
      read_data1 => read_data1,
      read_data2 => read_data2
    );

  -- Clock process for clk signal generation
  clk_process :process
  begin
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
  end process;

  -- Stimulus process
  stim_proc: process
  begin
    -- 1. Reset all registers
    rst <= '1';
    wait for 20 ns;
    rst <= '0';
    wait for 20 ns;

    -- Check that all registers are zero after reset
    assert (read_data1 = x"0000" and read_data2 = x"0000")
      report "Test Failed: Registers are not zero after reset" severity error;

    -- 2. Write to Register 0 and read it back
    write_enable <= '1';
    write_addr <= "0000";       -- Address of Register 0
    write_data <= x"AAAA";      -- Data to write
    wait for 20 ns;

    -- Disable write and read back from Register 0
    write_enable <= '0';
    read_addr1 <= "0000";
    wait for 20 ns;

    -- Check result (should be AAAA)
    assert (read_data1 = x"AAAA")
      report "Test Failed: Register 0 did not store the correct value" severity error;

    -- 3. Write to Register 1 and verify simultaneous read
    write_enable <= '1';
    write_addr <= "0001";       -- Address of Register 1
    write_data <= x"BBBB";      -- Data to write
    wait for 20 ns;

    write_enable <= '0';
    read_addr1 <= "0000";
    read_addr2 <= "0001";
    wait for 20 ns;

    -- Expected: Register 0 = AAAA, Register 1 = BBBB
    assert (read_data1 = x"AAAA" and read_data2 = x"BBBB")
      report "Test Failed: Simultaneous read did not return correct values" severity error;

    wait;
  end process;
end Behavioral;
