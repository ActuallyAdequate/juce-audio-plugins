#### (Optional) Setting JUCE version.

The version of JUCE is v7.0.3 by default currently. Juce is located as a git submodule in `lib` directory, so you can switch the version by checking out in the directory like this.

```sh
cd /JUCE
git tag # show the tagged releases.
git checkout 7.0.2
# If you need, you can commit the change of JUCE version in the main directory.
cd ..
git commit -m "Changed the version of JUCE."
```