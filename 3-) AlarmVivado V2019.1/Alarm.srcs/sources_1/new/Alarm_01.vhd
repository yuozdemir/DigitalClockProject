library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Alarm_01 is
    Port ( UD   : in STD_LOGIC; -- Up or Down
           RST  : in STD_LOGIC; -- Reset
           Clk  : in STD_LOGIC; -- Clock
           BB   : in STD_LOGIC_VECTOR(3 downto 0); -- Birler basamagi
           OB   : in STD_LOGIC_VECTOR(3 downto 0); -- Onlar basamagi       
           SEG1 : out STD_LOGIC_VECTOR(6 downto 0); -- 7 segment display birler
           SEG2 : out STD_LOGIC_VECTOR(6 downto 0)); -- 7 segment display onlar
end Alarm_01;

architecture Behavioral of Alarm_01 is
    use ieee.numeric_std.all;

begin

    p : process(Clk)
    begin
        if rising_edge(Clk) then
            if RST = '1' then 
                SEG1 <= (others => '0');
                SEG2 <= (others => '0');
            else
                case to_integer(unsigned(BB)) is
                    when 0 => SEG1 <= "0000001";     
                    when 1 => SEG1 <= "1001111"; 
                    when 2 => SEG1 <= "0010010"; 
                    when 3 => SEG1 <= "0000110"; 
                    when 4 => SEG1 <= "1001100"; 
                    when 5 => SEG1 <= "0100100"; 
                    when 6 => SEG1 <= "0100000"; 
                    when 7 => SEG1 <= "0001111"; 
                    when 8 => SEG1 <= "0000000";     
                    when 9 => SEG1 <= "0000100"; 
                    when others => SEG1 <= "0000000";
                end case;

                case to_integer(unsigned(OB)) is
                    when 0 => SEG2 <= "0000001";     
                    when 1 => SEG2 <= "1001111"; 
                    when 2 => SEG2 <= "0010010"; 
                    when 3 => SEG2 <= "0000110"; 
                    when 4 => SEG2 <= "1001100"; 
                    when 5 => SEG2 <= "0100100"; 
                    when 6 => SEG2 <= "0100000"; 
                    when 7 => SEG2 <= "0001111"; 
                    when 8 => SEG2 <= "0000000";     
                    when 9 => SEG2 <= "0000100"; 
                    when others => SEG2 <= "0000000";
                end case;
            end if;
        end if;
    end process;

end Behavioral;
