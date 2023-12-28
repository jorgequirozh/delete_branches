## Usage
```
$ chmod +x delete_branches.sh
./delete_branches.sh
```
- This will list all branches within the current directory and prompt the user to delete them.
- Directory can also be overriden by specifying the full or path containing the desired repository after the script
```
./delete_repos.sh /home/admin/Documents/Repo/myproject
```

## Options
- Default branch can be edited by modifying varible default_branch

## Running from any location 
- Add the following line to your .bash_profile
```
alias delete_branches="/Full/Path/To/The/Script/update_repos.sh"
```

## Output Example
```
$ git checkout -b test
Switched to a new branch 'test'
$ git checkout -b test2
Switched to a new branch 'test2'
$ git checkout -b test3
Switched to a new branch 'test3'

$ ./delete_branches.sh 
WARNING: No repo was supplied, assuming current directory
The following local branches will be deleted:
  test
  test2
  test3
Press enter to continue, or Ctrl C to abort

Deleting non-master branches from repo /Users/admin/Documents/Repos/delete_branches
Deleted branch test (was 5a0e141).
Deleted branch test2 (was 5a0e141).
Deleted branch test3 (was 5a0e141).
```

