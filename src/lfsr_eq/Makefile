DESIGN  = lfsr_equiv

formal_build: clean
	touch $(DESIGN).sby
	echo "[options]" > $(DESIGN).sby
	echo "mode prove" >> $(DESIGN).sby
	echo "[engines]" >> $(DESIGN).sby
	echo "abc pdr" >> $(DESIGN).sby
	echo "[script]" >> $(DESIGN).sby
	echo "read -formal $(DESIGN).v" >> $(DESIGN).sby
	echo "read -formal lfsr_fib.v" >> $(DESIGN).sby
	echo "read -formal lfsr_gal.v" >> $(DESIGN).sby
	echo "prep -top $(DESIGN)" >> $(DESIGN).sby
	echo "opt_merge  -share_all" >> $(DESIGN).sby
	echo "[files]" >> $(DESIGN).sby
	echo "$(DESIGN).v" >> $(DESIGN).sby
	echo "lfsr_gal.v" >> $(DESIGN).sby
	echo "lfsr_fib.v" >> $(DESIGN).sby
	echo "$(DESIGN).v" >> $(DESIGN).sby
	
formal: formal_build
	sby -f $(DESIGN).sby

clean:
	rm -rf  $(DESIGN).dot $(DESIGN).dot.pid $(DESIGN).vcd $(DESIGN).sby $(DESIGN)
