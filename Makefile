PC=pdc
APP=game.pdx
SRC=source

$(APP): $(SRC)
	$(PC) $^ $(APP)
	rm source/images/*.aseprite

.PHONY: clean
clean:
	rm -rf $(APP)
