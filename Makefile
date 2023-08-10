OBJS = crt.o hello.o sbi.o
TARGET = hello_sbi

CC = riscv64-unknown-elf-gcc
OBJCOPY = riscv64-unknown-elf-objcopy
CFLAGS = -Os -ffunction-sections -fdata-sections
LDFLAGS = -nostdlib -T $(TARGET).lds -Wl,--gc-sections

$(TARGET).bin: $(TARGET)
	$(OBJCOPY) -O binary $^ $@

$(TARGET): $(OBJS)
	$(CC) $(LDFLAGS) $(TARGET_ARCH) $^ $(LDLIBS) -o $@

clean:
	rm -f $(TARGET) $(TARGET).bin $(OBJS)
