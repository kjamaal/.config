#!/bin/bash

gpg -r kjamaal81@gmail.com -e ~/.config/mutt/.passwords
shred ~/.config/mutt/.passwords
rm ~/.config/mutt/.passwords
