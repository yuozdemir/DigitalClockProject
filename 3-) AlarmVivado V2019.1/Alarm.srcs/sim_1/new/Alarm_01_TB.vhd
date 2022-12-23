library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Alarm_01_TB is
end Alarm_01_TB;

architecture Behavioral of Alarm_01_TB is
    
    signal UD   : STD_LOGIC := '1';
    signal RST  : STD_LOGIC := '1';
    signal Clk  : STD_LOGIC := '1';
    signal BB   : STD_LOGIC_VECTOR(3 downto 0);
    signal OB   : STD_LOGIC_VECTOR(3 downto 0);
    signal SEG1 : STD_LOGIC_VECTOR(6 downto 0);
    signal SEG2 : STD_LOGIC_VECTOR(6 downto 0);

begin

    Clk           <= not clk after 50 ns;
    RST           <= '0' after 200 ns;
    BB <= "0110" after 250 ns;
    OB <= "0010" after 280 ns;

    Alar_01_inst : entity work.Alarm_01
        port map (
            UD      => UD,
            Clk     => Clk,
            RST     => RST,
            BB      => BB,
            OB      => OB,
            SEG1    => SEG1,
            SEG2    => SEG2);

end Behavioral;
