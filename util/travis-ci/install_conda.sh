if [[ "$OSTYPE" == 'linux-gnu' ]]; then
    wget http://repo.continuum.io/miniconda/Miniconda-3.4.2-Linux-x86_64.sh -O miniconda.sh;
else
    wget http://repo.continuum.io/miniconda/Miniconda-3.5.5-MacOSX-x86_64.sh -O miniconda.sh;
fi

bash miniconda.sh -b -p $HOME/miniconda
export PATH="$HOME/miniconda/bin:$PATH"

conda install conda-build binstar --yes

# Crazily, conda needs jinja2...
conda install jinja2 setuptools --yes
