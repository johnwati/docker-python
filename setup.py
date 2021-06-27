from setuptools import setup, find_packages

setup(
    name="asks",
    version="0.1.2",
    packages=find_packages("lib"),
    test_suite="nose.collector",
    # Search for packages listed above under the lib dir.
    package_dir={"": "lib"},
    scripts=["bin/manage.py"],
    package_data={
        # If any package contains *.txt or *.rst files, include them:
        "": ["*.rst", "*.sh", "*.csv"]
    },
    author="Dennis Munene",
    author_email="dennis@enezaeducation.com",
    description="Python API",
    license="Proprietary",
    keywords="eneza asks api",
)
