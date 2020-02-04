# Creates fix commit from current add and opens rebase dialog to squash it with previous commit.
git add -p
git commit -m "Fix."
git-edit 3
