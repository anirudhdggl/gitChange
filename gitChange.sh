#!/bin/bash
reset

echo -e "\t================================================================================"
echo -e "\n"
echo -e "\t         oo   dP   MM'\"\"\"\"'YMM dP                                           "
echo -e "\t              88   M' .mmm. \`M 88                                           "
echo -e "\t.d8888b. dP d8888P M  MMMMMooM 88d888b. .d8888b. 88d888b. .d8888b. .d8888b. "
echo -e "\t88'  \`88 88   88   M  MMMMMMMM 88'  \`88 88'  \`88 88'  \`88 88'  \`88 88ooood8 "
echo -e "\t88.  .88 88   88   M. \`MMM' .M 88    88 88.  .88 88    88 88.  .88 88.  ... "
echo -e "\t\`8888P88 dP   dP   MM.     .dM dP    dP \`88888P8 dP    dP \`8888P88 \`88888P' "
echo -e "\t     .88           MMMMMMMMMMM                                 .88          "
echo -e "\t d8888P                                                    d8888P           "
echo -e "\n"
echo -e "\t================================================================================"

#cloning the repo

echo -e "\n"
printf "\tEnter github repo link:\n\n\t"
read LINK_TO_CLONE
printf "\n\n"

git clone $LINK_TO_CLONE

REPO_NAME=$(echo $LINK_TO_CLONE | cut -d '/' -f5)

#get the substitute word

printf "\n\tEnter the substitute word:\n\n\t"
read SUBSTITUTE

#substitute using sed

sed -i "s/DEVOPS/${SUBSTITUTE}/g" $REPO_NAME/.githooks/commit-msg

cd $REPO_NAME/

#add changes
git add -A

#commit changes

while :
do
	#take commit message
	printf "\n\tEnter commit message\n\n\t"
	read COMMIT_MESSAGE

	COMMIT_MESSAGE_LENGTH=$(echo $COMMIT_MESSAGE | wc -c)

	#condition has 1 because a newline character is also seen
	#and thus for no message and only newline char it will be 1

	if [ $COMMIT_MESSAGE_LENGTH -gt 1 ] 
	then
		break
	fi
done

git commit -m "$COMMIT_MESSAGE"

#push changes
git push origin master
