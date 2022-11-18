# Create your grading script here

rm -rf student-submission
git clone $1 student-submission

CP='".;lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar"'


echo 

if [ -f student-submission/ListExamples.java ]
then
	echo "ListExamples.java at least exists"
else
	echo "ListExamples.java doesn't even exist"
fi

echo

cp -r ./lib/ Server.java GradeServer.java TestListExamples.java ./student-submission

cd ./student-submission

javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java

java -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" org.junit.runner.JUnitCore TestListExamples > output.txt




SCORE=`grep 'Tests run:' output.txt` 

IFS=', ' read -r -a array <<< $SCORE

echo "You failed" ${array[4]} "tests out of the" ${array[2]} "tests"

GRADE=${array[4]}/${array[2]}
PASS=0.75


if [[ $GRADE -ge $PASS ]]
then 
	echo "TEST"
else
	echo "FF"
fi
