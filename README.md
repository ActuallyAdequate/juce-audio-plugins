
## Workflow
Plugins are developed independantly on there own branch. Each plugin brnach should not contain the details of any other plugin.

Changes that effect all plugins should be made in template branch, which each plugin branch will merge from to update. The template should not contain any code of any particular plugin.

The main branch can pull from each plugin branch, and the template branch and thus may contain all plugins and code.

### Create New Plugin
1. Create new branch from template branch 
    - `git checkout template`
    - `git checkout -b new_plugin`
2. Create new plugin
    - `./new_plugin plugin_name code`
    - open up new folder and open the vscode workspace

### Merge Flow
template -> plugin_branch
plugin_branch -> main
template -> main

### Testing
To test the plugins use an appropiate DAW Any DAW can be chosen however here are some notes:

#### Linux
- Reaper: seems to work.
- ardour: seems to be be broken on nixos (can't find glibc 2.38)
- audacity: seems to not support vst3 on linux pr (simliar issue to ardour)
- waveform: failed to load (likley simliar issue as ardour)

#### Windows (require cross-compile)
- waveform
- audacity: (must be 32 bit)


## Setting JUCE version.

The version of JUCE is v7.0.3 by default currently. Juce is located as a git submodule in `lib` directory, so you can switch the version by checking out in the directory like this.

```sh
cd /JUCE
git tag # show the tagged releases.
git checkout 7.0.2
# If you need, you can commit the change of JUCE version in the main directory.
cd ..
git commit -m "Changed the version of JUCE."
```

## Improvements
Figure out cross compile rather than using windows vm
Figure out the dumb glibc error