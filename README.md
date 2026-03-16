# My NixOS Configuration Files

My current setup is a flake + home-manager setup, I chose this setup because it helps me create a stable channel/input unless I update it, which would help if I would
ever move my config into another machine. Used home-manager for packages that I only want to be installed in a local user and not root, home-manager also helps with configuration files so that helps too.

## Why Nix?

Frankly, I was just curious about Nix, whenever I navigate through the internet, there's someone always saying to try Nix. So I researched about it, coincidentally I was gonna learn ansible and terraform stuffs before I tried Nix and I was thinking "Why even use Nix when I can just use terraform and ansible to do the same thing?". But yeah I found out about it's declarative approach and functional approach to system packages, and it helped solve a problem for me where I would feel that my machine is now dirty due to a lot of stuffs installed. Now with NixOS at least it forces me to list packges (providing I used only the declarative way) that I installed which is good.

## Experiences when I switched to it

### Initial Install problems

I was gonna install it with a GUI, but my pride in me says to install it manually just like how I would in arch. And so I did, the installation steps where pretty straightforward I followed the NixOS manual page throughout and used `nixos-help`. My first install was a failed install though, you see my setup is LVM + LUKS, but the nixos-generate-config doesn't know that? I already opened the crypted partitions so I don't know why it still didn't got detected, wait, I mean it detected it properly but it was lacking a vital option, you see during boot process, it checks first the luks partition while the kernel hasn't read the LVM stuffs yet so it errors to partition not found so what I had to do is to add a `preLVM=false` config to the partitions so that it would wait for LVM first before trying to decrypt the encrypted partition.

### The Nix Language

Personally, I haven't used the nix language extensively yet, I haven't found any reason to yet. But I'm imagining I'm gonna use it to create modules with custom options so maybe in the future. But, if you're just gonna use it to just install stuffs and just to keep track of your packages you wouldn't have to dive deep into the nix syntax stuffs.

### Configuration Structure/Architecture Paralysis

This is the main dilemma I had when I was using NixOS. I just couldn't seem to decide on what kind of freaking structure to decide on, I researched that I should use flakes when I started so I started with a flake setup. I heard about home-manager so then I feel compelled to use it to manage my home config stuffs. Then I heard about flake-parts and dendritic pattern in which I tried to understand the both of them but my head is just full of it as of now. I tried using it but I don't have the problem it tries to solve so I won't use it for now.

After that is the folder structure? Meh, currently I feel like I have a good folder structure, it's neat, organized and modular. But I feel like I shouldn't really modularized stuffs yet if I won't have to use it twice? you know, kinda like a function, don't define a function unless you're gonna use it more than once? I mean you can still of course but after the code is finished maybe same with this, I hate that I have a lot of "modules" that I only use once at the time. Maybe a module with options will solve this itch, idk.

## My configuration rules to keeping it clean and simple

* Don't create a module file for it, if you're just using it once in the whole codebase.
* Don't overcomplicate it.

## Goals

1. Nixifying my home server laptop, and my cloud instances.

## Tooling Setup

* I use vscode as my editor
* I then used neovim and nix-ide extensions
* In which I use nixd as my language server provider for nix-ide
* Configured it to provide autocomplete for flakes and home manager.

```json
  "nix.enableLanguageServer": true,
  "nix.serverPath": "nixd", // or "nixd", or ["executable", "argument1", ...]
  "nix.serverSettings": {
    "nixd": {
      "formatting": {
        "command": [
          "nixfmt"
        ],
      },
      "options": {
        "nixos": {
          "expr": "(builtins.getFlake \"/home/shinidev/nixos/\").nixosConfigurations.shinixos.options"
        },
        "home-manager": {
          "expr": "(builtins.getFlake \"/home/shinidev/nixos/\").nixosConfigurations.shinixos.options.home-manager.users.type.getSubOptions []"
        }
      },
    }
  },
```
