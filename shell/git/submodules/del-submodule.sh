Here is what I did :

1.) Delete the relevant section from the .gitmodules file. You can use below command:

git config -f .gitmodules --remove-section "submodule.submodule_name"
2.) Stage the .gitmodules changes

git add .gitmodules
3.) Delete the relevant section from .git/config. You can use below command:

git submodule deinit -f "submodule_name"
4.) Remove the gitlink (no trailing slash):

git rm --cached path_to_submodule
5.) Cleanup the .git/modules:

rm -rf .git/modules/path_to_submodule
6.) Commit:

git commit -m "Removed submodule <name>"
7.) Delete the now untracked submodule files

rm -rf path_to_submodule
