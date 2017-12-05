
val = 265149;
arraysize = 1;
posX = 1;
posY = 1;
struct[arraysize, arraysize] 0
while (!struct[posX][posY] == val) {
	posX  = arraysize
	posY = (arraysize-1)/2
	while (posY>=0) {
		struct[posX][posY] = sum(
			struct[posX-1][posY-1],
			struct[posX-1][posY],
			struct[posX-1][posY+1],
			struct[posX][posY-1],
			struct[posX][posY+1],
			struct[posX+1][posY-1],
			struct[posX+1][posY],
			struct[posX+1][posY+1],
		)
		set posY--
	}
	while (posX>=0) {
		set posX--
	}
	while (posY<arraysize) {
		set posY++
	}
	while (posX<arraysize) {
		set posX++
	}
	while (posY<(arraysize-1)/2) {
		set posY--
	}
	arraysize = arraysize + 2;
	struct = struct[arraysize, arraysize] //fill: 0, struct, 0
}
write |posX-((arraysize-1)/2)|, |posY-((arraysize-1)/2)|