; Font.com v0.1
; Load Font in to VRAM
; Moon Blaster Font

	output Font.com
	
	defpage 0,100h
	page 0
	code @ 100h


main:	
		ld a,(#f3b0)				;Current Width
		sub #29						;With > 39 
		jp nc,mode80
			ld hl,#4800				;VRAM Pointer to #0800 + bit 6 set for Write
			jp setfont

mode80:
		ld hl,#5000					;VRAM Pointer to #1000 + bit 6 set for Write

setfont:
		DI
		ld a,l
		out (#99),a					;Write High byte VRAM Pointer
		ld a,h
		out (#99),a					;Write Low byte VRAM Pointer
		EI
				
		ld de,fontend-fontstart		;Set font length
		ld hl,fontstart				;Set font begin
		
loop:
		ld a,(hl)					;Load font byte
		out (#98),a					;Write to VRAM
		inc hl						;Next font byte
		dec de						;Decrease DE counter
		ld a,d
		or e
		jp nz,loop					;Test if (D or E) = 0 
		
		ret

;------------------------------------------------
nametag:
		dw #614C,#7372,#5420,#6568,#3120,#5438,#2068
		db "(c)2014"

;------------------------------------------------
fontstart:
		db #00,#84,#84,#84,#84,#84,#84,#FC,#3C,#42,#A5,#81,#A5,#99,#42
		db #3C,#3C,#7E,#DB,#FF,#FF,#DB,#66,#3C,#6C,#FE,#FE,#FE,#7C,#38
		db #10,#00,#FF,#E7,#C3,#81,#C3,#E7,#FF,#FF,#10,#38,#54,#FE,#54
		db #10,#38,#00,#10,#38,#7C,#FE,#FE,#10,#38,#00,#00,#00,#00,#30
		db #30,#00,#00,#00,#FF,#FF,#FF,#E7,#E7,#FF,#FF,#FF,#30,#48,#84
		db #84,#84,#48,#30,#00,#CF,#B7,#7B,#7B,#7B,#B7,#CF,#FF,#00,#1C
		db #0C,#74,#90,#90,#90,#60,#38,#44,#44,#44,#38,#10,#7C,#10,#30
		db #28,#24,#24,#28,#20,#E0,#C0,#3C,#24,#3C,#24,#24,#E4,#DC,#18
		db #10,#54,#38,#EE,#38,#54,#10,#00,#10,#10,#10,#7C,#10,#10,#10
		db #10,#10,#10,#10,#FF,#00,#00,#00,#00,#00,#00,#00,#FF,#10,#10
		db #10,#10,#10,#10,#10,#F0,#10,#10,#10,#10,#10,#10,#10,#1F,#10
		db #10,#10,#10,#10,#10,#10,#FF,#10,#10,#10,#10,#10,#10,#10,#10
		db #10,#10,#10,#10,#00,#00,#00,#FF,#00,#00,#00,#00,#00,#00,#00
		db #1F,#10,#10,#10,#10,#00,#00,#00,#F0,#10,#10,#10,#10,#10,#10
		db #10,#1F,#00,#00,#00,#00,#10,#10,#10,#F0,#00,#00,#00,#00,#81
		db #42,#24,#18,#18,#24,#42,#81,#01,#02,#04,#08,#10,#20,#40,#80
		db #80,#40,#20,#10,#08,#04,#02,#01,#00,#10,#10,#FF,#10,#10,#00
		db #00,#00,#00,#00,#00,#00,#00,#00,#00,#30,#30,#30,#30,#30,#00
		db #30,#00,#28,#50,#A0,#00,#00,#00,#00,#00,#00,#50,#F8,#50,#F8
		db #50,#00,#00,#20,#F8,#A0,#F8,#28,#F8,#20,#00,#C8,#C8,#10,#20
		db #40,#98,#98,#00,#40,#A0,#40,#A8,#90,#98,#60,#00,#18,#30,#60
		db #00,#00,#00,#00,#00,#30,#60,#C0,#C0,#C0,#60,#30,#00,#30,#18
		db #0C,#0C,#0C,#18,#30,#00,#20,#A8,#70,#20,#70,#A8,#20,#00,#00
		db #20,#20,#F8,#20,#20,#00,#00,#00,#00,#00,#00,#00,#30,#30,#60
		db #00,#00,#00,#78,#00,#00,#00,#00,#00,#00,#00,#00,#00,#70,#70
		db #00,#00,#00,#08,#10,#20,#40,#80,#00,#70,#88,#98,#A8,#C8,#88
		db #70,#00,#20,#60,#A0,#20,#20,#20,#F8,#00,#70,#88,#08,#10,#60
		db #80,#F8,#00,#70,#88,#08,#30,#08,#88,#70,#00,#10,#30,#50,#90
		db #F8,#10,#10,#00,#F8,#80,#80,#70,#08,#08,#F0,#00,#70,#88,#80
		db #F0,#88,#88,#70,#00,#F8,#88,#10,#20,#20,#20,#20,#00,#70,#88
		db #88,#70,#88,#88,#70,#00,#70,#88,#88,#78,#08,#88,#70,#00,#00
		db #00,#30,#00,#00,#30,#00,#00,#00,#00,#30,#00,#00,#30,#30,#60
		db #18,#30,#60,#C0,#60,#30,#18,#00,#00,#00,#F8,#00,#F8,#00,#00
		db #00,#C0,#60,#30,#18,#30,#60,#C0,#00,#78,#84,#08,#10,#20,#00
		db #20,#00,#70,#88,#08,#68,#A8,#A8,#70,#00,#70,#88,#88,#88,#F8
		db #88,#88,#00,#F0,#88,#88,#F0,#88,#88,#F0,#00,#70,#88,#80,#80
		db #80,#88,#70,#00,#F0,#88,#88,#88,#88,#88,#F0,#00,#78,#80,#80
		db #E0,#80,#80,#78,#00,#78,#80,#80,#F0,#80,#80,#80,#00,#70,#88
		db #80,#B8,#88,#88,#70,#00,#88,#88,#88,#F8,#88,#88,#88,#00,#70
		db #20,#20,#20,#20,#20,#70,#00,#08,#08,#08,#08,#08,#88,#70,#00
		db #88,#90,#A0,#C0,#A0,#A0,#98,#00,#80,#80,#80,#80,#80,#80,#F8
		db #00,#50,#A8,#A8,#88,#88,#88,#88,#00,#70,#88,#88,#88,#88,#88
		db #88,#00,#70,#88,#88,#88,#88,#88,#70,#00,#F0,#88,#88,#F0,#80
		db #80,#80,#00,#70,#88,#88,#88,#A8,#90,#68,#00,#F0,#88,#88,#F0
		db #90,#88,#88,#00,#70,#88,#80,#70,#08,#88,#70,#00,#F8,#20,#20
		db #20,#20,#20,#20,#00,#88,#88,#88,#88,#88,#88,#70,#00,#88,#88
		db #88,#88,#90,#A0,#40,#00,#88,#88,#88,#88,#A8,#A8,#50,#00,#88
		db #88,#50,#20,#50,#88,#88,#00,#88,#88,#88,#50,#20,#20,#20,#00
		db #F8,#08,#10,#20,#40,#80,#F8,#00,#70,#40,#40,#40,#40,#40,#70
		db #00,#00,#00,#80,#40,#20,#10,#08,#00,#70,#10,#10,#10,#10,#10
		db #70,#00,#20,#50,#88,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
		db #00,#00,#AB,#40,#20,#10,#00,#00,#00,#00,#00,#00,#00,#38,#48
		db #88,#98,#68,#00,#80,#80,#E0,#90,#88,#C8,#B0,#00,#00,#00,#70
		db #88,#80,#88,#70,#00,#08,#08,#38,#48,#88,#98,#68,#00,#00,#00
		db #70,#88,#B0,#C0,#78,#00,#70,#88,#80,#80,#E0,#80,#80,#00,#00
		db #00,#78,#88,#98,#68,#08,#F0,#80,#80,#F0,#88,#88,#88,#88,#00
		db #20,#00,#20,#20,#20,#20,#20,#00,#08,#00,#08,#08,#08,#08,#88
		db #70,#40,#40,#48,#50,#60,#50,#48,#00,#40,#40,#40,#40,#40,#40
		db #38,#00,#00,#00,#D0,#A8,#A8,#A8,#A8,#00,#00,#00,#F0,#88,#88
		db #88,#88,#00,#00,#00,#70,#88,#88,#88,#70,#00,#00,#00,#E0,#90
		db #88,#F0,#80,#80,#00,#00,#38,#48,#88,#78,#08,#08,#00,#00,#70
		db #88,#80,#80,#80,#00,#00,#00,#78,#80,#F0,#08,#F0,#00,#80,#80
		db #E0,#80,#80,#88,#70,#00,#00,#00,#88,#88,#88,#88,#70,#00,#00
		db #00,#88,#88,#88,#90,#60,#00,#00,#00,#88,#A8,#A8,#A8,#50,#00
		db #00,#00,#88,#50,#20,#50,#88,#00,#00,#00,#88,#88,#88,#78,#08
		db #F0,#00,#00,#F8,#10,#20,#40,#F8,#00,#18,#20,#20,#60,#20,#20
		db #18,#00,#30,#30,#30,#00,#30,#30,#30,#00,#C0,#20,#20,#30,#20
		db #20,#C0,#00,#40,#A8,#10,#00,#00,#00,#00,#00,#00,#00,#20,#50
		db #F8,#00,#00,#00,#70,#88,#80,#80,#88,#70,#20,#60,#90,#00,#00
		db #90,#90,#90,#68,#00,#10,#20,#70,#88,#F8,#80,#70,#00,#20,#50
		db #70,#08,#78,#88,#78,#00,#48,#00,#00,#38,#48,#98,#68,#00,#20
		db #10,#00,#38,#48,#98,#68,#00,#10,#10,#00,#38,#48,#98,#68,#00
		db #00,#70,#80,#80,#80,#70,#10,#60,#20,#50,#70,#88,#F8,#80,#70
		db #00,#50,#00,#70,#88,#F8,#80,#70,#00,#20,#10,#70,#88,#F8,#80
		db #70,#00,#50,#00,#20,#20,#20,#20,#20,#00,#20,#50,#00,#20,#20
		db #20,#20,#00,#40,#20,#00,#20,#20,#20,#20,#00,#50,#00,#70,#88
		db #88,#F8,#88,#00,#20,#00,#20,#50,#88,#F8,#88,#00,#10,#20,#F8
		db #80,#F0,#80,#F8,#00,#00,#00,#2C,#52,#9E,#B0,#5E,#00,#3E,#50
		db #90,#9C,#F0,#90,#9E,#00,#60,#90,#00,#60,#90,#90,#60,#00,#90
		db #00,#00,#60,#90,#90,#60,#00,#40,#20,#00,#60,#90,#90,#60,#00
		db #40,#A0,#00,#A0,#A0,#A0,#50,#00,#40,#20,#00,#90,#90,#90,#60
		db #00,#90,#00,#90,#90,#B0,#50,#10,#E0,#50,#00,#70,#88,#88,#88
		db #70,#00,#50,#00,#88,#88,#88,#88,#70,#00,#20,#20,#78,#80,#80
		db #78,#20,#20,#18,#24,#20,#F8,#20,#E2,#5C,#00,#88,#50,#20,#F8
		db #20,#F8,#20,#00,#C0,#A0,#A0,#C8,#9C,#88,#88,#8C,#38,#40,#40
		db #70,#40,#40,#40,#80,#10,#20,#00,#38,#48,#98,#68,#00,#10,#20
		db #00,#20,#20,#20,#20,#00,#20,#40,#00,#60,#90,#90,#60,#00,#10
		db #20,#00,#88,#88,#88,#70,#00,#50,#A0,#00,#60,#90,#90,#90,#00
		db #28,#50,#00,#C8,#A8,#98,#88,#00,#00,#00,#38,#48,#98,#68,#00
		db #F8,#00,#60,#90,#90,#90,#60,#00,#F0,#30,#00,#30,#60,#C0,#D8
		db #70,#00,#00,#00,#00,#F8,#80,#80,#00,#00,#00,#00,#00,#F8,#08
		db #08,#00,#00,#84,#88,#90,#A8,#54,#84,#08,#1C,#84,#88,#90,#A8
		db #58,#A8,#3C,#08,#20,#00,#00,#20,#20,#20,#20,#00,#00,#00,#24
		db #48,#90,#48,#24,#00,#00,#00,#90,#48,#24,#48,#90,#00,#28,#50
		db #20,#50,#88,#F8,#88,#00,#28,#50,#00,#38,#48,#98,#68,#00,#28
		db #50,#00,#70,#20,#20,#70,#00,#28,#50,#00,#20,#20,#20,#20,#00
		db #28,#50,#00,#70,#88,#88,#70,#00,#50,#A0,#00,#60,#90,#90,#60
		db #00,#28,#50,#00,#88,#88,#88,#70,#00,#50,#A0,#00,#90,#90,#90
		db #60,#00,#FC,#48,#48,#48,#E8,#08,#50,#20,#88,#00,#88,#88,#88
		db #88,#08,#70,#C0,#44,#C8,#54,#EC,#54,#9E,#04,#10,#A8,#40,#00
		db #00,#00,#00,#00,#00,#20,#50,#88,#50,#20,#00,#00,#88,#10,#20
		db #40,#80,#28,#00,#00,#7C,#A8,#A8,#68,#28,#28,#28,#00,#38,#40
		db #30,#48,#48,#30,#08,#70,#00,#00,#00,#00,#00,#00,#FF,#FF,#F0
		db #F0,#F0,#F0,#0F,#0F,#0F,#0F,#00,#00,#FF,#FF,#FF,#FF,#FF,#FF
		db #FF,#FF,#00,#00,#00,#00,#00,#00,#00,#00,#00,#3C,#3C,#00,#00
		db #00,#FF,#FF,#FF,#FF,#FF,#FF,#00,#00,#C0,#C0,#C0,#C0,#C0,#C0
		db #C0,#C0,#0F,#0F,#0F,#0F,#F0,#F0,#F0,#F0,#FC,#FC,#FC,#FC,#FC
		db #FC,#FC,#FC,#03,#03,#03,#03,#03,#03,#03,#03,#3F,#3F,#3F,#3F
		db #3F,#3F,#3F,#3F,#11,#22,#44,#88,#11,#22,#44,#88,#88,#44,#22
		db #11,#88,#44,#22,#11,#FE,#7C,#38,#10,#00,#00,#00,#00,#00,#00
		db #00,#00,#10,#38,#7C,#FE,#80,#C0,#E0,#F0,#E0,#C0,#80,#00,#01
		db #03,#07,#0F,#07,#03,#01,#00,#FF,#7E,#3C,#18,#18,#3C,#7E,#FF
		db #81,#C3,#E7,#FF,#FF,#E7,#C3,#81,#F0,#F0,#F0,#F0,#00,#00,#00
		db #00,#00,#00,#00,#00,#0F,#0F,#0F,#0F,#0F,#0F,#0F,#0F,#00,#00
		db #00,#00,#00,#00,#00,#00,#F0,#F0,#F0,#F0,#33,#33,#CC,#CC,#33
		db #33,#CC,#CC,#00,#20,#20,#50,#50,#88,#F8,#00,#20,#20,#70,#20
		db #70,#20,#20,#00,#00,#00,#00,#50,#88,#A8,#50,#00,#FF,#FF,#FF
		db #FF,#FF,#FF,#FF,#FF,#00,#00,#00,#00,#FF,#FF,#FF,#FF,#F0,#F0
		db #F0,#F0,#F0,#F0,#F0,#F0,#0F,#0F,#0F,#0F,#0F,#0F,#0F,#0F,#FC
		db #FC,#FC,#FC,#CC,#CC,#48,#78,#00,#00,#68,#90,#90,#90,#68,#00
		db #30,#48,#48,#70,#48,#48,#70,#C0,#F8,#88,#80,#80,#80,#80,#80
		db #00,#F8,#50,#50,#50,#50,#50,#98,#00,#F8,#88,#40,#20,#40,#88
		db #F8,#00,#00,#00,#78,#90,#90,#90,#60,#00,#00,#50,#50,#50,#50
		db #68,#80,#80,#00,#50,#A0,#20,#20,#20,#20,#00,#F8,#20,#70,#A8
		db #A8,#70,#20,#F8,#20,#50,#88,#F8,#88,#50,#20,#00,#70,#88,#88
		db #88,#50,#50,#D8,#00,#30,#40,#40,#20,#50,#50,#50,#20,#00,#00
		db #00,#50,#A8,#A8,#50,#00,#08,#70,#A8,#A8,#A8,#70,#80,#00,#38
		db #40,#80,#F8,#80,#40,#38,#00,#70,#88,#88,#88,#88,#88,#88,#00
		db #00,#F8,#00,#F8,#00,#F8,#00,#00,#20,#20,#F8,#20,#20,#00,#F8
		db #00,#C0,#30,#08,#30,#C0,#00,#F8,#00,#18,#60,#80,#60,#18,#00
		db #F8,#00,#10,#28,#20,#20,#20,#20,#20,#20,#20,#20,#20,#20,#20
		db #20,#A0,#40,#00,#20,#00,#F8,#00,#20,#00,#00,#00,#50,#A0,#00
		db #50,#A0,#00,#00,#00,#18,#24,#24,#18,#00,#00,#00,#00,#30,#78
		db #78,#30,#00,#00,#00,#00,#00,#00,#00,#30,#00,#00,#00,#3E,#20
		db #20,#20,#A0,#60,#20,#00,#A0,#50,#50,#50,#00,#00,#00,#00,#40
		db #A0,#20,#40,#E0,#00,#00,#00,#00,#38,#38,#38,#38,#38,#38,#00
		db #70,#88,#80,#80,#E0,#7F,#7F,#FF,#00,#00,#00,#00,#00,#00,#00
		db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
		db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
		db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
		db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
		db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
		db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
		db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
		db #00,#00,#00,#00,#00,#00,#00,#00,#00
fontend:
	
	end
