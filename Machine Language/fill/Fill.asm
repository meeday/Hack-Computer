// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(LOOP)
@SCREEN
D=A
@8192
M=D	// set address of screen to ram[8192]


@KBD
D=M
@BLACKSCREEN
D;JGT	//D register should be above 0 if keys are pressed so it will jump to Blackscreen adress
@WHITESCREEN
D;JEQ	//D register should be equal to 0 if no keys are pressed so it will jump to Whitescreen adress



(BLACKSCREEN)
@1
M=-1	// fill screen with -1 
@FILL
0;JMP




(WHITESCREEN)
@1
M=0	 // fill screen with 0
@FILL
0;JMP



(FILL)
@1	//Check if D contains -1 (black) or 0 (white)
D=M	

@8192
A=M	//get address of screen
M=D	//fill screen 

@8192
D=M+1	//move to next pixel
@KBD
D=A-D	

@8192
M=M+1	//move to next pixel
A=M

@FILL
D;JGT	// if D is greater than 0 then jump to fill else jump back to loop
/////////////////////////
@LOOP
0;JMP