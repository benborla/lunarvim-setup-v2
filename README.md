NVIM

space + l + k => show next error
space + l + j => show previous error

;ww => show functions, and variables in the current class or file
;wf => show functions
;wv => show variables
;wc => show class name

gpd => preview function defnitiion (same as go to definition)
shift + k => show documentation of the highlighted text

—

Push an existing repository:
```shell
git remote add origin https://github.com/benborla/hotfix.git
git branch -M main
git push -u origin main
```
LunarVim Plugin Path:
 ~/.local/share/lunarvim/site/pack/lazy/opt/
l

git clean -xdf even removes all ignored files!!! git 

git restore {dir}

update composer.lock
$ composer update —lock 

## Troubleshooting
If you encounter an error `query.lua:259: query: invalid node type at position 1477 for language tsx`

Run the following in the editor:

:echo nvim_get_runtime_file('parser', v:true)

If you see more than one parser, disable the second one, or the one that is under nvim
