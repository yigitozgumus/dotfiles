function run_kotlin --argument file
  set -l file_jar (string replace kt jar $file)
  rm -f $file_jar
  kotlinc $file -include-runtime -d $file_jar
  java -jar $file_jar
end
