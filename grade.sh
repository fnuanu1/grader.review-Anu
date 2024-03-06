CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission #what is this -> resolved
echo 'Finished cloning'

if [[ -f student-submission/ListExamples.java ]]
    then 
        echo "exists"
    else
        echo "do not exist"
        exit 1
fi

cp student-submission/ListExamples.java TestListExamples.java grading-area
cp -r lib grading-area

pwd
cd grading-area
pwd

javac -cp $CPATH *.java

if [[ $? -eq 0 ]]
then
    echo "success"
else
    echo "fail"
    exit 1
fi

# Run the tests and report the grade based on the JUnit output. You should add this
# Again output redirection will be useful, and also tools like grep could be helpful here

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > output.txt

grep "OK" output.txt > grep.txt

if [ $? -eq 0 ] 
then 
    echo "1/1"
else
    echo "0/1"
fi

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
