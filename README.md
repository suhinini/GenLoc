GenLoc
======

GenLoc is a Ruby script that helps avoiding magic strings in iOS/OSX projects while using localization.

For each key in your Localizable.strings file it will generate an appropriate constant. This will allow you to avoid using magic strings in your code and use code completion for faster localized strings usage.


Installation
------------

Installation is quite simple.

1. Add genloc.rb to your project
2. Add new "External Build System" target named "GenLoc" to your project
    - Set "Build Tool" to "/usr/bin/ruby"
    - Set "Arguments" to $(SRCROOT)/{path-to-genloc}/genloc.rb -o $(SRCROOT)/{path-to-output-file}/{output-file-name}.h -l $(SRCROOT)/{path-to-your-main-localizable-folder}/Localizable.strings
3. In your main target, add your "GenLoc" target as a dependency ("Build Phases" tab, first block)
4. Build your project. If all fine, you'll get your output file generated. Add it to the project.
5. Add appropriate "#import" directive to your prefix file


Notes
-----

1. Use sample project as a guide
2. Keys in Localizable.strings should consist of words separated by underscores, like this: "MY\_PERFECT\_KEY"
3. If you name your output file as SMLocalized.h, then you'll get SMLocalizedMyPerfectKey constant
4. Don't modify generated file. It contains a timestamp which is basically a last modified date of the original Localized.strings file. This avoids triggering total rebuild in most cases.


Questions
---------

If you have any questions / want new feature / found a bug, reach me here, at Twitter (@suhinini) or by email (Twitter username at Gmail).