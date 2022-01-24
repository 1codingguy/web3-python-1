# Solidity, Blockchain, and Smart Contract Course – Beginner to Expert Python Tutorial
https://www.youtube.com/watch?v=M576WGiDBdQ&t=12408s

- install VsCode extensions:
  1. Python
  2. Solidity
- problem:
  - Solidity formatting doesn't work with prettier even following the instructions
    - needed to save install solidity plugin from npm install, so that format on save works.
    - `npm install --save-dev prettier-plugin-solidity`
      - https://github.com/prettier-solidity/prettier-plugin-solidity
      - it says saving prettier also, but without installing prettier from npm also works.
  - pip install doesn't work, needs `python -m pip install [package-name]`
  - "They are given rights to run Python, but not rights to run PIP. With Python, you can pass the -m flag to specify a Python module that you want to run. PIP is a Python module, so it can be passed that way."
  - https://stackoverflow.com/questions/31172719/pip-install-access-denied-on-windows

? What is "Python black" package? same as pep8 to format code?
- problem: prettier doesn't work with Python too
- solution: use 'black' as formatter
  - "If I disabled Prettier as the default formatter, it would not format on save anymore, but my Python would be formatted by autopep8 on save."
  - https://stackoverflow.com/questions/65410758/problem-formatting-python-when-using-prettier-in-vscode
  - so specify default formatter in setting to be null for Python:
    ```
    "[python]": {
    "editor.defaultFormatter": null
    },
    ```

`deploy.py`
- with statement
  - execute code inside the indented area, once the execution is finished, we will close this file.

## compile the .sol file with python
- problem with py-solc-x
- https://github.com/smartcontractkit/full-blockchain-solidity-course-py/blob/main/chronological-issues-from-video.md

Problem: "PermissionError: [WinError 5] Access is denied"
Solution: run vsCode as an administrator: right click vsCode icon -> properties -> advance -> check the box of "run as administrator"

## Ganache is a simulated blockchain that can run on local machine
