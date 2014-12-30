The Bejeweled bot was developed to run on Facebook (Bejeweled Blitz). Ctrl-Space initializes the bot (locates the board with image detection) and Space makes a move. Hold down the space bar to make a bunch of moves. The bot prioritizes 5 in a row, then 5 in an L or T shape, then multipliers, then 4 in a row, then double matches, then matches lower in the board, to increase odds of cascades.

The detection of gem color is particularly difficult, and is not perfect because of all the animation effects, but it's good enough to play the game. I did a good amount of data mining to try to find pixels and color ranges that gave decent results, you can see that data in the .txt file. The color of a gem is determined by looking at 4 pixels and using their RGB values as well as the ratios between R/G/B.

---

[Block Dude](http://azich.org/blockdude/) is a port of a popular calculator game. Optimal solutions to each level are coded into the script. Run them with Alt-1, Alt-2, ... Alt-9, Alt-0, Alt-minus.

There is a meta script contained in the script. If you uncomment the hotkeys for the arrows and right alt, the bot will record arrow key presses. Press the right alt key while in an empty notepad file and the bot will spit out the code to replay the key presses. Multiples of the same key in a row are collapsed.

---

Minesweeper is actually ViennaSweeper, one of the leading clones designed for speed competition. The full program is included. Run minesweeper.bat to open the game, and run Minesweeper.ahk to run the bot. Ctrl-Space starts the bot, and it will happily keep playing until you pause it with the grave key (single tick, under the escape key). Image detection for locating the board seems to not work on Windows 8, but it should be fine on 7 and XP. I don't feel like porting it to Win 8 at the moment.

You can see which pixels the bot uses to determine what a square is by looking at the Squares.bmp file. The file isn't used by the bot though.

The bot is not terribly smart, and AutoHotkey isn't the best language for serious coding, so I haven't improved it. It only handles completely deterministic logic. If it knows a square is a mine, it remembers it, but it doesn't handle situations such as "one of these 2 squares must be a mine, so the 3rd square is determined." If it can't determine a safe move (including at the start of the game), it guesses randomly.

At any rate, it turns out [Minesweeper is really hard](http://web.mat.bham.ac.uk/R.W.Kaye/minesw/ordmsw.htm).

Bonus: All my games are stored in the vids directory. If you remove ZookBot.csv the high scores will display my actual high scores. From the game, you can open a replay from the archive subdirectory. My best times are stored in the flags and noflags folders there. It turns out that playing without flags is faster on Beginner and Intermediate, and playing with flags is faster on Expert. There's also an Excel spreadsheet in the root directory with some data.

---

For bots that screen scrape (Bejeweled and Minesweeper), disable desktop composition for a huge speed increase.
