userName=$(git config --global user.name)
userEmail=$(git config --global user.email)

newUserName=$(dialog --inputbox "Git user name" 10 60 "${userName}" 3>&1 1>&2 2>&3 3>&- )
newUserEmail=$(dialog --inputbox "Git user email" 10 60 "${userEmail}" 3>&1 1>&2 2>&3 3>&- )

echo "Setting to ${newUserName} and ${newUserEmail}"
git config user.name ${newUserName}
git config user.email ${newUserEmail}
