# How to contribute to PomoDojo!

This file will walk you through every step there is to both first starting out, and then eventually contributing your very own changes to PomoDojo! We detail how to make changes utilizing Git terminal commands, so if you're completely new to Git and GitHub, follow this guide as well as possible and reach out if you have any questions! 

> **A few things to note! (mostly for after developing more than once)**
> 
> - Make sure you try to **close out of Godot when running Git commands**. It may lead to saving errors if you save files after running Git commands with it open.
> - Be sure to adhere to the minigame guidelines to make sure minigames are uniformly developed
> - Make sure to create a new development branch every time you start working on a new task/issue
>
> Happy coding!


# Getting started:

## Step 0: Download all software and create project source folder
- Make sure to download **Godot Game Engine** v.4, at this link: https://godotengine.org/download/windows/
- Also make sure you have **Git** installed, go to this link: https://git-scm.com/downloads/win
  
- Create a folder to hold all of your project files somewhere easy to access (like your desktop), and name it something like "PomoDojo", but any name is fine.
- Make sure you can access this folder's directory; you will need it later.


## Step 1: Forking the repository
- Go to the UF OSC PomoDojo repository, and press the **fork** button near the top of the screen.
- Keep the name the same if you'd like, then click create fork.

- This is your copy of the repository; make sure your fork is always up to date when submitting changes and contributing, by pressing the **sync** button.

## Step 2: Clone the forked repository
- There are a few ways of using git for this project; you can use whichever method you find easiest.
- They will all do the same thing and navigate to the same directory, but it will just look slightly different.

#### **Using Git Bash (I like this one)**
- Right-click inside your created folder from **Step 0**, and find the option **Open Git Bash here** and click it.

#### **Using Command Prompt**
- Press the Windows key on your keyboard and search for **Command prompt**
- Type **cd "*Your PomoDojo file directory*"** and press enter

Either way, you should now be in your project file directory.
- Now, copy the GitHub URL of your forked repository and type:
- **git clone *URL***, and press enter
- The type **git pull** to retrieve all of the files.

- This has now made a copy of the repository from GitHub onto your local device, and retrieved all of the files into it.


## Step 3: Making a new branch for what you want to contribute
- This isn't technically required, but I **HIGHLY HIGHLY** recommend it since it prevents you from overwriting all of your code by accident.

- In either Git Bash or the Command prompt, type **git checkout -b *Insert fancy branch name here***, then press enter (Make sure you remember this branch name, we will reference it a lot later)
- This will create a new branch on your computer, which acts as another copy of all the code that you can safely edit without changes interfering with other code until you're ready.
- This command will also now put you into the branch automatically, so any changes to your code will need to be added here.

## Everything should be ready for you to code away in Godot! Let us know if you have any questions!

# Have you made changes and are ready to submit? It's time to submit a Pull Request!

### Step 1: Committing changes
- Open either Git Bash or Command prompt (if in command prompt type **cd *PomoDojo folder name*** first)
- If you haven't already or forgot to, make sure to create a new development branch by running **git checkout -b *INSERT FANCY BRANCH NAME HERE***. **Look at Step 3: Making a new branch for what you want to contribute** for why to do this.
- Type **git checkout **branch name**, press enter. This makes sure you are adding commits to your development branch, not your main one.
- Type **git add .** or **git add *specific file local path(s)* if you want to only add a few changed files.
- Then type **git commit -m "*Message here*"**, and keep your message short but informative about what it is you changed

### Step 2: Syncing fork for new commits
- To make sure all files are up to date from updates, go back to your forked repository on GitHub and press the **sync fork** button again
- Then, run **git checkout main**, and then **git pull**, to switch to your main branch and pull any updates in.
- ^^^ THESE TWO STEPS ARE EXTREMELY IMPORTANT, as not doing this could lead to merge conflicts or code being lost and deleted.
- Your code in your main branch will most likely change, and it's up to *YOU* to make sure your new changes don't contradict any code from other people
- We are now ready to commit our changes from our development branch to our own local main branch.

### Step 3: Rebase into local main branch
- Run **git checkout *branch name*, then **git rebase main**. This moves into your development branch, then merges your changes into your main branch.
- We are using "rebase" rather than "merge" to form a more linear commit history that is easier to read with many people contributing.

>
> If you get merge conflicts here, that's ok! Make sure to resolve them by reading from your terminal what files are conflicting, closing the terminal, and reopening the Godot files.
> Git should automatically add headers into files where the conflicts take place, so search for "=======" and you should see two versions of code before and after these headers that you need to manually sort through.
> Once the conflict is resolved, resave your files, delete all the header text Git added to the files, and I recommend restarting the rebase from **Step 1: Committing Changes** just to make sure there aren't any issues still.
> If needed to restart the rebase, run **git rebase --abort**, then try to merge your changes again.
>

- Now, run **git checkout main**, then **git rebase *branch name***

### Step 4: Push
- Run **git push**, and your changes should now be in your forked repository on GitHub

### Step 5: Contribute
- Go to your forked GitHub repository, and check if everything is reflected correctly. You should have a new commit in your repo, and your development branch should've been merged into your main branch.
- If you see a green "Compare & Pull Request" button (I don't believe you should see this but just in case it does show up), click it and sort through the changes, and save it.
- Now, click the **"Contribute"** button on GitHub to make a pull request to our main repository.
- Make sure to include a descriptive name for your pull request, outlining what was changed in your commit(s). If you're solving an issue #, try to include the issue number in the pull request name

# Great job submitting a Pull Request, a Tech lead will look over your code and send you updates if anything needs further refinement. Thank you for contributing to PomoDojo!

