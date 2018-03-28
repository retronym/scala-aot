#! /bin/bash -e

SCALA_HOME=$1

mkdir -p target/classes
pushd target/classes
for jar in $SCALA_HOME/lib/*; do
    jar xf $jar
done
rm -rf scala/tools/ant/
# rm -rf scala/tools/fusesource_embedded
# rm -rf scala/tools/nsc/interpreter/jline_embedded
# rm -rf scala/tools/jline_embedded

# rm -rf scala/tools/nsc/doc
# rm -rf scala/xml
# rm -rf scala/reflect/runtime
# rm -rf scala/collection/parallel
# rm -rf scala/concurrent
# rm -rf scala/tools/reflect/ReflectMain*
# rm -rf scala/tools/reflect/ReflectGlobal*
# rm -rf scala/tools/reflect/ToolBoxFactory*

jar cf ../scala-all.jar *
popd

#compileOnly (scala\.collection|scala\.tools\.nsc|scala\.reflect\.internal)\..*


jaotc -J-Xmx8G --info --ignore-errors --output scala-library.dylib --compile-for-tiered $SCALA_HOME/lib/scala-library.jar

function aot() {
cat << EOF > compile.command
compileOnly $2
EOF

    jaotc -J-Xmx8G --info --ignore-errors --compile-commands compile.command --output $1.dylib --compile-for-tiered target/scala-all.jar    
}

aot scala-reflect 'scala\.reflect\.internal\.*.*'
aot scala-compiler 'scala\.tools\.nsc\.*.*'
