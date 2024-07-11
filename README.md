# reflink.yazi

This is a Yazi plugin for reflinking files.

## Installation

Install the plugin:

```
ya pack -a Ape/reflink
```

Create `~/.config/yazi/keymap.toml` and add:

```
[[manager.prepend_keymap]]
on = [ "_", "r" ]
run = "plugin reflink"
desc = "Reflink the yanked files"
```
