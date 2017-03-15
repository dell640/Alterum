.PHONY: clean All

All:
	@echo "----------Building project:[ Alterum - Debug ]----------"
	@"$(MAKE)" -f  "Alterum.mk"
clean:
	@echo "----------Cleaning project:[ Alterum - Debug ]----------"
	@"$(MAKE)" -f  "Alterum.mk" clean
