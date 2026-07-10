#!/bin/bash

setup_gh_branch() {
    if git show-ref -q --heads "gh-pages"; then     # check if gh-pages branch exists
        git checkout gh-pages                       # checkout existing branch
    else 
        echo "** Creating new branch: gh-pages **"
        git checkout -b gh-pages                    # create gh-pages and checkout
    fi

    update_files                                    # update files in gh-pages branch
    git checkout main                               # checkout main branch
    
}

update_files() {
    has_change=0                                    # files were modified bool
    if [ -f README.md ]; then                       # check if root level readme exists
        echo "** Removing README.md **"
        rm README.md;                               # delete root level readme
        git add README.md                           # stage delete in git
        has_change=1
    fi

    if [ ! -z $(grep "*.zip" .gitignore) ]; then    # check if *.zip is present in .gitignore
        echo "** Removing *.zip from .gitignore"
        sed -i /"*.zip"/d .gitignore;               # remove the *.zip line from .gitignore
        git add .gitignore                          # stage .gitignore modifications in git
        has_change=1
    fi

    if [ $has_change -eq 1 ]; then                  # if files were modified, commit changes
        echo "** Committing updates to git **"
        git commit -m "REMOVE README.md and update .gitignore on gh-pages branch"
    fi
}

deploy_gh_pages() {
    setup_gh_branch                                 # prep gh-pages branch for site deployment
    ./mvnw site                                     # create site files
    ./mvnw site:stage                               # gather site files across projects
    ./mvnw scm-publish:publish-scm                  # upload site files to gh-pages branch
}

deploy_gh_pages