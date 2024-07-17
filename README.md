# MIPS GoL
 A Conway's Game of Life simulator for MARS MIPS simulator!

 ![Alt Text](https://media.tenor.com/xmJnBpTf3dwAAAAM/fortnite-clip-krusty-krab.gif)

## Requirements
- [MARS 4.5 simulator](https://courses.missouristate.edu/kenvollmar/mars/)
    - If this is your first time running it:
        - Click `Memory Configuration` under `Settings` menu near the top of the screen
        - Set `Memory Configuration` to `Compact, Data at address 0`
        - Click `Apply`
- Python 3.6 or higher
    - TKinter

## How to use
### Generating Initial Canvas
1. Run `python3 GoLCanvasGenerator.py`
2. Mess around and have fun!
    - Left click to enable cell
    - Right click to disable cell
3. Exit the program
4. This will generate a file named `GoLCanvas.txt`

### Running the simulator
1. Open MARS simulator
2. Load `GoL-MIPS.asm`
3. Paste the contents of `GoLCanvas.txt` into the section that says 
```assembly
	# PASTE CANVAS CODE HERE #####################################################



	##############################################################################
```
4. Open `Bitmap Display` under `Tools` menu near the top of the screen
    1. Set the `Unit Width` and `Unit Height` to 16
    2. Set the `Display Width` and `Display Height` to 512
        - If you wish to try different resolutions, make sure the display width/height divided by unit width/height is 32
    3. Set the `Base Address` to `0x00000000`
    4. Click `Connect to MIPS`
5. Assemble the code and run it
6. Do a little jig if you managed to get it working!