# We set environment requirement 
# Python 3.6
sudo apt-get update

sudo apt-get update


conda create masif python=3.6 
conda activate masif
conda install numpy

# REDUCE 3
mkdir external
mkdir external/reduce
cd external/reduce
wget -O reduce3.23.gz http://kinemage.biochem.duke.edu/php/downlode-3.php?filename=/../downloads/software/reduce31/reduce.3.23.130521.linuxi386.gz
gunzip reduce3.23.gz -f
rm reduce3.23.gz
mkdir bin
mv reduce3.23 bin/reduce
sudo chmod u+x bin/reduce
Hm0010.tys
export PATH=$PATH:~/masif/external/reduce/bin
reduce -v
cd ../


# MSMS 2.6.1
mkdir msms
cd msms
wget http://mgltools.scripps.edu/downloads/tars/releases/MSMSRELEASE/REL2.6.1/msms_i86Linux2_2.6.1.tar.gz
mkdir bin
cp msms_i86Linux2_2.6.1.tar.gz bin
cd bin
tar -xvf msms_i86Linux2_2.6.1.tar.gz
rm msms_i86Linux2_2.6.1.tar.gz
mv msms.i86Linux2.2.6.1 msms
export MSMS_BIN=~/masif/external/msms/bin
$MSMS_BIN/msms
cd ../../

#BioPython
pip install biopython==1.66

# Pymesh
sudo snap install docker
docker run -i pymesh/pymesh
# export PYMESH_PATH=/path/to/PyMesh

#PDB2PQR 2.1.1
export PDB2PQR_BIN=~/masif/external/pdb2pqr/pdb2pqr-linux-bin64-2.1.1/pdb2pqr
$PDB2PQR_BIN

# APBS  3.0 > 1.5
mkdir apbs 
cd apbs
wget -O apbs3.0.zip https://sourceforge.net/projects/apbs/files/apbs/apbs-3.0/APBS-3.0.0_Linux.zip/download
unzip apbs3.0.zip
rm apbs3.0.zip
export APBS_BIN=~/masif/external/apbs/APBS-3.0.0.Linux/bin/apbs
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/masif/external/apbs/APBS-3.0.0.Linux/lib
wget http://archive.ubuntu.com/ubuntu/pool/main/r/readline/libreadline7_7.0-3_amd64.deb
sudo apt-get install ./libreadline7_7.0-3_amd64.deb
$APBS_BIN
rm ./libreadline7_7.0-3_amd64.deb

# MULTIVALUE within APBS
export MULTIVALUE_BIN=~/masif/external/apbs/APBS-3.0.0.Linux/share/apbs/tools/bin/multivalue
$MULTIVALUE_BIN

# open3d
pip install open3d

# Tensorflow 1.9 
pip install tensorflow-gpu==1.9


# strbioinfo
pip install pillow
pip install StrBioInfo


# Dask (2.2.0)
pip install Dask==2.2.0

# pymol not insatlled yet
cd ~/masif/external/reduce/bin/
wget https://raw.githubusercontent.com/rlabduke/reduce/master/reduce_wwPDB_het_dict.txt
export REDUCE_HET_DICT=~/masif/external/reduce/bin/reduce_wwPDB_het_dict.txt

export PDB2XYZRN=~/masif/external/msms/bin/pdb_to_xyzrn
$PDB2XYZRN