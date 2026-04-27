
;24l-3093
;24l-3084
[org 0x0100]
jmp start

;DATA SECTION
score: dw 0
highScore: dw 0 
distance: dw 0
currentLevel: dw 1
requiredDistance: dw 100
gameOver: db 0
oldKbISR: dd 0
oldTimerISR: dd 0
tickCount: dw 0
spawnCounter: dw 0
pauseGame: db 0
gameSpeed: dw 2
escPressed: db 0
shiftPressed: db 0
levelComplete: db 0
snowCounter: dw 0
blinkCounter: dw 0
newRecord: db 0
musicNoteIndex: dw 0

obstacles: times 10 dw 0
obstacleCol: times 10 dw 0
obstacleType: times 10 db 0
randSeed: dw 0x1234
fallingObjects: times 10 dw 0
fallingObjectsCol: times 10 dw 0
fallingObjectsSpeed: times 10 db 0

playerRow: dw 20
playerCol: dw 38
playerLane: db 1
lanePositions: dw 25, 38, 51

; Messages
DEVELOPER_TAG: db 'FREE VERSION(FALL-2025) DEVELOPED BY: ',0
DEVELOPER_NAME: db 'KAINAT(24L-3084) & RABIA(24L-3093) ',0
FORWAR_INSTRUCTION: db 'Press I for Instructions. ',0
LEVEL_COMPLETION_MSG_1: db 'Level ',0
LEVEL_COMPLETION_MSG_2: db ' Completed ',0
SCORE_MSG: db 'Total Score: ',0
MID_SCREEN_INSTRUCTIONS_1: db 'Press Enter/Spacebar for Next Level ',0
MID_SCREEN_INSTRUCTIONS_2: db 'Press Esc to Exit ',0
GAME_OVER_MSG: db 'GAME OVER',0
SCORE_MSG_END: db 'Total Score: ',0
END_SCREEN_INSTRUCTIONS_1: db 'Press Enter/Spacebar to play again ',0
END_SCREEN_INSTRUCTIONS_2: db 'Press Esc to Exit ',0
ALL_LEVELS_COMPLETE_MSG: db 'ALL LEVELS COMPLETED!',0
CHAMPION_MSG: db 'YOU ARE A CHAMPION!',0

controls2: db 'LEFT/RIGHT - Change Lanes', 0
controls3: db 'ESC - Pause Game', 0
controls4: db 'Complete each level by reaching target distance', 0
controls5: db 'Level 1 (100m): Day Theme - Green Trees', 0
controls6: db 'Level 2 (200m): Night Theme - City Lights', 0
controls7: db 'Level 3 (300m): Desert Theme - Mountains & Cacti', 0
controls8: db 'Level 4 (400m): Snow Theme - Winter Trees', 0
controls9: db 'Level 5 (500m): Beach Theme - Ocean & Palms', 0
controls10: db 'Avoid red cars! Collect $ for bonus points!', 0
pauseMsg1: db '   Press SHIFT to Continue   ', 0
pauseMsg2: db '     Press ESC to Exit       ', 0
loadingMsg: db 'LOADING GAME...', 0
distanceLabel: db 'DIST:', 0
levelLabel: db 'LVL:', 0
highScoreLabel: db 'HIGH:', 0
scoreLabel: db 'SCORE:', 0
pressAnyKey: db 'Press any key to start...', 0
newRecordMsg: db 'NEW RECORD!', 0
thankYouMsg: db 'THANK YOU FOR PLAYING!', 0 
finalScore: db 'Final Score: ', 0
FREE_TRIAL_MSG_1: db 'FREE TRIAL COMPLETED!',0
FREE_TRIAL_MSG_2: db 'You have completed all 5 free levels!',0
FREE_TRIAL_MSG_3: db 'Unlock premium version for more levels!',0
FREE_TRIAL_MSG_4: db 'Press ENTER to replay free levels',0
FREE_TRIAL_MSG_5: db 'Press ESC to exit',0
THANK_YOU_TRIAL: db 'Thanks for playing the free version!',0
confirmExitMsg1: db 'Are you sure you want to exit?', 0
confirmExitMsg2: db 'Press Y to Exit | Press N to Continue', 0

titleLine1: db ' ___  _  _   _  __  _ _ _  _ ___ ___  _ _ _  __ _ _ _ _  __  _  _  ___ ', 0
titleLine2: db '| __ |_| |\ /| |__   |  |\ ||___  |  |_|| | |    |   |  |  | |\ | |___  ', 0
titleLine3: db '|__| | | | | | |__  _|_ | \| ___| |  |\ |_| |__  |  _|_ |__| | \|  ___|   ', 0
print_H1:
    pusha
    mov ah,0x09
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,-488
    
    mov word[es:di+650],ax
    mov word[es:di+652],ax
    mov word[es:di+662],ax
    mov word[es:di+664],ax
    mov word[es:di+810],ax
    mov word[es:di+812],ax
    mov word[es:di+822],ax
    mov word[es:di+824],ax
    mov word[es:di+970],ax
    mov word[es:di+972],ax
    mov word[es:di+974],ax
    mov word[es:di+976],ax
    mov word[es:di+978],ax
    mov word[es:di+980],ax
    mov word[es:di+982],ax
    mov word[es:di+984],ax
    mov word[es:di+1130],ax
    mov word[es:di+1132],ax
    mov word[es:di+1142],ax
    mov word[es:di+1144],ax
    mov word[es:di+1290],ax
    mov word[es:di+1292],ax
    mov word[es:di+1302],ax
    mov word[es:di+1304],ax
    mov word[es:di+1450],ax
    mov word[es:di+1452],ax
    mov word[es:di+1462],ax
    mov word[es:di+1464],ax
    popa
    ret

print_I:
    pusha
    mov ah,0x09
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,-470
    mov word[es:di+650],ax
    mov word[es:di+652],ax
    mov word[es:di+810],ax
    mov word[es:di+812],ax
    mov word[es:di+970],ax
    mov word[es:di+972],ax
    mov word[es:di+1130],ax
    mov word[es:di+1132],ax
    mov word[es:di+1290],ax
    mov word[es:di+1292],ax
    mov word[es:di+1450],ax
    mov word[es:di+1452],ax
    popa
    ret

print_G:
    pusha
    mov ah,0x09
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,-302
    mov word[es:di+492],ax
    mov word[es:di+494],ax
    mov word[es:di+496],ax
    mov word[es:di+498],ax
    mov word[es:di+500],ax
    mov word[es:di+650],ax
    mov word[es:di+652],ax
    mov word[es:di+662],ax
    mov word[es:di+664],ax
    mov word[es:di+810],ax
    mov word[es:di+812],ax
    mov word[es:di+808],ax
    mov word[es:di+970],ax
    mov word[es:di+972],ax
    mov word[es:di+984],ax
    mov word[es:di+968],ax
    mov word[es:di+982],ax
    mov word[es:di+980],ax
    mov word[es:di+978],ax
    mov word[es:di+1132],ax
    mov word[es:di+1130],ax
    mov word[es:di+1142],ax
    mov word[es:di+1144],ax
    mov word[es:di+1294],ax
    mov word[es:di+1296],ax
    mov word[es:di+1298],ax
    mov word[es:di+1300],ax
    popa
    ret

print_H2:
    pusha
    mov ah,0x09
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,-444
    mov word[es:di+650],ax
    mov word[es:di+652],ax
    mov word[es:di+662],ax
    mov word[es:di+664],ax
    mov word[es:di+810],ax
    mov word[es:di+812],ax
    mov word[es:di+822],ax
    mov word[es:di+824],ax
    mov word[es:di+970],ax
    mov word[es:di+972],ax
    mov word[es:di+974],ax
    mov word[es:di+976],ax
    mov word[es:di+978],ax
    mov word[es:di+980],ax
    mov word[es:di+982],ax
    mov word[es:di+984],ax
    mov word[es:di+1130],ax
    mov word[es:di+1132],ax
    mov word[es:di+1142],ax
    mov word[es:di+1144],ax
    mov word[es:di+1290],ax
    mov word[es:di+1292],ax
    mov word[es:di+1302],ax
    mov word[es:di+1304],ax
    mov word[es:di+1450],ax
    mov word[es:di+1452],ax
    mov word[es:di+1462],ax
    mov word[es:di+1464],ax
    popa
    ret

print_W:
    pusha
    mov ah,0x09
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,-422
    mov word[es:di+650-4],ax
    mov word[es:di+652-4],ax
    mov word[es:di+662+4],ax
    mov word[es:di+664+4],ax
    mov word[es:di+810-4],ax
    mov word[es:di+812-4],ax
    mov word[es:di+822+4],ax
    mov word[es:di+824+4],ax
    mov word[es:di+970-4],ax
    mov word[es:di+972-4],ax
    mov word[es:di+982+4],ax
    mov word[es:di+984+4],ax
    mov word[es:di+1130-4],ax
    mov word[es:di+1132-4],ax
    mov word[es:di+1142+4],ax
    mov word[es:di+1144+4],ax
    mov word[es:di+1292-4],ax
    mov word[es:di+1302+4],ax
    mov word[es:di+1454-160-8],ax
    mov word[es:di+1460-160+8],ax
    mov word[es:di+1616-480],ax
    mov word[es:di+1618-480],ax
    mov word[es:di+1616-160-8],ax
    mov word[es:di+1618-160-12],ax
    mov word[es:di+1616-160+10],ax
    mov word[es:di+1618-160+10],ax
    mov word[es:di+1616-320+6],ax
    mov word[es:di+1618-160+6],ax
    mov word[es:di+1618-320+2],ax
    mov word[es:di+1616-160+6],ax
    mov word[es:di+1618-160+2],ax
    mov word[es:di+1616-320-2],ax
    mov word[es:di+1618-320-6],ax
    mov word[es:di+1618-160-8],ax
    mov word[es:di+1616-160-2],ax
    mov word[es:di+1618-160-6],ax
    popa
    ret

print_A_intro:
    pusha
    mov ah,0x09
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,-400
    mov word[es:di+652],ax
    mov word[es:di+654],ax
    mov word[es:di+656],ax
    mov word[es:di+658],ax
    mov word[es:di+660],ax
    mov word[es:di+662],ax
    mov word[es:di+810],ax
    mov word[es:di+812],ax
    mov word[es:di+822],ax
    mov word[es:di+824],ax
    mov word[es:di+970],ax
    mov word[es:di+972],ax
    mov word[es:di+982],ax
    mov word[es:di+984],ax
    mov word[es:di+1130],ax
    mov word[es:di+1132],ax
    mov word[es:di+1134],ax
    mov word[es:di+1136],ax
    mov word[es:di+1138],ax
    mov word[es:di+1140],ax
    mov word[es:di+1142],ax
    mov word[es:di+1144],ax
    mov word[es:di+1290],ax
    mov word[es:di+1292],ax
    mov word[es:di+1302],ax
    mov word[es:di+1304],ax
    mov word[es:di+1450],ax
    mov word[es:di+1452],ax
    mov word[es:di+1462],ax
    mov word[es:di+1464],ax
    popa
    ret

print_Y:
    pusha
    mov ah,0x09
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,-374
    mov word[es:di+650-8],ax
    mov word[es:di+652-8],ax
    mov word[es:di+650+8],ax
    mov word[es:di+652+8],ax
    mov word[es:di+810-8],ax
    mov word[es:di+812-8],ax
    mov word[es:di+810+8],ax
    mov word[es:di+812+8],ax
    mov word[es:di+970-4],ax
    mov word[es:di+972-4],ax
    mov word[es:di+970+4],ax
    mov word[es:di+972+4],ax
    mov word[es:di+1130],ax
    mov word[es:di+1132],ax
    mov word[es:di+1290],ax
    mov word[es:di+1292],ax
    mov word[es:di+1450],ax
    mov word[es:di+1452],ax
    popa
    ret

print_H3:
    pusha
    mov ah,0x0f
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,632
    mov word[es:di+650],ax
    mov word[es:di+652],ax
    mov word[es:di+662],ax
    mov word[es:di+664],ax
    mov word[es:di+810],ax
    mov word[es:di+812],ax
    mov word[es:di+822],ax
    mov word[es:di+824],ax
    mov word[es:di+970],ax
    mov word[es:di+972],ax
    mov word[es:di+974],ax
    mov word[es:di+976],ax
    mov word[es:di+978],ax
    mov word[es:di+980],ax
    mov word[es:di+982],ax
    mov word[es:di+984],ax
    mov word[es:di+1130],ax
    mov word[es:di+1132],ax
    mov word[es:di+1142],ax
    mov word[es:di+1144],ax
    mov word[es:di+1290],ax
    mov word[es:di+1292],ax
    mov word[es:di+1302],ax
    mov word[es:di+1304],ax
    mov word[es:di+1450],ax
    mov word[es:di+1452],ax
    mov word[es:di+1462],ax
    mov word[es:di+1464],ax
    popa
    ret

print_E1_intro:
    pusha
    mov ah,0x0F
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,650
    mov word[es:di+650],ax
    mov word[es:di+652],ax
    mov word[es:di+654],ax
    mov word[es:di+656],ax
    mov word[es:di+658],ax
    mov word[es:di+660],ax
    mov word[es:di+810],ax
    mov word[es:di+812],ax
    mov word[es:di+970],ax
    mov word[es:di+972],ax
    mov word[es:di+1130],ax
    mov word[es:di+1132],ax
    mov word[es:di+1134],ax
    mov word[es:di+1136],ax
    mov word[es:di+1138],ax
    mov word[es:di+1140],ax
    mov word[es:di+1290],ax
    mov word[es:di+1292],ax
    mov word[es:di+1450],ax
    mov word[es:di+1452],ax
    mov word[es:di+1454],ax
    mov word[es:di+1456],ax
    mov word[es:di+1458],ax
    mov word[es:di+1460],ax
    popa
    ret

print_A_1_intro:
    pusha
    mov ah,0x0F
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,664
    mov word[es:di+652],ax
    mov word[es:di+654],ax
    mov word[es:di+656],ax
    mov word[es:di+658],ax
    mov word[es:di+660],ax
    mov word[es:di+662],ax
    mov word[es:di+810],ax
    mov word[es:di+812],ax
    mov word[es:di+822],ax
    mov word[es:di+824],ax
    mov word[es:di+970],ax
    mov word[es:di+972],ax
    mov word[es:di+982],ax
    mov word[es:di+984],ax
    mov word[es:di+1130],ax
    mov word[es:di+1132],ax
    mov word[es:di+1134],ax
    mov word[es:di+1136],ax
    mov word[es:di+1138],ax
    mov word[es:di+1140],ax
    mov word[es:di+1142],ax
    mov word[es:di+1144],ax
    mov word[es:di+1290],ax
    mov word[es:di+1292],ax
    mov word[es:di+1302],ax
    mov word[es:di+1304],ax
    mov word[es:di+1450],ax
    mov word[es:di+1452],ax
    mov word[es:di+1462],ax
    mov word[es:di+1464],ax
    popa
    ret

print_T_intro:
    pusha
    mov ah,0x0F
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,688
    mov word[es:di+650],ax
    mov word[es:di+652],ax
    mov word[es:di+650-4],ax
    mov word[es:di+652-4],ax
    mov word[es:di+652-8],ax
    mov word[es:di+650+4],ax
    mov word[es:di+652+4],ax
    mov word[es:di+652+6],ax
    mov word[es:di+810],ax
    mov word[es:di+812],ax
    mov word[es:di+970],ax
    mov word[es:di+972],ax
    mov word[es:di+1130],ax
    mov word[es:di+1132],ax
    mov word[es:di+1290],ax
    mov word[es:di+1292],ax
    mov word[es:di+1450],ax
    mov word[es:di+1452],ax
    popa
    ret

DEVELOPER_INTRO:
    pusha
    mov ax,0xb800
    mov es,ax
    mov si,0
    mov di,2724;row 17,col2
    mov ah,0x0F
INTRO_LOOP:
    mov al,[DEVELOPER_TAG+si]
    mov word[es:di],ax
    add di,2
    add si,1 ;move next char per
    cmp byte[DEVELOPER_TAG+si],0
    jne INTRO_LOOP
    
    mov si,0
    mov di,3044;row19,col2
    mov ah,0x0F
INTRO_LOOP_2:
    mov al,[DEVELOPER_NAME+si]
    mov word[es:di],ax
    add di,2
    add si,1
    cmp byte[DEVELOPER_NAME+si],0
    jne INTRO_LOOP_2
    
    mov si,0
    mov di,3740
    mov ah,0x0F
INTRO_INSTR_LOOP:
    mov al,[FORWAR_INSTRUCTION+si]
    mov word[es:di],ax
    add di,2
    add si,1
    cmp byte[FORWAR_INSTRUCTION+si],0
    jne INTRO_INSTR_LOOP
    popa
    ret

showIntroScreen:
    push ax
    push bx
    push dx
    push si
    push di
    push es
    
    call clearScreen
    call print_H1
    call print_I
    call print_G
    call print_H2
    call print_W
    call print_A_intro
    call print_Y
    call print_H3
    call print_E1_intro
    call print_A_1_intro
    call print_T_intro
    call DEVELOPER_INTRO
    
waitForI:
    mov ah, 0
    int 0x16
    cmp al, 'i'
    je showInstructions
    cmp al, 'I'
    je showInstructions
    jmp waitForI
	


showInstructions:
    call clearScreen
	
	    mov ax, 0xB800
    mov es, ax
    mov si, titleLine1
    mov dh, 0
    mov dl, 15
    mov bl, 0x09  ; Bright white
    call printString
    
    mov si, titleLine2
    mov dh, 1;row
    mov dl, 15;col
    mov bl, 0x09
    call printString
    
    mov si, titleLine3
    mov dh, 2
    mov dl, 15
    mov bl, 0x05
    call printString
    
    mov si, controls2
    mov dh, 6
    mov dl, 27
    mov bl, 0x0E
    call printString
    
    mov si, controls3
    mov dh, 7
    mov dl, 32
    mov bl, 0x0E
    call printString
    
    mov si, controls4
    mov dh, 9
    mov dl, 20
    mov bl, 0x0F
    call printString
    
    mov si, controls5
    mov dh, 11
    mov dl, 22
    mov bl, 0x0A
    call printString
    
    mov si, controls6
    mov dh, 13
    mov dl, 20
    mov bl, 0x0F
    call printString
    
    mov si, controls7
    mov dh, 15
    mov dl, 20
    mov bl, 0x06
    call printString
    
    mov si, controls8
    mov dh, 17
    mov dl, 19
    mov bl, 0x0F
    call printString
    
    mov si, controls9
    mov dh, 19
    mov dl, 18
    mov bl, 0x0B
    call printString
    
    mov si, controls10
    mov dh, 21
    mov dl, 20
    mov bl, 0x0E
    call printString
    
    mov si, pressAnyKey
    mov dh, 23
    mov dl, 65
    mov bl, 0x0E
    call printString
    
    mov ah, 0
    int 0x16
    
    pop es
    pop di
    pop si
    pop dx
    pop bx
    pop ax
    ret

print_C_congrats:
    pusha
    mov ah,0x0B
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,-322
    mov word[es:di+492],ax
    mov word[es:di+494],ax
    mov word[es:di+496],ax
    mov word[es:di+498],ax
    mov word[es:di+500],ax
    mov word[es:di+650],ax
    mov word[es:di+652],ax
    mov word[es:di+662],ax
    mov word[es:di+664],ax
    mov word[es:di+810],ax
    mov word[es:di+812],ax
    mov word[es:di+970],ax
    mov word[es:di+972],ax
    mov word[es:di+1132],ax
    mov word[es:di+1130],ax
    mov word[es:di+1142],ax
    mov word[es:di+1144],ax
    mov word[es:di+1294],ax
    mov word[es:di+1296],ax
    mov word[es:di+1298],ax
    mov word[es:di+1300],ax
    popa
    ret

print_O_congrats:
    pusha
    mov ah,0x0B
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,-464
    mov word[es:di+494+160],ax
    mov word[es:di+496+160],ax
    mov word[es:di+498+160],ax
    mov word[es:di+500+160],ax
    mov word[es:di+810],ax
    mov word[es:di+812],ax
    mov word[es:di+822],ax
    mov word[es:di+824],ax
    mov word[es:di+970],ax
    mov word[es:di+972],ax
    mov word[es:di+982],ax
    mov word[es:di+984],ax
    mov word[es:di+1130],ax
    mov word[es:di+1132],ax
    mov word[es:di+1142],ax
    mov word[es:di+1144],ax
    mov word[es:di+1290],ax
    mov word[es:di+1292],ax
    mov word[es:di+1302],ax
    mov word[es:di+1304],ax
    mov word[es:di+1614-160],ax
    mov word[es:di+1616-160],ax
    mov word[es:di+1618-160],ax
    mov word[es:di+1620-160],ax
    popa
    ret

PRINT_N_congrats:
    pusha
    mov ah,0x0B
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,-444
    mov word[es:di+648],ax
    mov word[es:di+650],ax
    mov word[es:di+652],ax
    mov word[es:di+652+160],ax
    mov word[es:di+654+160],ax
    mov word[es:di+656+320],ax
    mov word[es:di+664],ax
    mov word[es:di+666],ax
    mov word[es:di+808],ax
    mov word[es:di+810],ax
    mov word[es:di+824],ax
    mov word[es:di+826],ax
    mov word[es:di+968],ax
    mov word[es:di+970],ax
    mov word[es:di+984],ax
    mov word[es:di+986],ax
    mov word[es:di+1128],ax
    mov word[es:di+1130],ax
    mov word[es:di+1138],ax
    mov word[es:di+1144],ax
    mov word[es:di+1146],ax
    mov word[es:di+1288],ax
    mov word[es:di+1290],ax
    mov word[es:di+1300],ax
    mov word[es:di+1304],ax
    mov word[es:di+1306],ax
    mov word[es:di+1448],ax
    mov word[es:di+1450],ax
    mov word[es:di+1462],ax
    mov word[es:di+1464],ax
    mov word[es:di+1466],ax
    popa
    ret

print_G_congrats:
    pusha
    mov ah,0x0B
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,-264
    mov word[es:di+492],ax
    mov word[es:di+494],ax
    mov word[es:di+496],ax
    mov word[es:di+498],ax
    mov word[es:di+500],ax
    mov word[es:di+650],ax
    mov word[es:di+652],ax
    mov word[es:di+662],ax
    mov word[es:di+664],ax
    mov word[es:di+810],ax
    mov word[es:di+812],ax
    mov word[es:di+970],ax
    mov word[es:di+972],ax
    mov word[es:di+984],ax
    mov word[es:di+982],ax
    mov word[es:di+980],ax
    mov word[es:di+978],ax
    mov word[es:di+1132],ax
    mov word[es:di+1130],ax
    mov word[es:di+1142],ax
    mov word[es:di+1144],ax
    mov word[es:di+1294],ax
    mov word[es:di+1296],ax
    mov word[es:di+1298],ax
    mov word[es:di+1300],ax
    popa
    ret

PRINT_R_congrats:
    pusha
    mov ah,0x0B
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,-406
    mov word[es:di+492+160],0x0BDC
    mov word[es:di+494+160],ax
    mov word[es:di+496+160],ax
    mov word[es:di+498+160],ax
    mov word[es:di+500+160],ax
    mov word[es:di+662],0x0BDC
    mov word[es:di+812],ax
    mov word[es:di+822],ax
    mov word[es:di+972],ax
    mov word[es:di+982],ax
    mov word[es:di+1132],ax
    mov word[es:di+1134],ax
    mov word[es:di+1136],ax
    mov word[es:di+1138],ax
    mov word[es:di+1140],ax
    mov word[es:di+1142],0x0BDF
    mov word[es:di+1292],ax
    mov word[es:di+1296],0x0BDF
    mov word[es:di+1298],0x0BDC
    mov word[es:di+1452],ax
    mov word[es:di+1460],0x0BDF
    mov word[es:di+1462],0x0BDC
    popa
    ret

print_A_congrats:
    pusha
    mov ah,0x0B
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,-390
    mov word[es:di+652],ax
    mov word[es:di+654],ax
    mov word[es:di+656],ax
    mov word[es:di+658],ax
    mov word[es:di+660],ax
    mov word[es:di+662],ax
    mov word[es:di+810],ax
    mov word[es:di+812],ax
    mov word[es:di+822],ax
    mov word[es:di+824],ax
    mov word[es:di+970],ax
    mov word[es:di+972],ax
    mov word[es:di+982],ax
    mov word[es:di+984],ax
    mov word[es:di+1130],ax
    mov word[es:di+1132],ax
    mov word[es:di+1134],ax
    mov word[es:di+1136],ax
    mov word[es:di+1138],ax
    mov word[es:di+1140],ax
    mov word[es:di+1142],ax
    mov word[es:di+1144],ax
    mov word[es:di+1290],ax
    mov word[es:di+1292],ax
    mov word[es:di+1302],ax
    mov word[es:di+1304],ax
    mov word[es:di+1450],ax
    mov word[es:di+1452],ax
    mov word[es:di+1462],ax
    mov word[es:di+1464],ax
    popa
    ret

print_T_congrats:
    pusha
    mov ah,0x0B
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,-366
    mov word[es:di+650],ax
    mov word[es:di+652],ax
    mov word[es:di+650-4],ax
    mov word[es:di+652-4],ax
    mov word[es:di+652-8],ax
    mov word[es:di+650+4],ax
    mov word[es:di+652+4],ax
    mov word[es:di+652+6],ax
    mov word[es:di+810],ax
    mov word[es:di+812],ax
    mov word[es:di+970],ax
    mov word[es:di+972],ax
    mov word[es:di+1130],ax
    mov word[es:di+1132],ax
    mov word[es:di+1290],ax
    mov word[es:di+1292],ax
    mov word[es:di+1450],ax
    mov word[es:di+1452],ax
    popa
    ret

PRINT_S_congrats:
    pusha
    mov ah,0x0B
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,-196
    mov word[es:di+492],0x0BDC
    mov word[es:di+494],ax
    mov word[es:di+496],ax
    mov word[es:di+498],0x0BDC
    mov word[es:di+500+160],0x0BDF
    mov word[es:di+650],ax
    mov word[es:di+652],ax
    mov word[es:di+972-160],0x0BDF
    mov word[es:di+976-160],0x0BDC
    mov word[es:di+974-160],ax
    mov word[es:di+818+160],0x0BDF
    mov word[es:di+820+160],ax
    mov word[es:di+822+160],0x0BDC
    mov word[es:di+1142-2],0x0BDB
    mov word[es:di+1142],0x0BDF
    mov word[es:di+1292],0x0BDF
    mov word[es:di+1294],ax
    mov word[es:di+1296],ax
    mov word[es:di+1298],0x0BDF
    mov word[es:di+1290-160],0x0BDC
    popa
    ret

print_I_congrats:
    pusha
    mov ah,0x0F
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,-340
    mov word[es:di+650],ax
    mov word[es:di+652],ax
    mov word[es:di+810],ax
    mov word[es:di+812],ax
    mov word[es:di+970],ax
    mov word[es:di+972],ax
    mov word[es:di+1130],ax
    mov word[es:di+1132],ax
    mov word[es:di+1450],ax
    mov word[es:di+1452],ax
    popa
    ret

CONGRATS_INTRO:
    pusha
    mov ax,0xb800
    mov es,ax
    
    mov si,0
    mov di,2562
    mov ah,0x0F
CONGRATS_SCORE_LBL:
    mov al,[SCORE_MSG+si]
    mov word[es:di],ax
    add di,2
    add si,1
    cmp byte[SCORE_MSG+si],0
    jne CONGRATS_SCORE_LBL
    
    mov ax, [cs:score]
    call printNumberAtDI
    
    mov si,0
    mov di,2882
    mov ah,0x0F
CONGRATS_INSTR1:
    mov al,[MID_SCREEN_INSTRUCTIONS_1+si]
    mov word[es:di],ax
    add di,2
    add si,1
    cmp byte[MID_SCREEN_INSTRUCTIONS_1+si],0
    jne CONGRATS_INSTR1
    
    mov si,0
    mov di,3042
    mov ah,0x0F
CONGRATS_INSTR2:
    mov al,[MID_SCREEN_INSTRUCTIONS_2+si]
    mov word[es:di],ax
    add di,2
    add si,1
    cmp byte[MID_SCREEN_INSTRUCTIONS_2+si],0
    jne CONGRATS_INSTR2
    
    mov si,0
    mov di,1670
    mov ah,0x0F
CONGRATS_LEVEL:
    mov al,[LEVEL_COMPLETION_MSG_1+si]
    mov word[es:di],ax
    add di,2
    add si,1
    cmp byte[LEVEL_COMPLETION_MSG_1+si],0
    jne CONGRATS_LEVEL
    
    mov ah,0x0F
    mov ax, [cs:currentLevel]
    add al,0x30
    mov word[es:di],ax
    add di,2
    
    mov si,0
    mov ah,0x0F
CONGRATS_COMP:
    mov al,[LEVEL_COMPLETION_MSG_2+si]
    mov word[es:di],ax
    add di,2
    add si,1
    cmp byte[LEVEL_COMPLETION_MSG_2+si],0
    jne CONGRATS_COMP
    
    cmp byte [cs:newRecord], 1
    jne skipNewRecord
    
    mov si,0
    mov di,2080
    mov ah,0x0E
CONGRATS_RECORD:
    mov al,[newRecordMsg+si]
    mov word[es:di],ax
    add di,2
    add si,1
    cmp byte[newRecordMsg+si],0
    jne CONGRATS_RECORD
    
skipNewRecord:
    popa
    ret

showLevelCompleteScreen:
    push ax
    push bx
    push cx
    push dx
    push di
    push si
    push es
    
    call clearScreen
    call print_C_congrats
    call print_O_congrats
    call PRINT_N_congrats
    call print_G_congrats
    call PRINT_R_congrats
    call print_A_congrats
    call print_T_congrats
    call PRINT_S_congrats
    call print_I_congrats
    call CONGRATS_INTRO
    call playLevelCompleteSound
    
    pop es
    pop si
    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    ret

print_C_gameover:
    pusha
    mov ah,0x0C
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,-330
    mov word[es:di+494],ax
    mov word[es:di+496],ax
    mov word[es:di+498],ax
    mov word[es:di+500],ax
    mov word[es:di+652],ax
    mov word[es:di+662],ax
    mov word[es:di+664],ax
    mov word[es:di+812],ax
    mov word[es:di+972],ax
    mov word[es:di+1132],ax
    mov word[es:di+1142],ax
    mov word[es:di+1144],ax
    mov word[es:di+1294],ax
    mov word[es:di+1296],ax
    mov word[es:di+1298],ax
    mov word[es:di+1300],ax
    popa
    ret

print_A_gameover:
    pusha
    mov ah,0x0C
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,-474
    mov word[es:di+654],ax
    mov word[es:di+656],ax
    mov word[es:di+658],ax
    mov word[es:di+660],ax
    mov word[es:di+812],ax
    mov word[es:di+822],ax
    mov word[es:di+972],ax
    mov word[es:di+982],ax
    mov word[es:di+1132],ax
    mov word[es:di+1134],ax
    mov word[es:di+1136],ax
    mov word[es:di+1138],ax
    mov word[es:di+1140],ax
    mov word[es:di+1142],ax
    mov word[es:di+1292],ax
    mov word[es:di+1302],ax
    mov word[es:di+1452],ax
    mov word[es:di+1462],ax
    popa
    ret

PRINT_R_gameover:
    pusha
    mov ah,0x0C
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,-460
    mov word[es:di+492+160],0x0CDC
    mov word[es:di+494+160],ax
    mov word[es:di+496+160],ax
    mov word[es:di+498+160],ax
    mov word[es:di+500+160],ax
    mov word[es:di+662],0x0CDC
    mov word[es:di+812],ax
    mov word[es:di+822],ax
    mov word[es:di+972],ax
    mov word[es:di+982],ax
    mov word[es:di+1132],ax
    mov word[es:di+1134],ax
    mov word[es:di+1136],ax
    mov word[es:di+1138],ax
    mov word[es:di+1140],ax
    mov word[es:di+1142],0x0CDF
    mov word[es:di+1292],ax
    mov word[es:di+1296],0x0CDF
    mov word[es:di+1298],0x0CDC
    mov word[es:di+1452],ax
    mov word[es:di+1460],0x0CDF
    mov word[es:di+1462],0x0CDC
    popa
    ret

print_C_1_gameover:
    pusha
    mov ah,0x0C
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,-278
    mov word[es:di+494],ax
    mov word[es:di+496],ax
    mov word[es:di+498],ax
    mov word[es:di+500],ax
    mov word[es:di+652],ax
    mov word[es:di+662],ax
    mov word[es:di+664],ax
    mov word[es:di+812],ax
    mov word[es:di+972],ax
    mov word[es:di+1132],ax
    mov word[es:di+1142],ax
    mov word[es:di+1144],ax
    mov word[es:di+1294],ax
    mov word[es:di+1296],ax
    mov word[es:di+1298],ax
    mov word[es:di+1300],ax
    popa
    ret

PRINT_R_1_gameover:
    pusha
    mov ah,0x0C
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,-422
    mov word[es:di+492+160],0x0CDC
    mov word[es:di+494+160],ax
    mov word[es:di+496+160],ax
    mov word[es:di+498+160],ax
    mov word[es:di+500+160],ax
    mov word[es:di+662],0x0CDC
    mov word[es:di+812],ax
    mov word[es:di+822],ax
    mov word[es:di+972],ax
    mov word[es:di+982],ax
    mov word[es:di+1132],ax
    mov word[es:di+1134],ax
    mov word[es:di+1136],ax
    mov word[es:di+1138],ax
    mov word[es:di+1140],ax
    mov word[es:di+1142],0x0CDF
    mov word[es:di+1292],ax
    mov word[es:di+1296],0x0CDF
    mov word[es:di+1298],0x0CDC
    mov word[es:di+1452],ax
    mov word[es:di+1460],0x0CDF
    mov word[es:di+1462],0x0CDC
    popa
    ret

print_A_2_gameover:
    pusha
    mov ah,0x0C
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,-408
    mov word[es:di+654],ax
    mov word[es:di+656],ax
    mov word[es:di+658],ax
    mov word[es:di+660],ax
    mov word[es:di+812],ax
    mov word[es:di+822],ax
    mov word[es:di+972],ax
    mov word[es:di+982],ax
    mov word[es:di+1132],ax
    mov word[es:di+1134],ax
    mov word[es:di+1136],ax
    mov word[es:di+1138],ax
    mov word[es:di+1140],ax
    mov word[es:di+1142],ax
    mov word[es:di+1292],ax
    mov word[es:di+1302],ax
    mov word[es:di+1452],ax
    mov word[es:di+1462],ax
    popa
    ret

PRINT_S_gameover:
    pusha
    mov ah,0x0C
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,-232
    mov word[es:di+492],0x0CDC
    mov word[es:di+494],ax
    mov word[es:di+496],ax
    mov word[es:di+498],0x0CDC
    mov word[es:di+500+160],0x0CDF
    mov word[es:di+650],ax
    mov word[es:di+652],ax
    mov word[es:di+972-160],0x0CDF
    mov word[es:di+976-160],0x0CDC
    mov word[es:di+974-160],ax
    mov word[es:di+818+160],0x0CDF
    mov word[es:di+820+160],ax
    mov word[es:di+822+160],0x0CDC
    mov word[es:di+1142-2],0x0CDB
    mov word[es:di+1142],0x0CDF
    mov word[es:di+1292],0x0CDF
    mov word[es:di+1294],ax
    mov word[es:di+1296],ax
    mov word[es:di+1298],0x0CDF
    mov word[es:di+1290-160],0x0CDC
    popa
    ret

print_H1_gameover:
    pusha
    mov ah,0x0C
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,-378
    mov word[es:di+652],ax
    mov word[es:di+662],ax
    mov word[es:di+812],ax
    mov word[es:di+822],ax
    mov word[es:di+972],ax
    mov word[es:di+974],ax
    mov word[es:di+976],ax
    mov word[es:di+978],ax
    mov word[es:di+980],ax
    mov word[es:di+982],ax
    mov word[es:di+1132],ax
    mov word[es:di+1142],ax
    mov word[es:di+1292],ax
    mov word[es:di+1302],ax
    mov word[es:di+1452],ax
    mov word[es:di+1462],ax
    popa
    ret

print_E1_gameover:
    pusha
    mov ah,0x0C
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,-362
    mov word[es:di+650],ax
    mov word[es:di+652],ax
    mov word[es:di+654],ax
    mov word[es:di+656],ax
    mov word[es:di+658],ax
    mov word[es:di+660],ax
    mov word[es:di+810],ax
    mov word[es:di+812],ax
    mov word[es:di+970],ax
    mov word[es:di+972],ax
    mov word[es:di+1130],ax
    mov word[es:di+1132],ax
    mov word[es:di+1134],ax
    mov word[es:di+1136],ax
    mov word[es:di+1138],ax
    mov word[es:di+1140],ax
    mov word[es:di+1290],ax
    mov word[es:di+1292],ax
    mov word[es:di+1450],ax
    mov word[es:di+1452],ax
    mov word[es:di+1454],ax
    mov word[es:di+1456],ax
    mov word[es:di+1458],ax
    mov word[es:di+1460],ax
    popa
    ret

print_O_gameover:
    pusha
    mov ah,0x0C
    mov al,0xDB
    mov si,0xb800
    mov es,si
    mov di,-348
    mov word[es:di+494+160-4],ax
    mov word[es:di+494+160-2],ax
    mov word[es:di+494+160],ax
    mov word[es:di+496+160],ax
    mov word[es:di+498+160],ax
    mov word[es:di+500+160],ax
    mov word[es:di+810],ax
    mov word[es:di+812],ax
    mov word[es:di+822],ax
    mov word[es:di+970],ax
    mov word[es:di+972],ax
    mov word[es:di+982],ax
    mov word[es:di+984],ax
    mov word[es:di+1130],ax
    mov word[es:di+1132],ax
    mov word[es:di+1142],ax
    mov word[es:di+1144],ax
    mov word[es:di+1290],ax
    mov word[es:di+1292],ax
    mov word[es:di+1302],ax
    mov word[es:di+1614-160-4],ax
    mov word[es:di+1614-160-2],ax
    mov word[es:di+1614-160],ax
    mov word[es:di+1616-160],ax
    mov word[es:di+1618-160],ax
    mov word[es:di+1620-160],ax
    popa
    ret

GAMEOVER_INTRO:
    pusha
    mov ax,0xb800
    mov es,ax
    
    cmp byte [cs:gameOver], 4
    je showAllLevelsComplete
    
    ; Regular Game Over
    mov si,0
    mov di,1676
    mov ah,0x0C
GAMEOVER_MSG_LOOP:
    mov al,[GAME_OVER_MSG+si]
    mov word[es:di],ax
    add di,2
    add si,1
    cmp byte[GAME_OVER_MSG+si],0
    jne GAMEOVER_MSG_LOOP
    jmp continueGameOver
    
showAllLevelsComplete:
    ; All Levels Complete Message
    mov si,0
    mov di,1640
    mov ah,0x0E
ALL_COMPLETE_LOOP:
    mov al,[ALL_LEVELS_COMPLETE_MSG+si]
    mov word[es:di],ax
    add di,2
    add si,1
    cmp byte[ALL_LEVELS_COMPLETE_MSG+si],0
    jne ALL_COMPLETE_LOOP
    
    ; Champion Message
    mov si,0
    mov di,1812
    mov ah,0x0E
CHAMPION_LOOP:
    mov al,[CHAMPION_MSG+si]
    mov word[es:di],ax
    add di,2
    add si,1
    cmp byte[CHAMPION_MSG+si],0
    jne CHAMPION_LOOP
    
continueGameOver:
    ; Show Final Score
    mov si,0
    mov di,2242  
    mov ah,0x0F
GAMEOVER_FINAL_SCORE:
    mov al,[finalScore+si]
    mov word[es:di],ax
    add di,2
    add si,1
    cmp byte[finalScore+si],0
    jne GAMEOVER_FINAL_SCORE
    
    mov ax, [cs:score]
    call printNumberAtDI
    
    ; Show High Score
    mov si,0
    mov di,2402  
    mov ah,0x0E
GAMEOVER_HIGH_SCORE_LBL:
    mov al,[highScoreLabel+si]
    mov word[es:di],ax
    add di,2
    add si,1
    cmp byte[highScoreLabel+si],0
    jne GAMEOVER_HIGH_SCORE_LBL
    
    mov ax, [cs:highScore]
    call printNumberAtDI
    
    ; Check if new record
    cmp byte [cs:newRecord], 1
    jne skipNewRecordEnd
    
    mov si,0
    mov di,2562
    mov ah,0x0E
GAMEOVER_NEW_RECORD:
    mov al,[newRecordMsg+si]
    mov word[es:di],ax
    add di,2
    add si,1
    cmp byte[newRecordMsg+si],0
    jne GAMEOVER_NEW_RECORD
    
skipNewRecordEnd:
    
    ; Instructions
    mov si,0
    mov di,2882
    mov ah,0x0F
GAMEOVER_INSTR1:
    mov al,[END_SCREEN_INSTRUCTIONS_1+si]
    mov word[es:di],ax
    add di,2
    add si,1
    cmp byte[END_SCREEN_INSTRUCTIONS_1+si],0
    jne GAMEOVER_INSTR1
    
    mov si,0
    mov di,3042
    mov ah,0x0F
GAMEOVER_INSTR2:
    mov al,[END_SCREEN_INSTRUCTIONS_2+si]
    mov word[es:di],ax
    add di,2
    add si,1
    cmp byte[END_SCREEN_INSTRUCTIONS_2+si],0
    jne GAMEOVER_INSTR2
    
    popa
    ret

showEndScreen:
    push ax
    push bx
    push cx
    push dx
    push di
    push si
    push es
    
    call clearScreen
    call print_C_gameover
    call print_A_gameover
    call PRINT_R_gameover
    call print_C_1_gameover
    call PRINT_R_1_gameover
    call print_A_2_gameover
    call PRINT_S_gameover
    call print_H1_gameover
    call print_E1_gameover
    call print_O_gameover
    call GAMEOVER_INTRO
    
    pop es
    pop si
    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    ret
showFreeTrialEndScreen:
    push ax
    push bx
    push cx
    push dx
    push di
    push si
    push es
    
    call clearScreen
    
    mov ax, 0xB800
    mov es, ax
	call print_C_congrats
    call print_O_congrats
    call PRINT_N_congrats
    call print_G_congrats
    call PRINT_R_congrats
    call print_A_congrats
    call print_T_congrats
    call PRINT_S_congrats
    call print_I_congrats
    call CONGRATS_INTRO


    ; Message 1: FREE TRIAL COMPLETED
    mov si, FREE_TRIAL_MSG_1
    mov dh, 10
    mov dl, 30
    mov bl, 0x0E
    call printString
    
    ; Message 2: You have completed
    mov si, FREE_TRIAL_MSG_2
    mov dh, 12
    mov dl, 21
    mov bl, 0x0F
    call printString
    
    ; Message 3: Unlock premium
    mov si, FREE_TRIAL_MSG_3
    mov dh, 13
    mov dl, 20
    mov bl, 0x0A
    call printString
    
    ; Show final score
    mov si, finalScore
    mov dh, 15
    mov dl, 33
    mov bl, 0x0F
    call printString
    
    mov di, (15 * 160) + (47 * 2)
    mov ax, [cs:score]
    call printNumber
    
    ; Show high score
    mov si, highScoreLabel
    mov dh, 16
    mov dl, 33
    mov bl, 0x0E
    call printString
    
    mov di, (16 * 160) + (39 * 2)
    mov ax, [cs:highScore]
    call printNumber
    
    ; Instructions
    mov si, FREE_TRIAL_MSG_4
    mov dh, 18
    mov dl, 23
    mov bl, 0x0F
    call printString
    
    mov si, FREE_TRIAL_MSG_5
    mov dh, 19
    mov dl, 32
    mov bl, 0x0F
    call printString
    
    pop es
    pop si
    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    ret
;LEVEL COMPLETE SOUND 
playLevelCompleteSound:
    push ax
    push bx
    push cx
    push dx
    
    in al, 61h
    and al, 11111100b
    out 61h, al
    
    mov al, 182
    out 43h, al
    
    
    mov ax, 1193
    out 42h, al
    mov al, ah
    out 42h, al
    
    in al, 61h
    or al, 00000011b
    out 61h, al
    
    mov cx, 0x2FFF
victory1:
    loop victory1
    
    in al, 61h
    and al, 11111100b
    out 61h, al
    mov cx, 0x0FFF
pause1:
    loop pause1
    
    mov ax, 946
    out 42h, al
    mov al, ah
    out 42h, al
    
    in al, 61h
    or al, 00000011b
    out 61h, al
    
    mov cx, 0x2FFF
victory2:
    loop victory2
    
    in al, 61h
    and al, 11111100b
    out 61h, al
    mov cx, 0x0FFF
pause2:
    loop pause2
    
    
    mov ax, 796
    out 42h, al
    mov al, ah
    out 42h, al
    
    in al, 61h
    or al, 00000011b
    out 61h, al
    
    mov cx, 0x2FFF
victory3:
    loop victory3
    
    in al, 61h
    and al, 11111100b
    out 61h, al
    mov cx, 0x1FFF
pause3:
    loop pause3
    
    mov ax, 597
    out 42h, al
    mov al, ah
    out 42h, al
    
    in al, 61h
    or al, 00000011b
    out 61h, al
    
    mov cx, 0xFFFF
victory4:
    loop victory4
    
    ; Turn off speaker
    in al, 61h
    and al, 11111100b
    out 61h, al
    
    pop dx
    pop cx
    pop bx
    pop ax
    ret
playBackgroundMusic:
    push ax
    push bx
    push cx
    push dx
	
	cmp byte [cs:pauseGame], 1
    je skipBgMusic
    cmp byte [cs:gameOver], 0
    jne skipBgMusic
    
    ; Play music every 6 ticks for smooth tempo
    mov ax, [cs:tickCount]
    and ax, 0x0005;music plays at 6 ticks
    cmp ax, 0
    jne skipBgMusic
    
    ; Get current note
    mov bx, [cs:musicNoteIndex]
    
    ; Configure speaker
    mov al, 182
    out 43h, al
    
    ; Get frequency from smooth melody
    shl bx, 1
    mov ax, [cs:smoothRacingMelody + bx]
    
    ; Check for end of sequence
    cmp ax, 0
    jne continueMusic
    
    ; Loop back to start
    mov word [cs:musicNoteIndex], 0
    mov ax, [cs:smoothRacingMelody]
    
continueMusic:
    ; Set frequency
    out 42h, al
    mov al, ah
    out 42h, al
    
    ; Turn speaker on gently
    in al, 61h
    or al, 00000011b
    out 61h, al
    
    ; Next note
    inc word [cs:musicNoteIndex]
    
skipBgMusic:
    pop dx
    pop cx
    pop bx
    pop ax
    ret

smoothRacingMelody:
    dw 2025  ; C - Low and smooth
    dw 2025  ; Hold C
    dw 1805  ; D
    dw 1805  ; Hold D
    dw 1607  ; E
    dw 1607  ; Hold E
    dw 1517  ; F
    dw 1432  ; F#
    dw 1607  ; E
    dw 1607  ; Hold E
    dw 1805  ; D
    dw 1805  ; Hold D
    dw 2025  ; C
    dw 2025  ; Hold C
    dw 1805  ; D
    dw 1703  ; D#
    dw 1607  ; E
    dw 1607  ; Hold E
    dw 1517  ; F
    dw 1517  ; Hold F
    dw 1432  ; F#
    dw 1351  ; G
    dw 1275  ; G#
    dw 1275  ; Hold G#
    dw 1351  ; G
    dw 1432  ; F#
    dw 1517  ; F
    dw 1607  ; E
    dw 1805  ; D
    dw 2025  ; C
    dw 2025  ; Hold C
    dw 2273  ; B (lower octave)
    dw 0     ; End - restart

playCrashSound:
    push ax
    push bx
    push cx
    push dx
    
    ; Silence background music first
    in al, 61h
    and al, 11111100b
    out 61h, al
    
    ; Configure speaker
    mov al, 182
    out 43h, al
    
    
    ; Sharp impact (very high frequency)
    mov ax, 200
    out 42h, al
    mov al, ah
    out 42h, al
    
    in al, 61h
    or al, 00000011b
    out 61h, al
    
    mov cx, 0x1FFF
crash1:
    loop crash1
    
    ; Rapid descent (scraping sound)
    mov ax, 400
    out 42h, al
    mov al, ah
    out 42h, al
    
    mov cx, 0x0FFF
crash2:
    loop crash2
    
    mov ax, 700
    out 42h, al
    mov al, ah
    out 42h, al
    
    mov cx, 0x0FFF
crash3:
    loop crash3
    
    mov ax, 1100
    out 42h, al
    mov al, ah
    out 42h, al
    
    mov cx, 0x1FFF
crash4:
    loop crash4
    
    ; Low rumble (aftermath)
    mov ax, 1800
    out 42h, al
    mov al, ah
    out 42h, al
    
    mov cx, 0x3FFF
crash5:
    loop crash5
    
    ; Turn off speaker
    in al, 61h
    and al, 11111100b
    out 61h, al
    
    pop dx
    pop cx
    pop bx
    pop ax
    ret
	
playBonusSound:
    push ax
    push bx
    push cx
    push dx
    
    ; Don't play if game is paused or over
    cmp byte [cs:pauseGame], 1
    je skipBonusSound
    cmp byte [cs:gameOver], 0
    jne skipBonusSound
    
    ; Configure speaker
    mov al, 182
    out 43h, al
    
    ; Quick ascending beep 
    mov ax, 473
    out 42h, al
    mov al, ah
    out 42h, al
    
    in al, 61h
    or al, 00000011b
    out 61h, al
    
    mov cx, 0x1FFF
bonus1:
    loop bonus1
    
    mov ax, 355
    out 42h, al
    mov al, ah
    out 42h, al
    
    mov cx, 0x3FFF
bonus2:
    loop bonus2
    
    ; Turn off speaker
    in al, 61h
    and al, 11111100b
    out 61h, al
    
skipBonusSound:
    pop dx
    pop cx
    pop bx
    pop ax
    ret

playPauseSound:
    push ax
    push bx
    push cx
    push dx
    
    ; Configure speaker
    mov al, 182
    out 43h, al
    
    ; Two-tone pause sound
    mov ax, 800
    out 42h, al
    mov al, ah
    out 42h, al
    
    in al, 61h
    or al, 00000011b
    out 61h, al
    
    mov cx, 0x2FFF
pauseSound1:
    loop pauseSound1
    
    ; Lower tone
    mov ax, 1200
    out 42h, al
    mov al, ah
    out 42h, al
    
    mov cx, 0x2FFF
pauseSound2:
    loop pauseSound2
    
    ; Turn off speaker
    in al, 61h
    and al, 11111100b
    out 61h, al
    
    pop dx
    pop cx
    pop bx
    pop ax
    ret

playResumeSound:
    push ax
    push bx
    push cx
    push dx
    
    ; Configure speaker
    mov al, 182
    out 43h, al
    
    ; Quick ascending beep
    mov ax, 1200
    out 42h, al
    mov al, ah
    out 42h, al
    
    in al, 61h
    or al, 00000011b
    out 61h, al
    
    mov cx, 0x1FFF
resume1:
    loop resume1
    
    mov ax, 800
    out 42h, al
    mov al, ah
    out 42h, al
    
    mov cx, 0x2FFF
resume2:
    loop resume2
    
    ; Turn off speaker
    in al, 61h
    and al, 11111100b
    out 61h, al
    
    pop dx
    pop cx
    pop bx
    pop ax
    ret

stopAllSounds:
    push ax
    
    ; Turn off speaker immediately
    in al, 61h
    and al, 11111100b
    out 61h, al
    
    pop ax
    ret
MoveScreen:
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    push ds
    push es
    
    call eraseAllObstacles
    
    mov ax, 0xB800
    mov ds, ax
    push cs
    pop es
    mov si, 23 * 160
    mov di, tempBuffer
    mov cx, 80
    rep movsw
    
    mov ax, 0xB800
    mov es, ax
    mov ds, ax
    
    mov bx, 23
    
scrollRowLoop:
    cmp bx, 1
    jle scrollDone
    
    mov ax, bx
    dec ax
    mov dx, 160
    mul dx
    mov si, ax
    
    mov ax, bx
    mov dx, 160
    mul dx
    mov di, ax
    
    push bx
    mov bx, [cs:playerCol]
    sub bx, 2
    cmp bx, 0
    jge skipCalcOk
    xor bx, bx
skipCalcOk:
    
    mov cx, bx
    cmp cx, 0
    je skipFirstCopy
    rep movsw
skipFirstCopy:
    
    add si, 14
    add di, 14
    
    mov bx, [cs:playerCol]
    add bx, 5
    mov cx, 80
    sub cx, bx
    cmp cx, 0
    jle skipSecondCopy
    rep movsw
skipSecondCopy:
    
    pop bx
    dec bx
    jmp scrollRowLoop
    
scrollDone:
    push cs
    pop ds
    mov ax, 0xB800
    mov es, ax
    
    mov bx, [playerCol]
    sub bx, 2
    cmp bx, 0
    jge topSkipOk
    xor bx, bx
topSkipOk:
    
    mov si, tempBuffer
    mov di, 160
    mov cx, bx
    cmp cx, 0
    je skipTopFirst
    rep movsw
skipTopFirst:
    
    add si, 14
    add di, 14
    
    mov bx, [playerCol]
    add bx, 5
    mov cx, 80
    sub cx, bx
    cmp cx, 0
    jle skipTopSecond
    rep movsw
skipTopSecond:
    
    call moveObstacles
    call drawAllObstacles
    
    inc word [cs:distance]
    call updateGameDisplay
    
    mov ax, [cs:distance]
    mov bx, [cs:requiredDistance]
    cmp ax, bx
    jl noLevelComplete
    
    cmp word [cs:currentLevel], 5
    jge allComplete
    
    mov byte [cs:levelComplete], 1
    mov byte [cs:pauseGame], 1
    jmp noLevelComplete
    
allComplete:
    mov byte [cs:gameOver], 4
    
noLevelComplete:
    
    pop es
    pop ds
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret

eraseAllObstacles:
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    push es
    
    mov ax, 0xB800
    mov es, ax
    
    mov cx, 10
    xor si, si
    
eraseObstacleLoop:
    cmp word [cs:obstacles + si], 0
    je skipEraseObstacle
    
    mov ax, [cs:obstacles + si]
    mov bx, [cs:obstacleCol + si]
    
    cmp ax, 24
    jge skipEraseObstacle
    
    cmp ax, 20
    jl doErase
    cmp ax, 22
    jle checkPlayerCol
    jmp doErase
    
checkPlayerCol:
    mov dx, [cs:playerCol]
    cmp bx, dx
    je skipEraseObstacle
    
doErase:
    push dx
    mov dx, 160
    mul dx
    pop dx
    add ax, bx
    add ax, bx
    mov di, ax
    
    call getThemeChar
    stosw
    stosw
    stosw
    
skipEraseObstacle:
    add si, 2
    loop eraseObstacleLoop
    
    pop es
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret

moveObstacles:
    push ax
    push bx
    push cx
    push si
    
    mov cx, 10
    xor si, si
    
moveObstacleLoop:
    cmp word [cs:obstacles + si], 0
    je skipMoveObstacle
    
    inc word [cs:obstacles + si]
    
    cmp word [cs:obstacles + si], 24
    jl skipMoveObstacle
    
    mov word [cs:obstacles + si], 0
    
skipMoveObstacle:
    add si, 2
    loop moveObstacleLoop
    
    pop si
    pop cx
    pop bx
    pop ax
    ret

drawAllObstacles:
    push ax
    push bx
    push cx
    push dx
    push si
    
    mov cx, 10
    xor si, si
    
drawAllLoop:
    cmp word [cs:obstacles + si], 0
    je skipDrawObstacle
    
    mov ax, [cs:obstacles + si]
    
    cmp ax, 24
    jge skipDrawObstacle
    
    cmp ax, 20
    jl doDraw
    cmp ax, 22
    jg doDraw
    
    mov bx, [cs:obstacleCol + si]
    mov dx, [cs:playerCol]
    cmp bx, dx
    je skipDrawObstacle
    
doDraw:
    push si
    call drawSingleObstacle
    pop si
    
skipDrawObstacle:
    add si, 2
    loop drawAllLoop
    
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret

drawSingleObstacle:
    push ax
    push bx
    push cx
    push di
    push es
    
    mov ax, 0xB800
    mov es, ax
    
    mov ax, [cs:obstacles + si]
    mov bx, [cs:obstacleCol + si]
    
    push dx
    mov dx, 160
    mul dx
    pop dx
    add ax, bx
    add ax, bx
    mov di, ax
    
    mov al, [cs:obstacleType + si]
    cmp al, 1
    je drawBonus
    
    mov al, 'v'
    mov ah, 0x04
    stosw
    mov al, 'v'
    stosw
    mov al, 'v'
    stosw
    jmp doneDraw
    
drawBonus:
    mov al, '$'
    mov ah, 0x7E
    stosw
    stosw
    stosw
    
doneDraw:
    pop es
    pop di
    pop cx
    pop bx
    pop ax
    ret

spawnObstacles:
    push ax
    push bx
    push cx
    push dx
    push si
    
    call random
    and ax, 0x000F
    cmp ax, 3
    jg noSpawn
    
    mov cx, 10
    xor si, si
    
findEmptySlot:
    cmp word [cs:obstacles + si], 0
    je foundEmptySlot
    add si, 2
    loop findEmptySlot
    jmp noSpawn
    
foundEmptySlot:
    mov word [cs:obstacles + si], 1
    
    call random
    xor dx, dx
    mov bx, 3
    div bx
    
    cmp dx, 0
    je setLane0
    cmp dx, 1
    je setLane1
    mov word [cs:obstacleCol + si], 51
    jmp setType
    
setLane0:
    mov word [cs:obstacleCol + si], 25
    jmp setType
    
setLane1:
    mov word [cs:obstacleCol + si], 38
    
setType:
    call random
    and ax, 0x0007
    cmp ax, 6
    jl makeCar
    
    mov byte [cs:obstacleType + si], 1
    jmp noSpawn
    
makeCar:
    mov byte [cs:obstacleType + si], 0
    
noSpawn:
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret

checkCollisions:
    push ax
    push bx
    push cx
    push dx
    push si
    
    mov cx, 10
    xor si, si
    
collisionLoop:
    cmp word [cs:obstacles + si], 0
    je nextCollision
    
    mov ax, [cs:obstacles + si]
    cmp ax, 20
    jl nextCollision
    cmp ax, 23
    jge nextCollision
    
    mov bx, [cs:obstacleCol + si]
    mov dx, [cs:playerCol]
    cmp bx, dx
    jne nextCollision
    
    mov al, [cs:obstacleType + si]
    cmp al, 1
    je bonusHit
    
	call playCrashSound 
    mov byte [cs:gameOver], 1
    mov word [cs:obstacles + si], 0
    jmp nextCollision
    
bonusHit:
    add word [cs:score], 10
    mov word [cs:obstacles + si], 0
	    call playBonusSound           

    call updateGameDisplay
    
nextCollision:
    add si, 2
    loop collisionLoop
    
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret

random:
    push bx
    push cx
    push dx
    
    mov ax, [cs:randSeed]
    mov bx, 25173
    mul bx
    add ax, 13849
    mov [cs:randSeed], ax
    
    pop dx
    pop cx
    pop bx
    ret

changeLane:
    push ax
    push bx
    push si
    
    call erasePlayerCar
    
    xor bh, bh
    mov bl, [cs:playerLane]
    shl bx, 1
    mov ax, [cs:lanePositions + bx]
    mov [cs:playerCol], ax
    
    call drawPlayerCar
    
    pop si
    pop bx
    pop ax
    ret

erasePlayerCar:
    push ax
    push bx
    push dx
    push di
    push es
    
    mov ax, 0xB800
    mov es, ax
    
    mov bx, [cs:playerCol]
    
    mov ax, 20
    mov dx, 160
    mul dx
    add ax, bx
    add ax, bx
    mov di, ax
    call getThemeChar
    stosw
    stosw
    stosw
    
    mov ax, 21
    mov dx, 160
    mul dx
    add ax, bx
    add ax, bx
    sub ax, 2
    mov di, ax
    call getThemeChar
    stosw
    stosw
    stosw
    stosw
    stosw
    
    mov ax, 22
    mov dx, 160
    mul dx
    add ax, bx
    add ax, bx
    mov di, ax
    call getThemeChar
    stosw
    stosw
    stosw
    
    pop es
    pop di
    pop dx
    pop bx
    pop ax
    ret

drawPlayerCar:
    push ax
    push bx
    push di
    push es
    
    mov ax, 0xB800
    mov es, ax
    
    mov bx, [cs:playerCol]
    
    mov di, (20 * 160)
    add di, bx
    add di, bx
    mov al, '/'
    mov ah, 0x0C
    stosw
    mov al, '-'
    mov ah, 0x0C
    stosw
    mov al, '\'
    mov ah, 0x0C
    stosw

    mov di, (21 * 160)
    add di, bx
    add di, bx
    sub di, 2
    mov al, '('
    mov ah, 0x00
    stosw
    mov al, '['
    mov ah, 0x0C
    stosw
    mov al, '#'
    mov ah, 0x0E
    stosw
    mov al, ']'
    mov ah, 0x0C
    stosw
    mov al, ')'
    mov ah, 0x00
    stosw

    mov di, (22 * 160)
    add di, bx
    add di, bx
    mov al, 223
    mov ah, 0x04
    stosw
    mov al, 223
    mov ah, 0x04
    stosw
    mov al, 223
    mov ah, 0x04
    stosw
    
    pop es
    pop di
    pop bx
    pop ax
    ret

getThemeChar:
    push bx
    mov bx, [cs:currentLevel]
    
    cmp bx, 1
    je themeDay
    cmp bx, 2
    je themeNight
    cmp bx, 3
    je themeDesert
    cmp bx, 4
    je themeSnow
    jmp themeSun
    
themeDay:
    mov al, 219
    mov ah, 0x07
    jmp themeDone
    
themeNight:
    mov al, 219
    mov ah, 0x07
    jmp themeDone
    
themeDesert:
    mov al, 219
    mov ah, 0x07
    jmp themeDone
    
themeSnow:
    mov al, 219
    mov ah, 0x07
    jmp themeDone
    
themeSun:
    mov al, 219
    mov ah, 0x07
    
themeDone:
    pop bx
    ret

updateGameDisplay:
    push ax
    push bx
    push cx
    push dx
    push di
    push es
    push si
    
    mov ax, 0xB800
    mov es, ax
    
    mov di, 24 * 160
    
    mov cx, 80
    mov ax, 0x3020
clearRow24:
    stosw
    loop clearRow24
    
    mov di, 24 * 160
    
    mov si, scoreLabel
    mov ah, 0x3F
printScoreLbl:
    lodsb
    cmp al, 0
    je printScoreNum
    stosw
    jmp printScoreLbl
    
printScoreNum:
    mov ax, [cs:score]
    call printNumberColored
    
    mov ax, [cs:score]
    cmp ax, [cs:highScore]
    jle skipHighScoreUpdate
    mov [cs:highScore], ax
    mov byte [cs:newRecord], 1
    
skipHighScoreUpdate:
    
    add di, 4
    mov si, highScoreLabel
    mov ah, 0x3F
printHighLbl:
    lodsb
    cmp al, 0
    je printHighNum
    stosw
    jmp printHighLbl
    
printHighNum:
    mov ax, [cs:highScore]
    call printNumberColored
    
    add di, 6
    mov si, distanceLabel
    mov ah, 0x3F
printDistLbl:
    lodsb
    cmp al, 0
    je printDistNum
    stosw
    jmp printDistLbl
    
printDistNum:
    mov ax, [cs:distance]
    call printNumberColored
    mov al, 'm'
    mov ah, 0x3E
    stosw
    
    add di, 6
    mov si, levelLabel
    mov ah, 0x3F
printLvlLbl:
    lodsb
    cmp al, 0
    je printLvlNum
    stosw
    jmp printLvlLbl
    
printLvlNum:
    mov ax, [cs:currentLevel]
    call printNumberColored
    
    pop si
    pop es
    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    ret

printNumberColored:
    push ax
    push bx
    push cx
    push dx
    
    cmp ax, 0
    jne convertNumCol
    
    mov al, '0'
    mov ah, 0x3E
    stosw
    jmp numColDone
    
convertNumCol:
    mov bx, 10
    xor cx, cx
    
divideNumCol:
    xor dx, dx
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne divideNumCol
    
printDigitsCol:
    pop ax
    add al, '0'
    mov ah, 0x3E
    stosw
    loop printDigitsCol
    
numColDone:
    pop dx
    pop cx
    pop bx
    pop ax
    ret

printNumberAtDI:
    push ax
    push bx
    push cx
    push dx
    push di
    push es
    
    mov bx, 0xB800
    mov es, bx
    
    cmp ax, 0
    jne convertNumDI
    
    mov al, '0'
    mov ah, 0x0F
    stosw
    jmp numDIDone
    
convertNumDI:
    mov bx, 10
    xor cx, cx
    
divideNumDI:
    xor dx, dx
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne divideNumDI
    
printDigitsDI:
    pop ax
    add al, '0'
    mov ah, 0x0F
    stosw
    loop printDigitsDI
    
numDIDone:
    pop es
    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    ret

printNumber:
    push ax
    push bx
    push cx
    push dx
    
    cmp ax, 0
    jne convertNum
    
    mov al, '0'
    mov ah, 0x0E
    stosw
    jmp numDone
    
convertNum:
    mov bx, 10
    xor cx, cx
    
divideNum:
    xor dx, dx
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne divideNum
    
printDigits:
    pop ax
    add al, '0'
    mov ah, 0x0E
    stosw
    loop printDigits
    
numDone:
    pop dx
    pop cx
    pop bx
    pop ax
    ret

timerISR:
    push ax
    push ds
    
    push cs
    pop ds
    
    inc word [blinkCounter]
    
    cmp byte [pauseGame], 1
    je timerDone
    
    cmp byte [gameOver], 1
    je timerDone
    
    inc word [tickCount]
    mov ax, [cs:gameSpeed]
    cmp word [tickCount], ax
    jl timerDone
    
    mov word [tickCount], 0
    call playBackgroundMusic
    call checkCollisions
    call MoveScreen
    call spawnObstacles
    
timerDone:
    mov al, 0x20
    out 0x20, al
    
    pop ds
    pop ax
    iret

kbISR:
    push ax
    push bx
    push ds
    
    push cs
    pop ds
    
    in al, 0x60
    
    cmp al, 0x01
    je handleEscape
    
    cmp al, 0x2A
    je handleShift
    cmp al, 0x36
    je handleShift
    
    cmp byte [pauseGame], 1
    je kbDone
    
    cmp al, 0x4B
    je moveLeft
    
    cmp al, 0x4D
    je moveRight
    
    jmp kbDone
    
handleEscape:
    mov byte [escPressed], 1
    mov byte [pauseGame], 1
    jmp kbDone
    
handleShift:
    mov byte [shiftPressed], 1
    jmp kbDone
    
moveLeft:
    cmp byte [playerLane], 0
    je kbDone
    dec byte [playerLane]
    call changeLane
    jmp kbDone
    
moveRight:
    cmp byte [playerLane], 2
    je kbDone
    inc byte [playerLane]
    call changeLane
    
kbDone:
    mov al, 0x20
    out 0x20, al
    
    pop ds
    pop bx
    pop ax
    iret

hookInterrupts:
    push es
    push ax
    push bx
    
    cli
    
    xor ax, ax
    mov es, ax
    
    mov ax, [es:9*4]
    mov [oldKbISR], ax
    mov ax, [es:9*4+2]
    mov [oldKbISR+2], ax
    
    mov word [es:9*4], kbISR
    mov [es:9*4+2], cs
    
    mov ax, [es:8*4]
    mov [oldTimerISR], ax
    mov ax, [es:8*4+2]
    mov [oldTimerISR+2], ax
    
    mov word [es:8*4], timerISR
    mov [es:8*4+2], cs
    
    sti
    
    pop bx
    pop ax
    pop es
    ret

printString:
    push ax
    push bx
    push cx
    push dx
    push di
    push es
    push si
    
    mov ax, 0xB800
    mov es, ax
    
    mov al, dh
    mov ah, 0
    mov cx, 160
    mul cx
    mov dh, 0
    shl dx, 1
    add ax, dx
    mov di, ax
    
    mov ah, bl
    
printLoop:
    lodsb
    cmp al, 0
    je printDone
    stosw
    jmp printLoop
    
printDone:
    pop si
    pop es
    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    ret

clearScreen:
    push ax
    push cx
    push di
    push es
    
    mov ax, 0xB800
    mov es, ax
    xor di, di
    mov ax, 0x0720
    mov cx, 2000
    rep stosw
    
    pop es
    pop di
    pop cx
    pop ax
    ret

showLoadingBar:
    push ax
    push bx
    push cx
    push dx
    push di
    push si
    push es
    
    mov ax, 0xB800
    mov es, ax
    
    mov di, (10 * 160) + (22 * 2)
    mov al, 201
    mov ah, 0x0F
    stosw
    mov al, 205
    mov cx, 34
topBorder:
    stosw
    loop topBorder
    mov al, 187
    stosw
    
    mov di, (11 * 160) + (22 * 2)
    mov al, 186
    stosw
    mov al, ' '
    mov cx, 34
fillMiddleLoad:
    stosw
    loop fillMiddleLoad
    mov al, 186 ;vertical line ║
    stosw
    
    mov di, (12 * 160) + (22 * 2)
    mov al, 200
    stosw
    mov al, 205
    mov cx, 34
bottomBorder:
    stosw
    loop bottomBorder
    mov al, 188
    stosw
    
    mov si, loadingMsg
    mov dh, 11
    mov dl, 33
    mov bl, 0x0E
    call printString
    
    mov cx, 28
    mov di, (11 * 160) + (24 * 2)
loadLoop:
    push cx
    
    mov al, 219;block green
    mov ah, 0x0A;green
    stosw
    
    mov cx, 0xFFFF
delayOuter:
    push cx
    mov cx, 3
delayLoad:
    loop delayLoad
    pop cx
    loop delayOuter
    
    pop cx
    loop loadLoop
    
    pop es
    pop si
    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    ret

showPauseMenu:
    push ax
    push bx
    push cx
    push dx
    push di
    push si
    push es
    
    mov ax, 0xB800
    mov es, ax
    
    mov di, (10 * 160) + (24 * 2)
    mov al, 201
    mov ah, 0x4F
    stosw
    mov al, 205
    mov cx, 32
topBorderPause:
    stosw
    loop topBorderPause
    mov al, 187
    stosw
    
    mov bx, 11
    mov cx, 6
middleRowsPause:
    push cx
    
    mov ax, bx
    mov dx, 160
    mul dx
    add ax, (24 * 2)
    mov di, ax
    
    mov al, 186
    mov ah, 0x4F
    stosw
    
    mov al, ' '
    mov ah, 0x4F
    mov cx, 32
fillMidPause:
    stosw
    loop fillMidPause
    
    mov al, 186
    mov ah, 0x4F
    stosw
    
    inc bx
    pop cx
    loop middleRowsPause
    
    mov di, (17 * 160) + (24 * 2)
    mov al, 200
    mov ah, 0x4F
    stosw
    mov al, 205
    mov cx, 32
bottomBorderPause:
    stosw
    loop bottomBorderPause
    mov al, 188
    stosw
    
    mov di, (12 * 160) + (27 * 2)
    mov si, pauseMsg1
    mov ah, 0x4F
printMsg1:
    lodsb
    cmp al, 0
    je printMsg2Start
    stosw
    jmp printMsg1
    
printMsg2Start:
    mov di, (14 * 160) + (29 * 2)
    mov si, pauseMsg2
    mov ah, 0x4F
printMsg2:
    lodsb
    cmp al, 0
    je pauseMenuDone
    stosw
    jmp printMsg2
    
pauseMenuDone:
    pop es
    pop si
    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    ret
showConfirmationDialog:
    push ax
    push bx
    push cx
    push dx
    push di
    push si
    push es
    
    mov ax, 0xB800
    mov es, ax
    
    ; Draw outer box (larger than pause menu)
    mov di, (9 * 160) + (20 * 2)
    mov al, 201
    mov ah, 0x4E  ; Yellow on red background
    stosw
    mov al, 205
    mov cx, 40
topBorderConfirm:
    stosw
    loop topBorderConfirm
    mov al, 187
    stosw
    
    ; Draw middle rows
    mov bx, 10
    mov cx, 8
middleRowsConfirm:
    push cx
    
    mov ax, bx
    mov dx, 160
    mul dx
    add ax, (20 * 2)
    mov di, ax
    
    mov al, 186
    mov ah, 0x4E
    stosw
    
    mov al, ' '
    mov ah, 0x4E
    mov cx, 40
fillMidConfirm:
    stosw
    loop fillMidConfirm
    
    mov al, 186
    mov ah, 0x4E
    stosw
    
    inc bx
    pop cx
    loop middleRowsConfirm
    
    ; Draw bottom border
    mov di, (18 * 160) + (20 * 2)
    mov al, 200
    mov ah, 0x4E
    stosw
    mov al, 205
    mov cx, 40
bottomBorderConfirm:
    stosw
    loop bottomBorderConfirm
    mov al, 188
    stosw
    
    ; Print confirmation message line 1
    mov di, (12 * 160) + (25 * 2)
    mov si, confirmExitMsg1
    mov ah, 0x4F  ; White on red
printConfirmMsg1:
    lodsb
    cmp al, 0
    je printConfirmMsg2Start
    stosw
    jmp printConfirmMsg1
    
printConfirmMsg2Start:
    mov di, (14 * 160) + (21 * 2)
    mov si, confirmExitMsg2
    mov ah, 0x4E  ; Yellow on red
printConfirmMsg2:
    lodsb
    cmp al, 0
    je confirmDialogDone
    stosw
    jmp printConfirmMsg2
    
confirmDialogDone:
    pop es
    pop si
    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    ret
unhookInterrupts:
    push es
    push ax
    push bx
    
    cli
    
    xor ax, ax
    mov es, ax
    
    mov ax, [oldKbISR]
    mov [es:9*4], ax
    mov ax, [oldKbISR+2]
    mov [es:9*4+2], ax
    
    mov ax, [oldTimerISR]
    mov [es:8*4], ax
    mov ax, [oldTimerISR+2]
    mov [es:8*4+2], ax
    
    sti
    
    pop bx
    pop ax
    pop es
    ret

showThankYouScreen:
    push ax
    push bx
    push cx
    push dx
    push di
    push si
    push es
    
    call clearScreen
    
    mov ax, 0xB800
    mov es, ax
    
    mov di, 0
    mov cx, 2000
    mov ax, 0x1F20
bgLoopThanks:
    stosw
    loop bgLoopThanks
    
    mov di, (9 * 160) + (20 * 2)
    mov al, 201
    mov ah, 0x0F
    stosw
    mov al, 205
    mov cx, 40
topBorderThanks:
    stosw
    loop topBorderThanks
    mov al, 187
    stosw
    
    mov cx, 6
    mov bx, 10
midRowsThanks:
    push cx
    mov ax, bx
    mov dx, 160
    mul dx
    add ax, (20 * 2)
    mov di, ax
    mov al, 186
    mov ah, 0x0F
    stosw
    add di, 80
    stosw
    inc bx
    pop cx
    loop midRowsThanks
    
    mov di, (16 * 160) + (20 * 2)
    mov al, 200
    mov ah, 0x0F
    stosw
    mov al, 205
    mov cx, 40
bottomBorderThanks:
    stosw
    loop bottomBorderThanks
    mov al, 188
    stosw
    
    mov si, thankYouMsg
    mov dh, 12
    mov dl, 29
    mov bl, 0x1E
    call printString
    
    mov si, finalScore
    mov dh, 14
    mov dl, 33
    mov bl, 0x0F
    call printString
    
    mov ax, 0xB800
    mov es, ax
    mov di, (14 * 160) + (47 * 2)
    mov ax, [cs:score]
    call printNumber
    
    mov cx, 0xFFFF
thankYouDelay1:
    push cx
    mov cx, 0xFFFF
thankYouDelay2:
    loop thankYouDelay2
    pop cx
    loop thankYouDelay1
    
    pop es
    pop si
    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    ret

DrawScene:
    push ax
    push bx
    push cx
    push di
    push es
    
    mov ax, 0xB800
    mov es, ax
    xor di, di
    
    mov cx, 25
    
drawRows:
    push cx
    mov bx, 0
    mov cx, 80
    
drawColumns:
    cmp bx, 20
    jl drawLeftSide
    
    cmp bx, 20
    je drawYellowBorder
    cmp bx, 59
    je drawYellowBorder
    
    cmp bx, 60
    jge drawRightSide
    
    cmp bx, 33
    je drawWhiteDivider
    cmp bx, 46
    je drawWhiteDivider
    
    jmp drawGreyRoad
    
drawLeftSide:
    call drawSideDecoration
    jmp nextColumn
    
drawRightSide:
    call drawSideDecoration
    jmp nextColumn
    
drawYellowBorder:
    mov al, 219
    mov ah, 0x0E
    stosw
    jmp nextColumn
    
drawWhiteDivider:
    mov al, '|'
    mov ah, 0x7F
    stosw
    jmp nextColumn
    
drawGreyRoad:
    mov al, 219
    mov ah, 0x07
    stosw
    jmp nextColumn
    
nextColumn:
    inc bx
    loop drawColumns
    
    pop cx
    loop drawRows
    
    call drawThemeDecorations
    call drawPlayerCar
    
    pop es
    pop di
    pop cx
    pop bx
    pop ax
    ret

drawSideDecoration:
    push ax
    push bx
    push cx
    push dx
    
    mov bx, [cs:currentLevel]
    
    cmp bx, 1
    je drawDayGrass
    cmp bx, 2
    je drawNightGrass
    cmp bx, 3
    je drawDesertSand
    cmp bx, 4
    je drawSnowGround
    jmp drawBeachGround
    
drawDayGrass:
    mov al, 219
    mov ah, 0x0A
    stosw
    jmp decorDone
    
drawNightGrass:
    mov al, 219
    mov ah, 0x00
    stosw
    jmp decorDone
    
drawDesertSand:
    mov al, 219
    mov ah, 0x06
    stosw
    jmp decorDone
    
drawSnowGround:
    mov al, 219
    mov ah, 0x07
    stosw
    jmp decorDone
    
drawBeachGround:
    mov ax, di
    shr ax, 1
    xor dx, dx
    mov cx, 80
    div cx
    
    cmp dx, 6
    jl drawWater
    cmp dx, 74
    jg drawWater
    
    mov al, 219
    mov ah, 0x0E
    stosw
    jmp decorDone
    
drawWater:
    mov al, 219
    mov ah, 0x01
    stosw
    
decorDone:
    pop dx
    pop cx
    pop bx
    pop ax
    ret

drawThemeDecorations:
    push ax
    push bx
    push cx
    push dx
    push di
    push es
    
    mov ax, 0xB800
    mov es, ax
    
    mov bx, [cs:currentLevel]
    
    cmp bx, 1
    je drawDayTheme
    cmp bx, 2
    je drawNightTheme
    cmp bx, 3
    je drawDesertTheme
    cmp bx, 4
    je drawSnowTheme
    jmp drawSunTheme
    
drawDayTheme:
    ; Tree 1 (left side) 
    mov ah, 0x22  ; Green leaves
    mov di, (4 * 160) + (6 * 2)
    mov al, '^'
    stosw
    mov di, (5 * 160) + (5 * 2)
    mov al, '^'
    stosw
    mov di, (5 * 160) + (6 * 2)
    mov al, '^'
    stosw
    mov di, (5 * 160) + (7 * 2)
    mov al, '^'
    stosw
    mov di, (6 * 160) + (4 * 2)
    mov al, '^'
    stosw
    mov di, (6 * 160) + (5 * 2)
    mov al, '^'
    stosw
    mov di, (6 * 160) + (6 * 2)
    mov al, '^'
    stosw
    mov di, (6 * 160) + (7 * 2)
    mov al, '^'
    stosw
    mov di, (6 * 160) + (8 * 2)
    mov al, '^'
    stosw

    mov ah, 0x26  ; Brown trunk
    mov di, (7 * 160) + (6 * 2)
    mov al, '|'
    stosw

    ; Tree 2 (left)
    mov ah, 0x22
    mov di, (11 * 160) + (10 * 2)
    mov al, '^'
    stosw
    mov di, (12 * 160) + (9 * 2)
    mov al, '^'
    stosw
    mov di, (12 * 160) + (10 * 2)
    mov al, '^'
    stosw
    mov di, (12 * 160) + (11 * 2)
    mov al, '^'
    stosw
    mov di, (13 * 160) + (8 * 2)
    mov al, '^'
    stosw
    mov di, (13 * 160) + (9 * 2)
    mov al, '^'
    stosw
    mov di, (13 * 160) + (10 * 2)
    mov al, '^'
    stosw
    mov di, (13 * 160) + (11 * 2)
    mov al, '^'
    stosw
    mov di, (13 * 160) + (12 * 2)
    mov al, '^'
    stosw

    mov ah, 0x26
    mov di, (14 * 160) + (10 * 2)
    mov al, '|'
    stosw

    ; Tree 3 (left)
    mov ah, 0x22
    mov di, (17 * 160) + (12 * 2)
    mov al, '^'
    stosw
    mov di, (18 * 160) + (11 * 2)
    mov al, '^'
    stosw
    mov di, (18 * 160) + (12 * 2)
    mov al, '^'
    stosw
    mov di, (18 * 160) + (13 * 2)
    mov al, '^'
    stosw
    mov di, (19 * 160) + (10 * 2)
    mov al, '^'
    stosw
    mov di, (19 * 160) + (11 * 2)
    mov al, '^'
    stosw
    mov di, (19 * 160) + (12 * 2)
    mov al, '^'
    stosw
    mov di, (19 * 160) + (13 * 2)
    mov al, '^'
    stosw
    mov di, (19 * 160) + (14 * 2)
    mov al, '^'
    stosw

    mov ah, 0x26
    mov di, (20 * 160) + (12 * 2)
    mov al, '|'
    stosw

    ; Trees (right side)
    mov ah, 0x22
    mov di, (4 * 160) + ((79 - 6) * 2)
    mov al, '^'
    stosw
    mov di, (5 * 160) + ((79 - 5) * 2)
    mov al, '^'
    stosw
    mov di, (5 * 160) + ((79 - 6) * 2)
    mov al, '^'
    stosw
    mov di, (5 * 160) + ((79 - 7) * 2)
    mov al, '^'
    stosw
    mov di, (6 * 160) + ((79 - 4) * 2)
    mov al, '^'
    stosw
    mov di, (6 * 160) + ((79 - 5) * 2)
    mov al, '^'
    stosw
    mov di, (6 * 160) + ((79 - 6) * 2)
    mov al, '^'
    stosw
    mov di, (6 * 160) + ((79 - 7) * 2)
    mov al, '^'
    stosw
    mov di, (6 * 160) + ((79 - 8) * 2)
    mov al, '^'
    stosw

    mov ah, 0x26
    mov di, (7 * 160) + ((79 - 6) * 2)
    mov al, '|'
    stosw

    ; Tree 2 (right)
    mov ah, 0x22
    mov di, (11 * 160) + ((79 - 10) * 2)
    mov al, '^'
    stosw
    mov di, (12 * 160) + ((79 - 9) * 2)
    mov al, '^'
    stosw
    mov di, (12 * 160) + ((79 - 10) * 2)
    mov al, '^'
    stosw
    mov di, (12 * 160) + ((79 - 11) * 2)
    mov al, '^'
    stosw
    mov di, (13 * 160) + ((79 - 8) * 2)
    mov al, '^'
    stosw
    mov di, (13 * 160) + ((79 - 9) * 2)
    mov al, '^'
    stosw
    mov di, (13 * 160) + ((79 - 10) * 2)
    mov al, '^'
    stosw
    mov di, (13 * 160) + ((79 - 11) * 2)
    mov al, '^'
    stosw
    mov di, (13 * 160) + ((79 - 12) * 2)
    mov al, '^'
    stosw

    mov ah, 0x26
    mov di, (14 * 160) + ((79 - 10) * 2)
    mov al, '|'
    stosw

    ; Tree 3 (right)
    mov ah, 0x22
    mov di, (17 * 160) + ((79 - 12) * 2)
    mov al, '^'
    stosw
    mov di, (18 * 160) + ((79 - 11) * 2)
    mov al, '^'
    stosw
    mov di, (18 * 160) + ((79 - 12) * 2)
    mov al, '^'
    stosw
    mov di, (18 * 160) + ((79 - 13) * 2)
    mov al, '^'
    stosw
    mov di, (19 * 160) + ((79 - 10) * 2)
    mov al, '^'
    stosw
    mov di, (19 * 160) + ((79 - 11) * 2)
    mov al, '^'
    stosw
    mov di, (19 * 160) + ((79 - 12) * 2)
    mov al, '^'
    stosw
    mov di, (19 * 160) + ((79 - 13) * 2)
    mov al, '^'
    stosw
    mov di, (19 * 160) + ((79 - 14) * 2)
    mov al, '^'
    stosw

    mov ah, 0x26
    mov di, (20 * 160) + ((79 - 12) * 2)
    mov al, '|'
    stosw
    
    jmp themeDecorDone
    

drawNightTheme:
    ; Grey Moon 
    mov di, (2 * 160) + (70 * 2)
    mov al, 218
    mov ah, 0x78  ; Grey background 
    stosw
    mov al, 196
    stosw
    mov al, 196
    stosw
    mov al, 191
    stosw
    
    mov di, (3 * 160) + (70 * 2)
    mov al, 179
    mov ah, 0x78
    stosw
    mov al, ' '
    stosw
    stosw
    mov al, 179
    stosw
    
    mov di, (4 * 160) + (70 * 2)
    mov al, 179
    mov ah, 0x78
    stosw
    mov al, ' '
    stosw
    stosw
    mov al, 179
    stosw
    
    mov di, (5 * 160) + (70 * 2)
    mov al, 192
    mov ah, 0x78
    stosw
    mov al, 196
    stosw
    mov al, 196
    stosw
    mov al, 217
    stosw
    
    ; Yellow blinking stars
    mov ax, [cs:blinkCounter]
    and ax, 0x0010  ; Slower blink (every 32 ticks)
    jnz skipStarBlink
    
    mov di, (2 * 160) + (5 * 2)
    mov al, '*'
    mov ah, 0x0E  ; Yellow text
    stosw
    
    mov di, (3 * 160) + (12 * 2)
    stosw
    
    mov di, (4 * 160) + (8 * 2)
    stosw
    
    mov di, (2 * 160) + (65 * 2)
    stosw
    
    mov di, (4 * 160) + (62 * 2)
    stosw
    
    mov di, (6 * 160) + (15 * 2)
    stosw
    
    mov di, (7 * 160) + (55 * 2)
    stosw
    
skipStarBlink:
    
    ; Grey buildings (left)
    mov bx, 10
buildLoop1:
    cmp bx, 18
    jg buildDone1
    mov ax, bx
    mov dx, 160
    mul dx
    add ax, (4 * 2)
    mov di, ax
    
    mov al, 219
    mov ah, 0x08
    stosw
    stosw
    stosw
    stosw
    
    
    mov ax, bx
    and ax, 1
    jz skipWindow1
    sub di, 6
    mov al, 'o'
    mov ah, 0xFF  ; White background, black text
    stosw
    add di, 2
    stosw
    
skipWindow1:
    inc bx
    jmp buildLoop1
buildDone1:
    
    ; Building 2 (left)
    mov bx, 12
buildLoop2:
    cmp bx, 18
    jg buildDone2
    mov ax, bx
    mov dx, 160
    mul dx
    add ax, (10 * 2)
    mov di, ax
    
    mov al, 219
    mov ah, 0x08
    stosw
    stosw
    stosw
    
    ; White background windows (STATIC)
    mov ax, bx
    and ax, 1
    jnz skipWindow2
    sub di, 4
    mov al, 'o'
    mov ah, 0xFF
    stosw
    
skipWindow2:
    inc bx
    jmp buildLoop2
buildDone2:
    
    ; Street lights (left)
    mov di, (16 * 160) + (19 * 2)
    mov al, 220
    mov ah, 0x0E
    stosw
    
    mov di, (17 * 160) + (19 * 2)
    mov al, 194
    mov ah, 0x07
    stosw
    
    mov di, (18 * 160) + (19 * 2)
    mov al, 179
    stosw
    
    mov di, (19 * 160) + (19 * 2)
    mov al, 179
    stosw
    
    mov di, (20 * 160) + (19 * 2)
    mov al, 179
    stosw
    
    ; Street light (right)
    mov di, (16 * 160) + (60 * 2)
    mov al, 220
    mov ah, 0x0E
    stosw
    
    mov di, (17 * 160) + (60 * 2)
    mov al, 193
    mov ah, 0x07
    stosw
    
    mov di, (18 * 160) + (60 * 2)
    mov al, 179
    stosw
    
    mov di, (19 * 160) + (60 * 2)
    mov al, 179
    stosw
    
    mov di, (20 * 160) + (60 * 2)
    mov al, 179
    stosw
    
    ; Buildings (right side)
    mov bx, 10
buildLoop3:
    cmp bx, 18
    jg buildDone3
    mov ax, bx
    mov dx, 160
    mul dx
    add ax, (68 * 2)
    mov di, ax
    
    mov al, 219
    mov ah, 0x08
    stosw
    stosw
    stosw
    stosw
    stosw
    
    ; White background windows (STATIC)
    mov ax, bx
    and ax, 1
    jz skipWindow3
    sub di, 8
    mov al, 'o'
    mov ah, 0xFF
    stosw
    add di, 4
    stosw
    
skipWindow3:
    inc bx
    jmp buildLoop3
buildDone3:
    
    jmp themeDecorDone
   
    

drawDesertTheme:
    ; Mountain 1 (left) - Dark brown background
    mov di, (8 * 160) + (5 * 2)
    mov al, '/'
    mov ah, 0x60  ; Dark brown background
    stosw
    
    mov di, (9 * 160) + (4 * 2)
    mov al, '/'
    mov ah, 0x60
    stosw
    mov al, ' '
    stosw
    mov al, '\'
    stosw
    
    mov di, (10 * 160) + (3 * 2)
    mov al, '/'
    mov ah, 0x60
    stosw
    mov al, ' '
    stosw
    mov al, ' '
    stosw
    mov al, ' '
    stosw
    mov al, '\'
    stosw
    
    mov di, (11 * 160) + (2 * 2)
    mov al, '/'
    mov ah, 0x60
    stosw
    mov al, ' '
    stosw
    mov al, ' '
    stosw
    mov al, ' '
    stosw
    mov al, ' '
    stosw
    mov al, ' '
    stosw
    mov al, '\'
    stosw
    
    mov di, (12 * 160) + (2 * 2)
    mov al, 219
    mov ah, 0x66 ; Dark brown background for base
    stosw
    stosw
    stosw
    stosw
    stosw
    stosw
    stosw
    
    ; Dark green bushes
    mov di, (16 * 160) + (3 * 2)
    mov al, '{'
    mov ah, 0x22  ; Dark green background
    stosw
    mov al, '@'
    mov ah, 0x22  ; Dark green text on dark green background
    stosw
    stosw
    mov al, '}'
    stosw
    
    mov di, (17 * 160) + (4 * 2)
    mov al, '\'
    mov ah, 0x22
    stosw
    mov al, '/'
    stosw
    
    ; Mountain 2 (middle)
    mov di, (12 * 160) + (10 * 2)
    mov al, '/'
    mov ah, 0x60
    stosw
    mov al, '\'
    stosw
    
    mov di, (13 * 160) + (9 * 2)
    mov al, '/'
    mov ah, 0x60
    stosw
    mov al, ' '
    stosw
    mov al, ' '
    stosw
    mov al, '\'
    stosw
    
    mov di, (14 * 160) + (9 * 2)
    mov al, 219
    mov ah, 0x60
    stosw
    stosw
    stosw
    stosw
    
    ; Cactus with dark green background
    mov di, (15 * 160) + (13 * 2)
    mov al, '('
    mov ah, 0x22  ; Dark green background
    stosw
    mov al, '|'
    mov ah, 0x22
    stosw
    mov al, ')'
    mov ah, 0x22
    stosw
    
    mov di, (16 * 160) + (14 * 2)
    mov al, '|'
    mov ah, 0x22
    stosw
    
    mov di, (17 * 160) + (14 * 2)
    mov al, '|'
    mov ah, 0x22
    stosw
    
    ; Mountain 3 (right side)
    mov di, (10 * 160) + (68 * 2)
    mov al, '/'
    mov ah, 0x60
    stosw
    mov al, '\'
    stosw
    
    mov di, (11 * 160) + (67 * 2)
    mov al, '/'
    mov ah, 0x60
    stosw
    mov al, ' '
    stosw
    mov al, ' '
    stosw
    mov al, '\'
    stosw
    
    mov di, (12 * 160) + (66 * 2)
    mov al, '/'
    mov ah, 0x60
    stosw
    mov al, ' '
    stosw
    mov al, ' '
    stosw
    mov al, ' '
    stosw
    mov al, ' '
    stosw
    mov al, '\'
    stosw
    
    mov di, (13 * 160) + (66 * 2)
    mov al, 219
    mov ah, 0x60
    stosw
    stosw
    stosw
    stosw
    stosw
    stosw
    
    ; Bush (right) - dark green
    mov di, (16 * 160) + (72 * 2)
    mov al, '{'
    mov ah, 0x22
    stosw
    mov al, '@'
    mov ah, 0x22
    stosw
    mov al, '}'
    mov ah, 0x22
    stosw
    
    ; Cactus (right) - dark green
    mov di, (15 * 160) + (70 * 2)
    mov al, '('
    mov ah, 0x22
    stosw
    mov al, '|'
    mov ah, 0x22
    stosw
    mov al, ')'
    mov ah, 0x22
    stosw
    
    mov di, (16 * 160) + (71 * 2)
    mov al, '|'
    mov ah, 0x22
    stosw
    
    mov di, (17 * 160) + (71 * 2)
    mov al, '|'
    mov ah, 0x22
    stosw
    
    jmp themeDecorDone   

drawSnowTheme:
    
    mov ah, 0xFF  ; White on White
    mov di, (4 * 160) + (6 * 2)
    mov al, '^'
    stosw
    mov di, (5 * 160) + (5 * 2)
    stosw
    mov di, (5 * 160) + (6 * 2)
    stosw
    mov di, (5 * 160) + (7 * 2)
    stosw
    mov di, (6 * 160) + (4 * 2)
    stosw
    mov di, (6 * 160) + (5 * 2)
    stosw
    mov di, (6 * 160) + (6 * 2)
    stosw
    mov di, (6 * 160) + (7 * 2)
    stosw
    mov di, (6 * 160) + (8 * 2)
    stosw
    
    mov ah, 0xFF  ; White trunk on White background
    mov di, (7 * 160) + (6 * 2)
    mov al, '|'
    stosw
    
    ; Tree 2 (left) 
    mov ah, 0xFF
    mov di, (11 * 160) + (10 * 2)
    mov al, '^'
    stosw
    mov di, (12 * 160) + (9 * 2)
    stosw
    mov di, (12 * 160) + (10 * 2)
    stosw
    mov di, (12 * 160) + (11 * 2)
    stosw
    mov di, (13 * 160) + (8 * 2)
    stosw
    mov di, (13 * 160) + (9 * 2)
    stosw
    mov di, (13 * 160) + (10 * 2)
    stosw
    mov di, (13 * 160) + (11 * 2)
    stosw
    mov di, (13 * 160) + (12 * 2)
    stosw
    
    mov ah, 0xFF
    mov di, (14 * 160) + (10 * 2)
    mov al, '|'
    stosw
    
    ; Tree 3 (left) 
    mov ah, 0xFF
    mov di, (17 * 160) + (12 * 2)
    mov al, '^'
    stosw
    mov di, (18 * 160) + (11 * 2)
    stosw
    mov di, (18 * 160) + (12 * 2)
    stosw
    mov di, (18 * 160) + (13 * 2)
    stosw
    mov di, (19 * 160) + (10 * 2)
    stosw
    mov di, (19 * 160) + (11 * 2)
    stosw
    mov di, (19 * 160) + (12 * 2)
    stosw
    mov di, (19 * 160) + (13 * 2)
    stosw
    mov di, (19 * 160) + (14 * 2)
    stosw
    
    mov ah, 0xFF
    mov di, (20 * 160) + (12 * 2)
    mov al, '|'
    stosw
    
    ; Right side tree
    mov ah, 0xFF
    mov di, (4 * 160) + ((79 - 6) * 2)
    mov al, '^'
    stosw
    mov di, (5 * 160) + ((79 - 5) * 2)
    stosw
    mov di, (5 * 160) + ((79 - 6) * 2)
    stosw
    mov di, (5 * 160) + ((79 - 7) * 2)
    stosw
    mov di, (6 * 160) + ((79 - 4) * 2)
    stosw
    mov di, (6 * 160) + ((79 - 5) * 2)
    stosw
    mov di, (6 * 160) + ((79 - 6) * 2)
    stosw
    mov di, (6 * 160) + ((79 - 7) * 2)
    stosw
    mov di, (6 * 160) + ((79 - 8) * 2)
    stosw
    
    mov ah, 0xFF
    mov di, (7 * 160) + ((79 - 6) * 2)
    mov al, '|'
    stosw
    
    ; Tree 2 (right) 
    mov ah, 0xFF
    mov di, (11 * 160) + ((79 - 10) * 2)
    mov al, '^'
    stosw
    mov di, (12 * 160) + ((79 - 9) * 2)
    stosw
    mov di, (12 * 160) + ((79 - 10) * 2)
    stosw
    mov di, (12 * 160) + ((79 - 11) * 2)
    stosw
    mov di, (13 * 160) + ((79 - 8) * 2)
    stosw
    mov di, (13 * 160) + ((79 - 9) * 2)
    stosw
    mov di, (13 * 160) + ((79 - 10) * 2)
    stosw
    mov di, (13 * 160) + ((79 - 11) * 2)
    stosw
    mov di, (13 * 160) + ((79 - 12) * 2)
    stosw
    
    mov ah, 0xFF
    mov di, (14 * 160) + ((79 - 10) * 2)
    mov al, '|'
    stosw
    
    ; Tree 3 (right)
    mov ah, 0xFF
    mov di, (17 * 160) + ((79 - 12) * 2)
    mov al, '^'
    stosw
    mov di, (18 * 160) + ((79 - 11) * 2)
    stosw
    mov di, (18 * 160) + ((79 - 12) * 2)
    stosw
    mov di, (18 * 160) + ((79 - 13) * 2)
    stosw
    mov di, (19 * 160) + ((79 - 10) * 2)
    stosw
    mov di, (19 * 160) + ((79 - 11) * 2)
    stosw
    mov di, (19 * 160) + ((79 - 12) * 2)
    stosw
    mov di, (19 * 160) + ((79 - 13) * 2)
    stosw
    mov di, (19 * 160) + ((79 - 14) * 2)
    stosw
    
    mov ah, 0xFF
    mov di, (20 * 160) + ((79 - 12) * 2)
    mov al, '|'
    stosw
    
  ;snow blinking
    mov ax, [cs:blinkCounter]
    and ax, 0x0010
    jnz skipSnowBlink
    
    
    mov di, (3 * 160) + (5 * 2)
    mov al, '*'     
    mov ah, 0x7F    
    stosw
    
    mov di, (6 * 160) + (9 * 2)
    stosw
    
    mov di, (9 * 160) + (7 * 2)
    stosw
    
    mov di, (12 * 160) + (6 * 2)
    stosw
    
    mov di, (8 * 160) + (13 * 2)
    stosw
    
    mov di, (11 * 160) + (14 * 2)
    stosw
    
    mov di, (15 * 160) + (11 * 2)
    stosw
    
    mov di, (16 * 160) + (14 * 2)
    stosw
    
    mov di, (19 * 160) + (8 * 2)
    stosw
    
    ; Right side snow circles
    mov di, (3 * 160) + (66 * 2)
    stosw
    
    mov di, (7 * 160) + (74 * 2)
    stosw
    
    mov di, (10 * 160) + (70 * 2)
    stosw
    
    mov di, (13 * 160) + (67 * 2)
    stosw
    
    mov di, (16 * 160) + (71 * 2)
    stosw
    
    mov di, (18 * 160) + (65 * 2)
    stosw
    
skipSnowBlink:
    
    jmp themeDecorDone

	
drawSunTheme:
    ; Yellow Sun 
    mov di, (2 * 160) + (70 * 2)
    mov al, 218
    mov ah, 0xE9  ; Yellow background
    stosw
    mov al, 196
    stosw
    mov al, 196
    stosw
    mov al, 191
    stosw
    
    mov di, (3 * 160) + (70 * 2)
    mov al, 179
    mov ah, 0xE9
    stosw
    mov al, ' '
    stosw
    stosw
    mov al, 179
    stosw
    
    mov di, (4 * 160) + (70 * 2)
    mov al, 179
    mov ah, 0xE9
    stosw
    mov al, ' '
    stosw
    stosw
    mov al, 179
    stosw
    
    mov di, (5 * 160) + (70 * 2)
    mov al, 192
    mov ah, 0xE9
    stosw
    mov al, 196
    stosw
    mov al, 196
    stosw
    mov al, 217
    stosw
    
    ; Tree 1 (left) - 
    mov ah, 0x22  ; Green leaves
    mov di, (10 * 160) + (6 * 2)
    mov al, '^'
    stosw
    mov di, (11 * 160) + (5 * 2)
    stosw
    mov di, (11 * 160) + (6 * 2)
    stosw
    mov di, (11 * 160) + (7 * 2)
    stosw
    mov di, (12 * 160) + (4 * 2)
    stosw
    mov di, (12 * 160) + (5 * 2)
    stosw
    mov di, (12 * 160) + (6 * 2)
    stosw
    mov di, (12 * 160) + (7 * 2)
    stosw
    mov di, (12 * 160) + (8 * 2)
    stosw
    
    mov ah, 0x26  ; Brown trunk
    mov di, (13 * 160) + (6 * 2)
    mov al, '|'
    stosw
    mov di, (14 * 160) + (6 * 2)
    stosw
    mov di, (15 * 160) + (6 * 2)
    stosw
    
    ; Tree 2 
    mov ah, 0x22
    mov di, (13 * 160) + (11 * 2)
    mov al, '^'
    stosw
    mov di, (14 * 160) + (10 * 2)
    stosw
    mov di, (14 * 160) + (11 * 2)
    stosw
    mov di, (14 * 160) + (12 * 2)
    stosw
    mov di, (15 * 160) + (9 * 2)
    stosw
    mov di, (15 * 160) + (10 * 2)
    stosw
    mov di, (15 * 160) + (11 * 2)
    stosw
    mov di, (15 * 160) + (12 * 2)
    stosw
    mov di, (15 * 160) + (13 * 2)
    stosw
    
    mov ah, 0x26
    mov di, (16 * 160) + (11 * 2)
    mov al, '|'
    stosw
    mov di, (17 * 160) + (11 * 2)
    stosw
   
    
    ; Right side tree 1
    mov ah, 0x22
    mov di, (8 * 160) + (69 * 2)
    mov al, '^'
    stosw
    mov di, (9 * 160) + (68 * 2)
    stosw
    mov di, (9 * 160) + (69 * 2)
    stosw
    mov di, (9 * 160) + (70 * 2)
    stosw
    mov di, (10 * 160) + (67 * 2)
    stosw
    mov di, (10 * 160) + (68 * 2)
    stosw
    mov di, (10 * 160) + (69 * 2)
    stosw
    mov di, (10 * 160) + (70 * 2)
    stosw
    mov di, (10 * 160) + (71 * 2)
    stosw
    
    mov ah, 0x26
    mov di, (11 * 160) + (69 * 2)
    mov al, '|'
    stosw
    mov di, (12 * 160) + (69 * 2)
    stosw
    mov di, (13 * 160) + (69 * 2)
    stosw
    mov di, (14 * 160) + (69 * 2)
    stosw
  
    
    jmp themeDecorDone
    
themeDecorDone:
    pop es
    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    ret

start:
    call showIntroScreen
    call showLoadingBar
    
    mov word [cs:score], 0
    mov word [cs:distance], 0
    mov word [cs:currentLevel], 1
    mov word [cs:requiredDistance], 100
    mov byte [cs:gameOver], 0
	
    mov byte [cs:pauseGame], 0
    mov word [cs:tickCount], 0
    mov word [cs:spawnCounter], 0
    mov byte [cs:playerLane], 1
    mov word [cs:playerCol], 38
    mov word [cs:gameSpeed], 4
    mov byte [cs:levelComplete], 0
	
    
    mov cx, 10
    xor si, si
clearObstacles:
    mov word [cs:obstacles + si], 0
    add si, 2
    loop clearObstacles
    
    call DrawScene
    call hookInterrupts
    
gameLoop:
    cmp byte [cs:levelComplete], 1
    je handleLevelComplete
    
    cmp byte [cs:gameOver], 1
    je crashEnd
    cmp byte [cs:gameOver], 4
    je allLevelsEnd
    
    cmp byte [cs:escPressed], 1
    je handlePause
    
    jmp gameLoop
    
handlePause:
    mov byte [cs:escPressed], 0
	call stopAllSounds
    call playPauseSound 
    call showPauseMenu
    
waitPauseInput:
    cmp byte [cs:shiftPressed], 1
    je resumeGame
    
    cmp byte [cs:escPressed], 1
    je confirmExit
    
    mov cx, 0xFFFF
pauseDelay:
    loop pauseDelay
    
    jmp waitPauseInput
    
resumeGame:
    mov byte [cs:shiftPressed], 0
    mov byte [cs:pauseGame], 0
	 call playResumeSound 
    call DrawScene
    jmp gameLoop
    
confirmExit:
    mov byte [cs:escPressed], 0
    mov byte [cs:pauseGame], 1
    
    
    call unhookInterrupts
    
    call showConfirmationDialog
    
waitConfirmInput:
    mov ah, 0
    int 0x16
    
    cmp al, 'y'
    je exitConfirmed
    cmp al, 'Y'
    je exitConfirmed
    
    cmp al, 'n'
    je exitCancelled
    cmp al, 'N'
    je exitCancelled
    
    jmp waitConfirmInput
    
exitConfirmed:
    call showThankYouScreen   
    mov ax, 0x4C00
    int 0x21
    
exitCancelled:
    mov byte [cs:pauseGame], 0
    mov byte [cs:shiftPressed], 0
    mov byte [cs:escPressed], 0
    call playResumeSound 
    call DrawScene
    
    call hookInterrupts
    
    jmp gameLoop
    
handleLevelComplete:
    mov byte [cs:levelComplete], 0
    
    call unhookInterrupts
    
    call showLevelCompleteScreen
    
waitLevelInput:
    mov ah, 0
    int 0x16
    
    ; Check for ESC
    cmp al, 27
    je confirmExit
    
    ; Check for ENTER
    cmp al, 13
    je nextLevel
    
    ; Check for SPACEBAR
    cmp al, 32
    je nextLevel
    
    jmp waitLevelInput
levelDelay:
    loop levelDelay
    
    jmp waitLevelInput
    
nextLevel:
    ; Increment level
    inc word [cs:currentLevel]
    
    ; Reset distance
    mov word [cs:distance], 0
    
    ; Increase required distance by 100m
    add word [cs:requiredDistance], 100
    
    ; Increase speed 
    cmp word [cs:gameSpeed], 2
    jle skipSpeedIncrease
    dec word [cs:gameSpeed]
    
skipSpeedIncrease:
    
    ; Clear obstacles
    mov cx, 10
    xor si, si
clearObstaclesNext:
    mov word [cs:obstacles + si], 0
    add si, 2
    loop clearObstaclesNext
    
    ; Redraw scene with new theme
    call DrawScene
    
    call hookInterrupts
    
    ; Resume game
    mov byte [cs:pauseGame], 0
    mov byte [cs:shiftPressed], 0
    mov byte [cs:escPressed], 0
    
    jmp gameLoop
    
crashEnd:
  call stopAllSounds  
    call unhookInterrupts
    call showEndScreen  ; Show CAR CRASHED screen
    
    ; Wait for input
waitCrashInput:
    mov ah, 0
    int 0x16
    
    ; Check for ESC
    cmp al, 27
    je exitFromCrash
    
    ; Check for ENTER
    cmp al, 13
    je restartFromCrash
    
    ; Check for SPACEBAR
    cmp al, 32
    je restartFromCrash
    
    jmp waitCrashInput
    
restartFromCrash:
    ; Reset new record flag
    mov byte [cs:newRecord], 0
    
    mov word [cs:score], 0
    mov word [cs:distance], 0
    mov word [cs:currentLevel], 1
    mov word [cs:requiredDistance], 100
    mov byte [cs:gameOver], 0
    mov byte [cs:pauseGame], 0
    mov word [cs:tickCount], 0
    mov word [cs:spawnCounter], 0
    mov byte [cs:playerLane], 1
    mov word [cs:playerCol], 38
    mov word [cs:gameSpeed], 4
    mov byte [cs:levelComplete], 0
    
    ; Clear obstacles
    mov cx, 10
    xor si, si
clearObstaclesCrash:
    mov word [cs:obstacles + si], 0
    add si, 2
    loop clearObstaclesCrash
    
    call DrawScene
    call hookInterrupts
    jmp gameLoop
    
exitFromCrash:
    call showThankYouScreen
    mov ax, 0x4C00
    int 0x21
    
allLevelsEnd:
call stopAllSounds
    call unhookInterrupts
    call showFreeTrialEndScreen
    
waitFreeTrialInput:
    mov ah, 0
    int 0x16
    
    ; Check for ESC
    cmp al, 27
    je exitFromFreeTrial
    
    ; Check for ENTER - restart from level 1
    cmp al, 13
    je replayFreeLevels
    
    ; Check for SPACEBAR
    cmp al, 32
    je replayFreeLevels
    
    jmp waitFreeTrialInput
    
replayFreeLevels:
    ; Reset new record flag
    mov byte [cs:newRecord], 0
    
    mov word [cs:score], 0
    mov word [cs:distance], 0
    mov word [cs:currentLevel], 1
    mov word [cs:requiredDistance], 100
    mov byte [cs:gameOver], 0
    mov byte [cs:pauseGame], 0
    mov word [cs:tickCount], 0
    mov word [cs:spawnCounter], 0
    mov byte [cs:playerLane], 1
    mov word [cs:playerCol], 38
    mov word [cs:gameSpeed], 4
    mov byte [cs:levelComplete], 0
    
    ; Clear obstacles
    mov cx, 10
    xor si, si
clearObstaclesReplay:
    mov word [cs:obstacles + si], 0
    add si, 2
    loop clearObstaclesReplay
    
    call DrawScene
    call hookInterrupts
    jmp gameLoop
    
exitFromFreeTrial:
    ; Show thank you message ONLY when exiting
    call clearScreen
    mov ax, 0xB800
    mov es, ax
    
    mov si, THANK_YOU_TRIAL
    mov dh, 12
    mov dl, 22
    mov bl, 0x0E
    call printString
    
    ; Small delay
    mov cx, 0xFFFF
exitTrialDelay1:
    push cx
    mov cx, 0x3FFF
exitTrialDelay2:
    loop exitTrialDelay2
    pop cx
    loop exitTrialDelay1
    
    call showThankYouScreen
    mov ax, 0x4C00
    int 0x21
tempBuffer: times 160 db 0