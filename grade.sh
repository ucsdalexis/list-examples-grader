rm -rf student-submission
git clone $1 student-submission


CP=".:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar" 


# if TEST_1 = 0 then fail
declare -i TEST_1=0
echo 

if [ -f student-submission/ListExamples.java ]
then
        echo "ListExamples.java at least exists"
	TEST_1=1
else
        echo "ListExamples.java doesn't even exist"
fi

echo


cp -r ./lib/ Server.java GradeServer.java TestListExamples.java ./student-submission
cd ./student-submission
mkdir lib
cp hamcrest-core-1.3.jar junit-4.13.2.jar lib

javac -cp $CP *.java
java -cp $CP org.junit.runner.JUnitCore TestListExamples > output.txt


SCORE=`grep 'Tests run:' output.txt`

IFS=', ' read -r -a array <<< $SCORE

echo "You failed" ${array[4]} "tests out of the" ${array[2]} "tests"

declare -i GRADE=(${array[2]}-${array[4]})*100/${array[2]}
declare -i PASS=7*100/10

echo "I guess you get a" $GRADE "% based on my grading system"

if [[ $GRADE -ge $PASS ]]
then
        echo "You pass :)"
else
        echo "You did not pass :("
fi

echo

