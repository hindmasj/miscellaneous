# Laptop Setup

## Bashrc

Copy the "bashrc" you find here over the top of "~/.bashrc". This then calls "local_bashrc" here. The when you want to add something to .bashrc, add it to local_bashrc instead and you can version control it.

```
mv ~/.bashrc ~/.bashrc_orig
ln -s ${PWD}/bashrc ~/.bashrc
```

## Local Bin

Create the directory "~/.local" then add the link to the "bin" directory here. Then any scripts in here are available to run locally or use in aliases.

```
mkdir -p ~/.local
ln -s ${PWD}/bin ~/.local/bin
```

