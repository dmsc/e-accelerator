CL65=cl65

PROGS=\
    bin/efast.com \

all: $(PROGS)

bin/%.o: src/%.asm | bin
	$(CL65) -t atari -l $(@:%.o=%.list) -c -o $@ $^

bin/%.com: bin/%.o src/%.cfg | bin
	$(CL65) -t atari -C $(@:bin/%.com=src/%.cfg) $< -m $(@:%.com=%.map) -o $@

bin:
	mkdir $@
