.PHONY: all zip clean

all: Game.exe MyMod.dll

v1/ModApi.dll: v1/ModApi.cs
	csc /target:library $< /out:$@

MyMod.dll: MyMod.cs v1/ModApi.dll
	csc /target:library $< /r:v1/ModApi.dll /out:$@

v2/ModApi.dll: v2/ModApi.cs
	csc /target:library $< /out:$@

v2/Support.dll: v2/Support.cs v2/ModApi.dll
	csc /target:library $< /r:v2/ModApi.dll /out:$@


Game.exe: Game.cs MyMod.dll v2/Support.dll
	csc /target:exe $< /out:$@

zip: gh-7393-mock.zip

ARTIFACTS= \
	v1/ModApi.dll \
	v2/ModApi.dll \
	v2/Support.dll \
	MyMod.dll \
	Game.exe

gh-7393-mock.zip: $(ARTIFACTS) Game.exe.config
	zip $@ $^

clean:
	rm -f $(ARTIFACTS) gh-7393-mock.zip

