PC=pdc
APP=game.pdx
SRC=source

$(APP): $(SRC)
	$(PC) $(SRC) $(APP)
	rm source/images/*.aseprite

.PHONY: clean
clean:
	rm -rf $(APP)
