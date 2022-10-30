#!/usr/bin/env python3

from string import ascii_letters, digits, punctuation
from sys import stdout
from time import sleep
from random import choice
from colorama import Fore, Back
from os import system


system('clear')
colors = [Fore.RED, Fore.GREEN]
def func():
    st = ''
    for i in range(50):
        st += choice(f'{ascii_letters}{digits}{punctuation}')

    for c in st:
        stdout.write(f'{Back.BLACK}{choice(colors)}{c}{Fore.RESET}{Back.RESET}')
        stdout.flush()
        sleep(0.02)

    sleep(0.5)

while True:
    func()
