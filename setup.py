import setuptools

setuptools.setup(
    packages=setuptools.find_packages(),
    install_requires=[
        'apache-beam[gcp]==2.29.0'
    ],
 )
