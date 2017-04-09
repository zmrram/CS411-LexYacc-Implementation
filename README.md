In Linux system terminal, go to the directory of project2.

input files: sample.toy, testRight.toy, testRight2.toy, testWrong2.toy

Step 1: $ yacc -d -v myscanner.y
Step 2: $ lex myscanner.l
Step 3: $ gcc lex.yy.c y.tab.c -o myscanner

To run the sample Toy file: 
Step 5: $ ./myscanner < project1sample.toy

To run my testRight Toy file:
Step 6: $ ./myscanner < testRight.toy

To run my testRight2 Toy file:
Step 7: $ ./myscanner < testRight2.toy

To run my testWrong2 Toy file:
Step 8: $ ./myscanner < testWrong2.toy
