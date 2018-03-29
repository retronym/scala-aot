# Scala AOT

Script to compile some of the Scala distribution with [JEP-295](http://openjdk.java.net/jeps/295)-s `jaotc`.

## Logs

```
 (java_use 11; rm -rf target/*; set -x; .  ./scala-aot.sh $HOME/scala/2.12.4)
+ . ./scala-aot.sh /Users/jz/scala/2.12.4
++ SCALA_HOME=/Users/jz/scala/2.12.4
++ mkdir -p target/classes
++ pushd target/classes

/target/classes

/target/classes 

++ for jar in $SCALA_HOME/lib/*
++ jar xf /Users/jz/scala/2.12.4/lib/jline-2.14.5.jar
++ for jar in $SCALA_HOME/lib/*
++ jar xf /Users/jz/scala/2.12.4/lib/scala-compiler.jar
++ for jar in $SCALA_HOME/lib/*
++ jar xf /Users/jz/scala/2.12.4/lib/scala-library.jar
++ for jar in $SCALA_HOME/lib/*
++ jar xf /Users/jz/scala/2.12.4/lib/scala-parser-combinators_2.12-1.0.6.jar
++ for jar in $SCALA_HOME/lib/*
++ jar xf /Users/jz/scala/2.12.4/lib/scala-reflect.jar
++ for jar in $SCALA_HOME/lib/*
++ jar xf /Users/jz/scala/2.12.4/lib/scala-swing_2.12-2.0.0.jar
++ for jar in $SCALA_HOME/lib/*
++ jar xf /Users/jz/scala/2.12.4/lib/scala-xml_2.12-1.0.6.jar
++ for jar in $SCALA_HOME/lib/*
++ jar xf /Users/jz/scala/2.12.4/lib/scalap-2.12.4.jar
++ rm -rf scala/tools/ant/
++ jar cf ../scala-all.jar META-INF compiler.properties decoder.properties interactive.properties jline library.properties org reflect.properties repl-jline.properties repl.properties rootdoc.txt scala scala-asm.properties scala-buildcharacter.properties scala-parser-combinators.properties scala-swing.properties scala-xml.properties scaladoc.properties scalap.properties
++ popd


++ jaotc -J-Xmx8G --info --ignore-errors --output scala-library.dylib --compile-for-tiered /Users/jz/scala/2.12.4/lib/scala-library.jar
Compiling scala-library.dylib...
2505 classes found (1986 ms)
47525 methods total, 45532 methods to compile (972 ms)
Compiling with 8 threads
........................................................................................................................................................................................................................................................................................................................................................................................................................................................................
45532 methods compiled, 0 methods failed (50009 ms)
Parsing compiled code (414 ms)
Processing metadata (5369 ms)
Preparing stubs binary (0 ms)
Preparing compiled binary (79 ms)
Creating binary: scala-library.o (1991 ms)
Creating shared library: scala-library.dylib (4880 ms)
Total time: 67985 ms
++ aot scala-reflect 'scala\.reflect\.internal\.*.*'
++ cat
++ jaotc -J-Xmx8G --info --ignore-errors --compile-commands compile.command --output scala-reflect.dylib --compile-for-tiered target/scala-all.jar
Compiling scala-reflect.dylib...
7748 classes found (4004 ms)
139103 methods total, 18337 methods to compile (1798 ms)
Compiling with 8 threads
........................................................................................................................................................................................
18337 methods compiled, 0 methods failed (30526 ms)
Parsing compiled code (253 ms)
Processing metadata (3473 ms)
Preparing stubs binary (0 ms)
Preparing compiled binary (32 ms)
Creating binary: scala-reflect.o (992 ms)
Creating shared library: scala-reflect.dylib (2276 ms)
Total time: 45119 ms
++ aot scala-compiler 'scala\.tools\.nsc\.*.*'
++ cat
++ jaotc -J-Xmx8G --info --ignore-errors --compile-commands compile.command --output scala-compiler.dylib --compile-for-tiered target/scala-all.jar
Compiling scala-compiler.dylib...
7748 classes found (3095 ms)
139103 methods total, 39744 methods to compile (1950 ms)
Compiling with 8 threads
............................................................Error: Failed compilation: scala.tools.nsc.profile.OtherThreadMxBean.<init>(Ljava/lang/management/ThreadMXBean;)V: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.ExceptionInInitializerError
    at parsing scala.tools.nsc.profile.OtherThreadMxBean.<init>(ExtendedThreadMxBean.java:193)
..............................Error: Failed compilation: scala.tools.nsc.interpreter.jline_embedded.InteractiveReader.<init>(Lscala/Function0;)V: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.IncompatibleClassChangeError: Inconsistent constant pool data in classfile for class scala/tools/nsc/interpreter/jline_embedded/FileBackedHistory. Method $anonfun$load$1(Lscala/collection/IndexedSeq;)Ljava/lang/String; at index 417 is CONSTANT_MethodRef and should be CONSTANT_InterfaceMethodRef
    at parsing scala.tools.nsc.interpreter.jline_embedded.FileBackedHistory.load(FileBackedHistory.scala:89)
............................................Error: Failed compilation: scala.tools.nsc.interpreter.jline_embedded.FileBackedHistory.load()V: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.IncompatibleClassChangeError: Inconsistent constant pool data in classfile for class scala/tools/nsc/interpreter/jline_embedded/FileBackedHistory. Method $anonfun$load$1(Lscala/collection/IndexedSeq;)Ljava/lang/String; at index 417 is CONSTANT_MethodRef and should be CONSTANT_InterfaceMethodRef
    at parsing scala.tools.nsc.interpreter.jline_embedded.FileBackedHistory.load(FileBackedHistory.scala:89)
Error: Failed compilation: scala.tools.nsc.interpreter.jline_embedded.FileBackedHistory.$deserializeLambda$(Ljava/lang/invoke/SerializedLambda;)Ljava/lang/Object;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.IncompatibleClassChangeError: Inconsistent constant pool data in classfile for class scala/tools/nsc/interpreter/jline_embedded/FileBackedHistory. Method $anonfun$historyFile$1(Ljava/lang/String;)Lscala/reflect/io/Path; at index 549 is CONSTANT_MethodRef and should be CONSTANT_InterfaceMethodRef
    at parsing scala.tools.nsc.interpreter.jline_embedded.FileBackedHistory.$deserializeLambda$(FileBackedHistory.scala)
Error: Failed compilation: scala.tools.nsc.interpreter.jline_embedded.FileBackedHistory.sync()V: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.IncompatibleClassChangeError: Inconsistent constant pool data in classfile for class scala/tools/nsc/interpreter/jline_embedded/FileBackedHistory. Method $anonfun$sync$1(Ljava/lang/String;)Ljava/lang/String; at index 290 is CONSTANT_MethodRef and should be CONSTANT_InterfaceMethodRef
    at parsing scala.tools.nsc.interpreter.jline_embedded.FileBackedHistory.sync(FileBackedHistory.scala:62)
Error: Failed compilation: scala.tools.nsc.interpreter.jline_embedded.FileBackedHistory.load$(Lscala/tools/nsc/interpreter/jline_embedded/FileBackedHistory;)V: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.IncompatibleClassChangeError: Inconsistent constant pool data in classfile for class scala/tools/nsc/interpreter/jline_embedded/FileBackedHistory. Method $anonfun$load$1(Lscala/collection/IndexedSeq;)Ljava/lang/String; at index 417 is CONSTANT_MethodRef and should be CONSTANT_InterfaceMethodRef
    at parsing scala.tools.nsc.interpreter.jline_embedded.FileBackedHistory.load(FileBackedHistory.scala:89)
Error: Failed compilation: scala.tools.nsc.interpreter.jline_embedded.FileBackedHistory.$init$(Lscala/tools/nsc/interpreter/jline_embedded/FileBackedHistory;)V: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.IncompatibleClassChangeError: Inconsistent constant pool data in classfile for class scala/tools/nsc/interpreter/jline_embedded/FileBackedHistory. Method $anonfun$load$1(Lscala/collection/IndexedSeq;)Ljava/lang/String; at index 417 is CONSTANT_MethodRef and should be CONSTANT_InterfaceMethodRef
    at parsing scala.tools.nsc.interpreter.jline_embedded.FileBackedHistory.load(FileBackedHistory.scala:89)
.Error: Failed compilation: scala.tools.nsc.interpreter.jline_embedded.FileBackedHistory.historyFile()Lscala/reflect/io/File;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.IncompatibleClassChangeError: Inconsistent constant pool data in classfile for class scala/tools/nsc/interpreter/jline_embedded/FileBackedHistory. Method $anonfun$secure$1(Lscala/reflect/io/Path;)Ljava/lang/String; at index 200 is CONSTANT_MethodRef and should be CONSTANT_InterfaceMethodRef
    at parsing scala.tools.nsc.interpreter.jline_embedded.FileBackedHistory.secure(FileBackedHistory.scala:36)
Error: Failed compilation: scala.tools.nsc.interpreter.jline_embedded.FileBackedHistory.sync$(Lscala/tools/nsc/interpreter/jline_embedded/FileBackedHistory;)V: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.IncompatibleClassChangeError: Inconsistent constant pool data in classfile for class scala/tools/nsc/interpreter/jline_embedded/FileBackedHistory. Method $anonfun$sync$1(Ljava/lang/String;)Ljava/lang/String; at index 290 is CONSTANT_MethodRef and should be CONSTANT_InterfaceMethodRef
    at parsing scala.tools.nsc.interpreter.jline_embedded.FileBackedHistory.sync(FileBackedHistory.scala:62)
Error: Failed compilation: scala.tools.nsc.interpreter.jline_embedded.FileBackedHistory.secure(Lscala/reflect/io/Path;)Lscala/reflect/io/Path;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.IncompatibleClassChangeError: Inconsistent constant pool data in classfile for class scala/tools/nsc/interpreter/jline_embedded/FileBackedHistory. Method $anonfun$secure$1(Lscala/reflect/io/Path;)Ljava/lang/String; at index 200 is CONSTANT_MethodRef and should be CONSTANT_InterfaceMethodRef
    at parsing scala.tools.nsc.interpreter.jline_embedded.FileBackedHistory.secure(FileBackedHistory.scala:36)
Error: Failed compilation: scala.tools.nsc.interpreter.jline_embedded.FileBackedHistory.$anonfun$load$2(Lscala/tools/nsc/interpreter/jline_embedded/FileBackedHistory;Lscala/collection/IndexedSeq;)V: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.IncompatibleClassChangeError: Inconsistent constant pool data in classfile for class scala/tools/nsc/interpreter/jline_embedded/FileBackedHistory. Method $anonfun$load$3$adapted(Lscala/tools/nsc/interpreter/jline_embedded/FileBackedHistory;Ljava/lang/CharSequence;)Ljava/lang/Object; at index 516 is CONSTANT_MethodRef and should be CONSTANT_InterfaceMethodRef
    at parsing scala.tools.nsc.interpreter.jline_embedded.FileBackedHistory.$anonfun$load$2(FileBackedHistory.scala:92)
........Error: Failed compilation: scala.tools.nsc.interpreter.jline_embedded.JLineHistory$.apply()Lscala/tools/nsc/interpreter/session/History;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.IncompatibleClassChangeError: Inconsistent constant pool data in classfile for class scala/tools/nsc/interpreter/jline_embedded/FileBackedHistory. Method $anonfun$load$1(Lscala/collection/IndexedSeq;)Ljava/lang/String; at index 417 is CONSTANT_MethodRef and should be CONSTANT_InterfaceMethodRef
    at parsing scala.tools.nsc.interpreter.jline_embedded.FileBackedHistory.load(FileBackedHistory.scala:89)
.....................Error: Failed compilation: scala.tools.nsc.profile.RealProfiler.<init>(Lscala/tools/nsc/profile/ProfileReporter;Lscala/tools/nsc/Settings;)V: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.RealProfiler.<init>(Profiler.scala:125)
Error: Failed compilation: scala.tools.nsc.profile.RealProfiler.threadMx()Lscala/tools/nsc/profile/ExtendedThreadMxBean;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.RealProfiler$
    at parsing scala.tools.nsc.profile.RealProfiler.threadMx(Profiler.scala)
Error: Failed compilation: scala.tools.nsc.profile.RealProfiler.beforeInPhase(Lscala/tools/nsc/profile/InPhase;)Lscala/tools/nsc/profile/ProfileCounters;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.RealProfiler$
    at parsing scala.tools.nsc.profile.RealProfiler.snapBackground(Profiler.scala:151)
Error: Failed compilation: scala.tools.nsc.profile.RealProfiler.classLoaderMx()Ljava/lang/management/ClassLoadingMXBean;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.RealProfiler$
    at parsing scala.tools.nsc.profile.RealProfiler.classLoaderMx(Profiler.scala)
Error: Failed compilation: scala.tools.nsc.profile.RealProfiler.compileMx()Ljava/lang/management/CompilationMXBean;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.RealProfiler$
    at parsing scala.tools.nsc.profile.RealProfiler.compileMx(Profiler.scala)
Error: Failed compilation: scala.tools.nsc.profile.RealProfiler.gcMx()Lscala/collection/immutable/List;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.RealProfiler$
    at parsing scala.tools.nsc.profile.RealProfiler.gcMx(Profiler.scala)
Error: Failed compilation: scala.tools.nsc.profile.RealProfiler.afterInPhase(Lscala/tools/nsc/profile/InPhase;Lscala/tools/nsc/profile/ProfileCounters;J)V: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.RealProfiler$
    at parsing scala.tools.nsc.profile.RealProfiler.snapBackground(Profiler.scala:151)
Error: Failed compilation: scala.tools.nsc.profile.RealProfiler.runtimeMx()Ljava/lang/management/RuntimeMXBean;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.RealProfiler$
    at parsing scala.tools.nsc.profile.RealProfiler.runtimeMx(Profiler.scala)
Error: Failed compilation: scala.tools.nsc.profile.RealProfiler.memoryMx()Ljava/lang/management/MemoryMXBean;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.RealProfiler$
    at parsing scala.tools.nsc.profile.RealProfiler.memoryMx(Profiler.scala)
Error: Failed compilation: scala.tools.nsc.profile.RealProfiler.snap()Lscala/tools/nsc/profile/ProfileCounters;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.RealProfiler$
    at parsing scala.tools.nsc.profile.RealProfiler.snap(Profiler.scala:138)
Error: Failed compilation: scala.tools.nsc.profile.RealProfiler.snapBackground(J)Lscala/tools/nsc/profile/ProfileCounters;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.RealProfiler$
    at parsing scala.tools.nsc.profile.RealProfiler.snapBackground(Profiler.scala:151)
Error: Failed compilation: scala.tools.nsc.profile.RealProfiler.afterPhase(Lscala/reflect/internal/Phase;Lscala/tools/nsc/profile/ProfileCounters;)V: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.RealProfiler$
    at parsing scala.tools.nsc.profile.RealProfiler.snap(Profiler.scala:138)
Error: Failed compilation: scala.tools.nsc.profile.RealProfiler.finished()V: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.RealProfiler$
    at parsing scala.tools.nsc.profile.RealProfiler.finished(Profiler.scala:169)
Error: Failed compilation: scala.tools.nsc.profile.RealProfiler.beforePhase(Lscala/reflect/internal/Phase;)Lscala/tools/nsc/profile/ProfileCounters;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.RealProfiler$
    at parsing scala.tools.nsc.profile.RealProfiler.snap(Profiler.scala:138)
.....Error: Failed compilation: scala.tools.nsc.profile.SunThreadMxBean.<init>(Ljava/lang/management/ThreadMXBean;)V: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.SunThreadMxBean.<init>(ExtendedThreadMxBean.java:248)
........Error: Failed compilation: scala.tools.nsc.interpreter.jline_embedded.JLineHistory.$deserializeLambda$(Ljava/lang/invoke/SerializedLambda;)Ljava/lang/Object;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.IncompatibleClassChangeError: Inconsistent constant pool data in classfile for class scala/tools/nsc/interpreter/jline_embedded/JLineHistory. Method $anonfun$historicize$1$adapted(Lscala/tools/nsc/interpreter/jline_embedded/JLineHistory;Ljava/lang/CharSequence;)Ljava/lang/Object; at index 102 is CONSTANT_MethodRef and should be CONSTANT_InterfaceMethodRef
    at parsing scala.tools.nsc.interpreter.jline_embedded.JLineHistory.$deserializeLambda$(JLineHistory.scala)
Error: Failed compilation: scala.tools.nsc.interpreter.jline_embedded.JLineHistory.apply()Lscala/tools/nsc/interpreter/session/History;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.IncompatibleClassChangeError: Inconsistent constant pool data in classfile for class scala/tools/nsc/interpreter/jline_embedded/FileBackedHistory. Method $anonfun$load$1(Lscala/collection/IndexedSeq;)Ljava/lang/String; at index 417 is CONSTANT_MethodRef and should be CONSTANT_InterfaceMethodRef
    at parsing scala.tools.nsc.interpreter.jline_embedded.FileBackedHistory.load(FileBackedHistory.scala:89)
Error: Failed compilation: scala.tools.nsc.interpreter.jline_embedded.JLineHistory.historicize(Ljava/lang/String;)Z: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.IncompatibleClassChangeError: Inconsistent constant pool data in classfile for class scala/tools/nsc/interpreter/jline_embedded/JLineHistory. Method $anonfun$historicize$1$adapted(Lscala/tools/nsc/interpreter/jline_embedded/JLineHistory;Ljava/lang/CharSequence;)Ljava/lang/Object; at index 102 is CONSTANT_MethodRef and should be CONSTANT_InterfaceMethodRef
    at parsing scala.tools.nsc.interpreter.jline_embedded.JLineHistory.historicize(JLineHistory.scala:43)
Error: Failed compilation: scala.tools.nsc.interpreter.jline_embedded.JLineHistory.historicize$(Lscala/tools/nsc/interpreter/jline_embedded/JLineHistory;Ljava/lang/String;)Z: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.IncompatibleClassChangeError: Inconsistent constant pool data in classfile for class scala/tools/nsc/interpreter/jline_embedded/JLineHistory. Method $anonfun$historicize$1$adapted(Lscala/tools/nsc/interpreter/jline_embedded/JLineHistory;Ljava/lang/CharSequence;)Ljava/lang/Object; at index 102 is CONSTANT_MethodRef and should be CONSTANT_InterfaceMethodRef
    at parsing scala.tools.nsc.interpreter.jline_embedded.JLineHistory.historicize(JLineHistory.scala:43)
.............................................................................................................Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.<init>(Ljava/lang/management/ThreadMXBean;)V: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.<init>(ExtendedThreadMxBean.java:32)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.getThreadUserTime(J)J: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.getThreadUserTime(ExtendedThreadMxBean.java:127)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.getThreadCpuTime(J)J: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.getThreadCpuTime(ExtendedThreadMxBean.java:122)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.getThreadCount()I: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.getThreadCount(ExtendedThreadMxBean.java:52)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.getPeakThreadCount()I: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.getPeakThreadCount(ExtendedThreadMxBean.java:57)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.getTotalStartedThreadCount()J: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.getTotalStartedThreadCount(ExtendedThreadMxBean.java:62)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.getDaemonThreadCount()I: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.getDaemonThreadCount(ExtendedThreadMxBean.java:67)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.getAllThreadIds()[J: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.getAllThreadIds(ExtendedThreadMxBean.java:72)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.getThreadInfo([JI)[Ljava/lang/management/ThreadInfo;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.getThreadInfo(ExtendedThreadMxBean.java:92)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.getThreadInfo(J)Ljava/lang/management/ThreadInfo;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.getThreadInfo(ExtendedThreadMxBean.java:77)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.getThreadInfo([JZZ)[Ljava/lang/management/ThreadInfo;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.getThreadInfo(ExtendedThreadMxBean.java:177)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.getThreadInfo([J)[Ljava/lang/management/ThreadInfo;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.getThreadInfo(ExtendedThreadMxBean.java:82)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.getThreadInfo(JI)Ljava/lang/management/ThreadInfo;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.getThreadInfo(ExtendedThreadMxBean.java:87)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.isThreadContentionMonitoringSupported()Z: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.isThreadContentionMonitoringSupported(ExtendedThreadMxBean.java:97)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.isThreadContentionMonitoringEnabled()Z: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.isThreadContentionMonitoringEnabled(ExtendedThreadMxBean.java:102)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.setThreadContentionMonitoringEnabled(Z)V: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.setThreadContentionMonitoringEnabled(ExtendedThreadMxBean.java:107)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.getCurrentThreadCpuTime()J: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.getCurrentThreadCpuTime(ExtendedThreadMxBean.java:112)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.getCurrentThreadUserTime()J: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.getCurrentThreadUserTime(ExtendedThreadMxBean.java:117)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.isCurrentThreadCpuTimeSupported()Z: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.isCurrentThreadCpuTimeSupported(ExtendedThreadMxBean.java:137)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.isThreadCpuTimeEnabled()Z: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.isThreadCpuTimeEnabled(ExtendedThreadMxBean.java:142)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.setThreadCpuTimeEnabled(Z)V: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.setThreadCpuTimeEnabled(ExtendedThreadMxBean.java:147)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.findMonitorDeadlockedThreads()[J: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.findMonitorDeadlockedThreads(ExtendedThreadMxBean.java:152)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.resetPeakThreadCount()V: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.resetPeakThreadCount(ExtendedThreadMxBean.java:157)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.findDeadlockedThreads()[J: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.findDeadlockedThreads(ExtendedThreadMxBean.java:162)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.isObjectMonitorUsageSupported()Z: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.isObjectMonitorUsageSupported(ExtendedThreadMxBean.java:167)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.isThreadCpuTimeSupported()Z: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.isThreadCpuTimeSupported(ExtendedThreadMxBean.java:132)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.dumpAllThreads(ZZ)[Ljava/lang/management/ThreadInfo;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.dumpAllThreads(ExtendedThreadMxBean.java:182)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.<clinit>()V: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.<clinit>(ExtendedThreadMxBean.java:21)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.isSynchronizerUsageSupported()Z: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.isSynchronizerUsageSupported(ExtendedThreadMxBean.java:172)
Error: Failed compilation: scala.tools.nsc.profile.ExtendedThreadMxBean.getObjectName()Ljavax/management/ObjectName;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.ExtendedThreadMxBean
    at parsing scala.tools.nsc.profile.ExtendedThreadMxBean.getObjectName(ExtendedThreadMxBean.java:187)
............................Error: Failed compilation: scala.tools.nsc.profile.Profiler$.apply(Lscala/tools/nsc/Settings;)Lscala/tools/nsc/profile/Profiler;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.RealProfiler$
    at parsing scala.tools.nsc.profile.RealProfiler.<init>(Profiler.scala:125)
.......................................Error: Failed compilation: scala.tools.nsc.profile.RealProfiler$.<init>()V: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.RealProfiler$
    at parsing scala.tools.nsc.profile.RealProfiler$.<init>(Profiler.scala:122)
Error: Failed compilation: scala.tools.nsc.profile.RealProfiler$.classLoaderMx()Ljava/lang/management/ClassLoadingMXBean;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.RealProfiler$
    at parsing scala.tools.nsc.profile.RealProfiler$.classLoaderMx(Profiler.scala:115)
Error: Failed compilation: scala.tools.nsc.profile.RealProfiler$.threadMx()Lscala/tools/nsc/profile/ExtendedThreadMxBean;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.RealProfiler$
    at parsing scala.tools.nsc.profile.RealProfiler$.threadMx(Profiler.scala:117)
Error: Failed compilation: scala.tools.nsc.profile.RealProfiler$.compileMx()Ljava/lang/management/CompilationMXBean;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.RealProfiler$
    at parsing scala.tools.nsc.profile.RealProfiler$.compileMx(Profiler.scala:116)
Error: Failed compilation: scala.tools.nsc.profile.RealProfiler$.gcMx()Lscala/collection/immutable/List;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.RealProfiler$
    at parsing scala.tools.nsc.profile.RealProfiler$.gcMx(Profiler.scala:114)
Error: Failed compilation: scala.tools.nsc.profile.RealProfiler$.memoryMx()Ljava/lang/management/MemoryMXBean;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.RealProfiler$
    at parsing scala.tools.nsc.profile.RealProfiler$.memoryMx(Profiler.scala:113)
Error: Failed compilation: scala.tools.nsc.profile.RealProfiler$.runtimeMx()Ljava/lang/management/RuntimeMXBean;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.RealProfiler$
    at parsing scala.tools.nsc.profile.RealProfiler$.runtimeMx(Profiler.scala:112)
Error: Failed compilation: scala.tools.nsc.profile.RealProfiler$.scala$tools$nsc$profile$RealProfiler$$idGen()Ljava/util/concurrent/atomic/AtomicInteger;: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.RealProfiler$
    at parsing scala.tools.nsc.profile.RealProfiler$.scala$tools$nsc$profile$RealProfiler$$idGen(Profiler.scala:119)
Error: Failed compilation: scala.tools.nsc.profile.RealProfiler$.<clinit>()V: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.NoClassDefFoundError: Could not initialize class scala.tools.nsc.profile.RealProfiler$
    at parsing scala.tools.nsc.profile.RealProfiler$.<clinit>(Profiler.scala)
...........................................Error: Failed compilation: scala.tools.nsc.interpreter.jline_embedded.JLineHistory$JLineFileHistory.<init>()V: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.IncompatibleClassChangeError: Inconsistent constant pool data in classfile for class scala/tools/nsc/interpreter/jline_embedded/FileBackedHistory. Method $anonfun$load$1(Lscala/collection/IndexedSeq;)Ljava/lang/String; at index 417 is CONSTANT_MethodRef and should be CONSTANT_InterfaceMethodRef
    at parsing scala.tools.nsc.interpreter.jline_embedded.FileBackedHistory.load(FileBackedHistory.scala:89)
Error: Failed compilation: scala.tools.nsc.interpreter.jline_embedded.JLineHistory$JLineFileHistory.load()V: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.IncompatibleClassChangeError: Inconsistent constant pool data in classfile for class scala/tools/nsc/interpreter/jline_embedded/FileBackedHistory. Method $anonfun$load$1(Lscala/collection/IndexedSeq;)Ljava/lang/String; at index 417 is CONSTANT_MethodRef and should be CONSTANT_InterfaceMethodRef
    at parsing scala.tools.nsc.interpreter.jline_embedded.FileBackedHistory.load(FileBackedHistory.scala:89)
Error: Failed compilation: scala.tools.nsc.interpreter.jline_embedded.JLineHistory$JLineFileHistory.sync()V: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.IncompatibleClassChangeError: Inconsistent constant pool data in classfile for class scala/tools/nsc/interpreter/jline_embedded/FileBackedHistory. Method $anonfun$sync$1(Ljava/lang/String;)Ljava/lang/String; at index 290 is CONSTANT_MethodRef and should be CONSTANT_InterfaceMethodRef
    at parsing scala.tools.nsc.interpreter.jline_embedded.FileBackedHistory.sync(FileBackedHistory.scala:62)
Error: Failed compilation: scala.tools.nsc.interpreter.jline_embedded.JLineHistory$JLineFileHistory.historicize(Ljava/lang/String;)Z: org.graalvm.compiler.java.BytecodeParser$BytecodeParserError: java.lang.IncompatibleClassChangeError: Inconsistent constant pool data in classfile for class scala/tools/nsc/interpreter/jline_embedded/JLineHistory. Method $anonfun$historicize$1$adapted(Lscala/tools/nsc/interpreter/jline_embedded/JLineHistory;Ljava/lang/CharSequence;)Ljava/lang/Object; at index 102 is CONSTANT_MethodRef and should be CONSTANT_InterfaceMethodRef
    at parsing scala.tools.nsc.interpreter.jline_embedded.JLineHistory.historicize(JLineHistory.scala:43)
.
39669 methods compiled, 75 methods failed (82558 ms)
Parsing compiled code (573 ms)
Processing metadata (8903 ms)
Preparing stubs binary (0 ms)
Preparing compiled binary (116 ms)
Creating binary: scala-compiler.o (4223 ms)
Creating shared library: scala-compiler.dylib (10061 ms)
Total time: 114587 ms
```

That produces:

```
⚡ ls -lh *.dylib
-rw-r--r--  1 jz  staff   302M Mar 28 14:48 scala-compiler.dylib
-rw-r--r--  1 jz  staff   173M Mar 28 14:46 scala-library.dylib
-rw-r--r--  1 jz  staff    96M Mar 28 14:47 scala-reflect.dylib
```

Confirm they are getting picked up:

```


⚡ (java_use 11; scala -nc -J-XX:+UseAOT -J-XX:+PrintAOT -J-XX:AOTLibrary=scala-compiler.dylib,scala-library.dylib,scala-reflect.dylib -e 'println(42)') | head -n 1000 | tail -n 10
    189  872     aot[ 2]   scala.DeprecatedPredef.any2Ensuring$(Lscala/DeprecatedPredef;Ljava/lang/Object;)Ljava/lang/Object;
    189  873     aot[ 2]   scala.DeprecatedPredef.readf3$(Lscala/DeprecatedPredef;Ljava/lang/String;)Lscala/Tuple3;
    189  874     aot[ 2]   scala.DeprecatedPredef.readLong()J
    189  875     aot[ 2]   scala.DeprecatedPredef.any2stringfmt$(Lscala/DeprecatedPredef;Ljava/lang/Object;)Ljava/lang/Object;
    189  876     aot[ 2]   scala.DeprecatedPredef.seqToCharSequence(Lscala/collection/IndexedSeq;)Ljava/lang/CharSequence;
    189  877     aot[ 2]   scala.DeprecatedPredef.exceptionWrapper$(Lscala/DeprecatedPredef;Ljava/lang/Throwable;)Ljava/lang/Throwable;
    189  878     aot[ 2]   scala.DeprecatedPredef.seqToCharSequence$(Lscala/DeprecatedPredef;Lscala/collection/IndexedSeq;)Ljava/lang/CharSequence;
    189  879     aot[ 2]   scala.DeprecatedPredef.arrayToCharSequence$(Lscala/DeprecatedPredef;[C)Ljava/lang/CharSequence;
    189  880     aot[ 2]   scala.DeprecatedPredef.readShort()S
    189  881     aot[ 2]   scala.DeprecatedPredef.readBoolean()Z

```

Without AOT:

```
⚡ (java_use 11; time scala -nc -J-XX:-UseAOT -J-XX:-PrintAOT -J-XX:AOTLibrary=scala-compiler.dylib,scala-library.dylib,scala-reflect.dylib -e 'println(42)')
42

real    0m1.909s
user    0m6.083s
sys 0m0.195s


⚡ (java_use 11; time scala -nc -J-XX:-UseAOT -J-XX:-PrintAOT -J-XX:AOTLibrary=scala-compiler.dylib,scala-library.dylib,scala-reflect.dylib -e 'println(42)')
42

real    0m1.899s
user    0m6.107s
sys 0m0.189s
```

With AOT:

```
⚡ (java_use 11; time scala -nc -J-XX:+UseAOT -J-XX:-PrintAOT -J-XX:AOTLibrary=scala-compiler.dylib,scala-library.dylib,scala-reflect.dylib -e 'println(42)')
42

real    0m11.702s
user    0m5.380s
sys 0m0.437s


⚡ (java_use 11; time scala -nc -J-XX:+UseAOT -J-XX:-PrintAOT -J-XX:AOTLibrary=scala-compiler.dylib,scala-library.dylib,scala-reflect.dylib -e 'println(42)')
42

real    0m2.209s
user    0m4.947s
sys 0m0.315s


⚡ (java_use 11; time scala -nc -J-XX:+UseAOT -J-XX:-PrintAOT -J-XX:AOTLibrary=scala-compiler.dylib,scala-library.dylib,scala-reflect.dylib -e 'println(42)')
42

real    0m1.991s
user    0m4.672s
sys 0m0.258s


⚡ (java_use 11; time scala -nc -J-XX:+UseAOT -J-XX:-PrintAOT -J-XX:AOTLibrary=scala-compiler.dylib,scala-library.dylib,scala-reflect.dylib -e 'println(42)')
42

real    0m2.151s
user    0m5.921s
sys 0m0.321s


⚡ (java_use 11; time scala -nc -J-XX:+UseAOT -J-XX:-PrintAOT -J-XX:AOTLibrary=scala-compiler.dylib,scala-library.dylib,scala-reflect.dylib -e 'println(42)')
42

real    0m2.091s
user    0m5.325s
sys 0m0.275s
```

## Notes

  - The exception handling in [jaot.collect.ClassSearch](http://hg.openjdk.java.net/jdk10/jdk10/hotspot/file/5ab7a67bc155/src/jdk.aot/share/classes/jdk.tools.jaotc/src/jdk/tools/jaotc/collect/ClassSearch.java#l58) appears wrong to me, it only catches `ClassNotFoundException` and lets `NoClassDefFoundException`, which happens when loading a class file with dangling references to somethign absent from the classpath.
  - We don't see any startup benefit from AOT. Why is that? Should we selectively AOT only the hottest methods?

## JMH Warmup Benchmark

### Without AOT

```
> set scalaVersion in compilation := "2.12.4"
[info] Defining compilation/*:scalaVersion
[info] The new value will be used by compilation/*:allDependencies, compilation/*:evicted and 22 others.
[info]  Run `last` for details.
[info] Reapplying settings...
[info] Set current project to compiler-benchmark (in build file:/Users/jz/code/compiler-benchmark/)
> cold -psource=scalap -jvm /Library/Java/JavaVirtualMachines/jdk-11.jdk/Contents/Home/bin/java -jvmArgs -XX:AOTLibrary=/code/scala-aot/scala-compiler.dylib,/code/scala-aot/scala-library.dylib,/code/scala-aot/scala-reflect.dylib -jvmArgs -XX:-UseAOT -f1 -i 10
Processing 47 classes from /Users/jz/code/compiler-benchmark/compilation/target/scala-2.12/classes with "reflection" generator
Writing out Java source to /Users/jz/code/compiler-benchmark/compilation/target/scala-2.12/src_managed/jmh and resources to /Users/jz/code/compiler-benchmark/compilation/target/scala-2.12/resource_managed/jmh
[info] Running scala.bench.ScalacBenchmarkRunner ColdScalacBenchmark -foe true -psource=scalap -jvm /Library/Java/JavaVirtualMachines/jdk-11.jdk/Contents/Home/bin/java -jvmArgs -XX:AOTLibrary=/code/scala-aot/scala-compiler.dylib,/code/scala-aot/scala-library.dylib,/code/scala-aot/scala-reflect.dylib -jvmArgs -XX:-UseAOT -f1 -i 10
[info] # JMH version: 1.19
[info] # VM version: JDK 11-ea, VM 11-ea+5
[info] # VM invoker: /Library/Java/JavaVirtualMachines/jdk-11.jdk/Contents/Home/bin/java
[info] # VM options: -XX:AOTLibrary=/code/scala-aot/scala-compiler.dylib,/code/scala-aot/scala-library.dylib,/code/scala-aot/scala-reflect.dylib -XX:-UseAOT
[info] # Warmup: <none>
[info] # Measurement: 10 iterations, single-shot each
[info] # Timeout: 10 min per iteration
[info] # Threads: 1 thread
[info] # Benchmark mode: Single shot invocation time
[info] # Benchmark: scala.tools.nsc.ColdScalacBenchmark.compile
[info] # Parameters: (corpusVersion = a8c43dc, extraArgs = , resident = false, source = scalap)
[info]
[info] # Run progress: 0.00% complete, ETA 00:00:00
[info] # Fork: 1 of 1
[info] Iteration   1: 8466.689 ms/op
[info] Iteration   2: 3186.820 ms/op
[info] Iteration   3: 2498.745 ms/op
[info] Iteration   4: 2135.949 ms/op
[info] Iteration   5: 1972.050 ms/op
[info] Iteration   6: 1816.388 ms/op
[info] Iteration   7: 1935.112 ms/op
[info] Iteration   8: 1687.619 ms/op
[info] Iteration   9: 1603.563 ms/op
[info] Iteration  10: 1470.171 ms/op
[info]
[info]
[info] Result "scala.tools.nsc.ColdScalacBenchmark.compile":
[info]   N = 10
[info]   mean =   2677.311 ±(99.9%) 3166.510 ms/op
[info]
[info]   Histogram, ms/op:
[info]     [1000.000, 1500.000) = 1
[info]     [1500.000, 2000.000) = 5
[info]     [2000.000, 2500.000) = 2
[info]     [2500.000, 3000.000) = 0
[info]     [3000.000, 3500.000) = 1
[info]     [3500.000, 4000.000) = 0
[info]     [4000.000, 4500.000) = 0
[info]     [4500.000, 5000.000) = 0
[info]     [5000.000, 5500.000) = 0
[info]     [5500.000, 6000.000) = 0
[info]     [6000.000, 6500.000) = 0
[info]     [6500.000, 7000.000) = 0
[info]     [7000.000, 7500.000) = 0
[info]     [7500.000, 8000.000) = 0
[info]     [8000.000, 8500.000) = 1
[info]
[info]   Percentiles, ms/op:
[info]       p(0.0000) =   1470.171 ms/op
[info]      p(50.0000) =   1953.581 ms/op
[info]      p(90.0000) =   7938.702 ms/op
[info]      p(95.0000) =   8466.689 ms/op
[info]      p(99.0000) =   8466.689 ms/op
[info]      p(99.9000) =   8466.689 ms/op
[info]      p(99.9900) =   8466.689 ms/op
[info]      p(99.9990) =   8466.689 ms/op
[info]      p(99.9999) =   8466.689 ms/op
[info]     p(100.0000) =   8466.689 ms/op
[info]
[info]
[info] # Run complete. Total time: 00:00:27
[info]
[info] Benchmark                    (corpusVersion)  (extraArgs)  (resident)  (source)  Mode  Cnt     Score      Error  Units
[info] ColdScalacBenchmark.compile          a8c43dc                    false    scalap    ss   10  2677.311 ± 3166.510  ms/op
[success] Total time: 30 s, completed 28/03/2018 3:05:26 PM
```

### With AOT

```
> cold -psource=scalap -jvm /Library/Java/JavaVirtualMachines/jdk-11.jdk/Contents/Home/bin/java -jvmArgs -XX:AOTLibrary=/code/scala-aot/scala-compiler.dylib,/code/scala-aot/scala-library.dylib,/code/scala-aot/scala-reflect.dylib -jvmArgs -XX:+UseAOT -f1 -i 10
Processing 47 classes from /Users/jz/code/compiler-benchmark/compilation/target/scala-2.12/classes with "reflection" generator
Writing out Java source to /Users/jz/code/compiler-benchmark/compilation/target/scala-2.12/src_managed/jmh and resources to /Users/jz/code/compiler-benchmark/compilation/target/scala-2.12/resource_managed/jmh
[info] Running scala.bench.ScalacBenchmarkRunner ColdScalacBenchmark -foe true -psource=scalap -jvm /Library/Java/JavaVirtualMachines/jdk-11.jdk/Contents/Home/bin/java -jvmArgs -XX:AOTLibrary=/code/scala-aot/scala-compiler.dylib,/code/scala-aot/scala-library.dylib,/code/scala-aot/scala-reflect.dylib -jvmArgs -XX:+UseAOT -f1 -i 10
[info] # JMH version: 1.19
[info] # VM version: JDK 11-ea, VM 11-ea+5
[info] # VM invoker: /Library/Java/JavaVirtualMachines/jdk-11.jdk/Contents/Home/bin/java
[info] # VM options: -XX:AOTLibrary=/code/scala-aot/scala-compiler.dylib,/code/scala-aot/scala-library.dylib,/code/scala-aot/scala-reflect.dylib -XX:+UseAOT
[info] # Warmup: <none>
[info] # Measurement: 10 iterations, single-shot each
[info] # Timeout: 10 min per iteration
[info] # Threads: 1 thread
[info] # Benchmark mode: Single shot invocation time
[info] # Benchmark: scala.tools.nsc.ColdScalacBenchmark.compile
[info] # Parameters: (corpusVersion = a8c43dc, extraArgs = , resident = false, source = scalap)
[info]
[info] # Run progress: 0.00% complete, ETA 00:00:00
[info] # Fork: 1 of 1
[info] Iteration   1: 25385.386 ms/op
[info] Iteration   2: 4338.834 ms/op
[info] Iteration   3: 3273.075 ms/op
[info] Iteration   4: 2928.250 ms/op
[info] Iteration   5: 2575.440 ms/op
[info] Iteration   6: 2443.897 ms/op
[info] Iteration   7: 2490.425 ms/op
[info] Iteration   8: 2026.930 ms/op
[info] Iteration   9: 2184.777 ms/op
[info] Iteration  10: 1762.112 ms/op
[info]
[info]
[info] Result "scala.tools.nsc.ColdScalacBenchmark.compile":
[info]   N = 10
[info]   mean =   4940.913 ±(99.9%) 10916.118 ms/op
[info]
[info]   Histogram, ms/op:
[info]     [    0.000,  2500.000) = 5
[info]     [ 2500.000,  5000.000) = 4
[info]     [ 5000.000,  7500.000) = 0
[info]     [ 7500.000, 10000.000) = 0
[info]     [10000.000, 12500.000) = 0
[info]     [12500.000, 15000.000) = 0
[info]     [15000.000, 17500.000) = 0
[info]     [17500.000, 20000.000) = 0
[info]     [20000.000, 22500.000) = 0
[info]     [22500.000, 25000.000) = 0
[info]     [25000.000, 27500.000) = 1
[info]
[info]   Percentiles, ms/op:
[info]       p(0.0000) =   1762.112 ms/op
[info]      p(50.0000) =   2532.933 ms/op
[info]      p(90.0000) =  23280.731 ms/op
[info]      p(95.0000) =  25385.386 ms/op
[info]      p(99.0000) =  25385.386 ms/op
[info]      p(99.9000) =  25385.386 ms/op
[info]      p(99.9900) =  25385.386 ms/op
[info]      p(99.9990) =  25385.386 ms/op
[info]      p(99.9999) =  25385.386 ms/op
[info]     p(100.0000) =  25385.386 ms/op
[info]
[info]
[info] # Run complete. Total time: 00:00:50
[info]
[info] Benchmark                    (corpusVersion)  (extraArgs)  (resident)  (source)  Mode  Cnt     Score       Error  Units
[info] ColdScalacBenchmark.compile          a8c43dc                    false    scalap    ss   10  4940.913 ± 10916.118  ms/op
```

## Effect of AppCDS

```
% java -version
openjdk version "11-ea" 2018-09-18
OpenJDK Runtime Environment 18.9 (build 11-ea+5)
OpenJDK 64-Bit Server VM 18.9 (build 11-ea+5, mixed mode)

% scala  -nc -J-XX:+UnlockDiagnosticVMOptions -J-Xshare:off -J-XX:+UseAppCDS  -J-XX:DumpLoadedClassList=scala.lst -e 'println("".reverse)'


% scala -nc -J-Xshare:dump -J-XX:+UseAppCDS -J-XX:SharedClassListFile=scala.lst  -J-XX:+UnlockDiagnosticVMOptions -J-XX:SharedArchiveFile=scala.jsa  -e 'println("foo".reverse)'
narrow_klass_base = 0x0000000800000000, narrow_klass_shift = 3
Allocated temporary class space: 1073741824 bytes at 0x00000008c0000000
Allocated shared space: 3221225472 bytes at 0x0000000800000000
Loading classes to share ...
Loading classes to share: done.
Rewriting and linking classes ...
Rewriting and linking classes: done
Number of classes 2999
    instance classes   =  2937
    obj array classes  =    54
    type array classes =     8
Updating ConstMethods ... done.
Removing unshareable information ... done.
Scanning all metaspace objects ...
Allocating RW objects ...
Allocating RO objects ...
Relocating embedded pointers ...
Relocating external roots ...
Dumping symbol table ...
Dumping String objects to closed archive heap region ...
Dumping objects to open archive heap region ...
Relocating SystemDictionary::_well_known_klasses[] ...
Removing java_mirror ... done.
mc  space:      9232 [  0.0% of total] out of     12288 bytes [ 75.1% used] at 0x0000000800000000
rw  space:  14409072 [ 22.4% of total] out of  14409728 bytes [100.0% used] at 0x0000000800003000
ro  space:  25096768 [ 39.1% of total] out of  25100288 bytes [100.0% used] at 0x0000000800dc1000
md  space:      6160 [  0.0% of total] out of      8192 bytes [ 75.2% used] at 0x00000008025b1000
od  space:  23205592 [ 36.1% of total] out of  23207936 bytes [100.0% used] at 0x00000008025b3000
st0 space:    290816 [  0.5% of total] out of    290816 bytes [100.0% used] at 0x00000007bfe00000
st1 space:   1048576 [  1.6% of total] out of   1048576 bytes [100.0% used] at 0x00000007bff00000
oa0 space:    172032 [  0.3% of total] out of    172032 bytes [100.0% used] at 0x00000007bfd00000
total    :  64238248 [100.0% of total] out of  64249856 bytes [100.0% used]

% ls -lh scala.lst scala.jsa
-r--r--r--  1 jz  staff    61M Mar 29 13:27 scala.jsa
-rw-r--r--  1 jz  staff   111K Mar 29 13:27 scala.lst

% time scala -nc -J-Xshare:on -J-XX:+UseAppCDS -J-XX:+UnlockDiagnosticVMOptions -J-XX:SharedArchiveFile=scala.jsa  -e 'println("foo".reverse)'
oof

real    0m1.548s
user    0m5.874s
sys 0m0.235s

% time scala -nc -J-Xshare:on -J-XX:+UseAppCDS -J-XX:+UnlockDiagnosticVMOptions  -e 'println("foo".reverse)'
oof

real    0m2.033s
user    0m6.611s
sys 0m0.223s
```