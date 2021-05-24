FROM partrita/pyrosetta:conda

WORKDIR /usr/src/app

# copy all the files
COPY . .

# install the dependencies
RUN conda env create -f casp14-baker.yml && conda activate casp14-baker

RUN wget https://files.ipd.uw.edu/pub/trRosetta2/weights.tar.bz2 && tar xf weights.tar.bz2

RUN ./install_dependencies.sh

# uniclust30 [46G]
RUN wget http://wwwuser.gwdg.de/~compbiol/uniclust/2020_06/UniRef30_2020_06_hhsuite.tar.gz && tar xf UniRef30_2020_06_hhsuite.tar.gz

# structure templates [8.3G]
RUN wget https://files.ipd.uw.edu/pub/trRosetta2/pdb100_2020Mar11.tar.gz && tar xf pdb100_2020Mar11.tar.gz

CMD ["/bin/bash"]
