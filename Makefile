PC=pdc
PDS=PlaydateSimulator
APP=game.pdx
SRC=source

$(APP): $(SRC)
	$(PC) $(SRC) $(APP)

.PHONY: clean
clean:
	rm -rf $(APP)

.PHONY: run
run:
	$(PDS) $(APP)
