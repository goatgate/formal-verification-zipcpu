DESIGN  = busyctr

formal_build: clean
	touch $(DESIGN).sby
	echo "[options]" > $(DESIGN).sby
	echo "mode bmc" >> $(DESIGN).sby
	echo "[engines]" >> $(DESIGN).sby
	echo "smtbmc" >> $(DESIGN).sby
	echo "[script]" >> $(DESIGN).sby
	echo "read -formal $(DESIGN).v" >> $(DESIGN).sby
	echo "prep -top $(DESIGN)" >> $(DESIGN).sby
	echo "[files]" >> $(DESIGN).sby
	echo "$(DESIGN).v" >> $(DESIGN).sby
	
formal: formal_build
	sby -f $(DESIGN).sby

clean:
	rm -rf  $(DESIGN).dot $(DESIGN).dot.pid $(DESIGN).vcd $(DESIGN).sby $(DESIGN)
