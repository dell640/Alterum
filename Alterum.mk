##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=Alterum
ConfigurationName      :=Debug
WorkspacePath          := "/root/Documents/OrangePi"
ProjectPath            := "/root/Documents/OrangePi"
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=root
Date                   :=15/03/17
CodeLitePath           :="/root/.codelite"
LinkerName             :=/usr/bin/g++
SharedObjectLinkerName :=/usr/bin/g++ -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName)
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="Alterum.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). 
IncludePCH             := 
RcIncludePath          := 
Libs                   := $(LibrarySwitch)pthread 
ArLibs                 :=  "pthread" 
LibPath                := $(LibraryPathSwitch). 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := /usr/bin/ar rcu
CXX      := /usr/bin/g++
CC       := /usr/bin/gcc
CXXFLAGS :=  -pthread -g -O0 -Wall $(Preprocessors)
CFLAGS   :=  -pthread -g -O0 -Wall $(Preprocessors)
ASFLAGS  := 
AS       := /usr/bin/as


##
## User defined environment variables
##
CodeLiteDir:=/usr/share/codelite
Objects0=$(IntermediateDirectory)/main.c$(ObjectSuffix) $(IntermediateDirectory)/mytools.c$(ObjectSuffix) $(IntermediateDirectory)/crc16.c$(ObjectSuffix) $(IntermediateDirectory)/uart.c$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

MakeIntermediateDirs:
	@test -d ./Debug || $(MakeDirCommand) ./Debug


$(IntermediateDirectory)/.d:
	@test -d ./Debug || $(MakeDirCommand) ./Debug

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/main.c$(ObjectSuffix): main.c $(IntermediateDirectory)/main.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/root/Documents/OrangePi/main.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/main.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/main.c$(DependSuffix): main.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/main.c$(ObjectSuffix) -MF$(IntermediateDirectory)/main.c$(DependSuffix) -MM "main.c"

$(IntermediateDirectory)/main.c$(PreprocessSuffix): main.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/main.c$(PreprocessSuffix) "main.c"

$(IntermediateDirectory)/mytools.c$(ObjectSuffix): mytools.c $(IntermediateDirectory)/mytools.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/root/Documents/OrangePi/mytools.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/mytools.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/mytools.c$(DependSuffix): mytools.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/mytools.c$(ObjectSuffix) -MF$(IntermediateDirectory)/mytools.c$(DependSuffix) -MM "mytools.c"

$(IntermediateDirectory)/mytools.c$(PreprocessSuffix): mytools.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/mytools.c$(PreprocessSuffix) "mytools.c"

$(IntermediateDirectory)/crc16.c$(ObjectSuffix): crc16.c $(IntermediateDirectory)/crc16.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/root/Documents/OrangePi/crc16.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/crc16.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/crc16.c$(DependSuffix): crc16.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/crc16.c$(ObjectSuffix) -MF$(IntermediateDirectory)/crc16.c$(DependSuffix) -MM "crc16.c"

$(IntermediateDirectory)/crc16.c$(PreprocessSuffix): crc16.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/crc16.c$(PreprocessSuffix) "crc16.c"

$(IntermediateDirectory)/uart.c$(ObjectSuffix): uart.c $(IntermediateDirectory)/uart.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/root/Documents/OrangePi/uart.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/uart.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/uart.c$(DependSuffix): uart.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/uart.c$(ObjectSuffix) -MF$(IntermediateDirectory)/uart.c$(DependSuffix) -MM "uart.c"

$(IntermediateDirectory)/uart.c$(PreprocessSuffix): uart.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/uart.c$(PreprocessSuffix) "uart.c"


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


