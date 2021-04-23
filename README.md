# cython_tight_loops
Code for the cython tight loops blog

* simple_loop.py     - Python code to run a loop and evaluate
* simple_loop_cy.pyx - Cython code to run a loop
* run_simple_loop.py - Python code to import cython module simple_loop_cy and evaluate

setup.py - Code to used to compile a cython file

You can change the cython file name in line 6 and compile as below

**python setup.py build_ext –inplace**

* tight_loop.py - Python code to run a tight loop for "Not so simple example"  
* tight_loop_1.pyx  - Cython code for tight loop with static type declarations  
* tight_loop_2.pyx  - Cython code for tight loop with input array_len declared as static type  
* tight_loop_3.pyx  - Cython code for tight loop with Typed Memory views  
* run_cython.py     - Python code to import cython module for tight loops and evaluate  