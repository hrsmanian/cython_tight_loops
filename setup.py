from setuptools import setup
from Cython.Build import cythonize
import numpy

setup(
    ext_modules = cythonize("simple_loop_cy.pyx", language_level=3, annotate=True)
)