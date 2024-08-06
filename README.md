# SPP 2331 Hackathon on Transformer and LLMs in Chemical Engineering

This respository provides base code for starting projects as part of the SPP 2331 Hackathon.

## Repository structure

The general structure is:
* **chemcrow**: code from chemcrow paper [1,2], which has been modified and extended to enable working with open-source LLMs from Huggingface [3] in the REACT structure [4]
* **llama**: base code to run Llama 3.1 locally from Huggingface [3]

References:
[1] [chemcrow paper](https://github.com/ur-whitelab/chemcrow-public)
[2] [chemcrow repository](https://github.com/ur-whitelab/chemcrow-public)
[3] [HuggingFace](https://huggingface.co)
[4] [REACT paper](https://doi.org/10.48550/arXiv.2210.03629)

### Chemcrow
Here, you can find to files for running LLMs in combination with tools (chemcrow/tools):
* `run_chemrow.py`: original chemcrow model based on GPT (**non-free OpenAI [API key](https://platform.openai.com/api-keys) required**)
* `run_hf.py`: extension that works with open-source LLMs provided via huggingface (HF) (**free [HF token](https://huggingface.co/docs/hub/security-tokens) required**), cf. [HF REACT tutorial](https://huggingface.co/blog/open-source-llms-as-agents)

### Llama
Here, `run.py` provides an example code for accessing LLMs via HF. Specifcially, this example shows how to prompt [Llama 3.1 8B](https://huggingface.co/meta-llama/Meta-Llama-3.1-8B-Instruct) with execution on your local machine.

## Installation

Create a virtual environment and install the required packages provided with `<placeholder>_env.yml` files.
For chemcrow you can also install via `pip install .` using the `setup.py`. 

## Work with the HPC cluster

We have a high perfomance comuting project (HPC) from the RWTH cluster that allows us to use computing ressources, e.g., GPUs.
The project ist called **lect0127**.

You can connect to the cluster via:
* [SSH](https://help.itc.rwth-aachen.de/service/rhr4fjjutttf/article/fb61d6c86ae245b5b7bba8c0cb7db6eb/) 
* [remotedesktop](https://help.itc.rwth-aachen.de/service/rhr4fjjutttf/article/25f576374f984c888bb2a01487fef193/) (using FastX3 client)
* [JupyerHub](https://help.itc.rwth-aachen.de/service/rhr4fjjutttf/article/8b584034ca4242a9bcce6a06063199de/)

See information on the [logging nodes](https://help.itc.rwth-aachen.de/service/rhr4fjjutttf/article/0a23d513f31b4cf1849986aaed475789/). 

Upon login, you will automatically be directed into your `$HOME` directory, cf. [HPC file system](https://help.itc.rwth-aachen.de/service/rhr4fjjutttf/article/da307ec2c60940b29bd42ac483fc3ea7/). 

To **access the project directory**, use: `cd ../lect0127`. 

### Code editor
You do not have any root permissions on the HPC, so you cannot install software via sudo.
If you want to use a code editor like VSCode, you can do (**in your `$HOME` dir**) - first part only once:
```
wget https://packages.microsoft.com/repos/vscode/pool/main/c/code/code_1.92.0-1722473020_amd64.deb
ar x *.deb
tar xf data.tar.xz
```
and then start vscode (being in the same dir) via:
```
cd usr/share/code
./code
```

### Virtual environments 
#### Install conda
You can install miniconda here by using the following commands:
```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
```

To use conda, you need to set your PATH environment variable as follows:
```
export CONDA_ROOT=$HOME/miniconda3
source $CONDA_ROOT/etc/profile.d/conda.sh
export PATH="$CONDA_ROOT/bin:$PATH"
```
or alternatively (**required everytime you open a new terminal/shell**):
```
export PATH=$HOME/miniconda3/bin:$PATH
```

Now you can use conda. Note that in bash scripts on the HPC you activate environments with `source activate <env_name>` in contrast to `conda activate <env_name>`.

#### Using exisitng conda in project directory
You can also use the preinstalled conda in the lect0127 directory. Just type:
```
export PATH=~/../lect0127/miniconda3/bin:$PATH
```
You can then use the environments `chemcrow` and `llama`, respectively, to run the provided base code.
**Please do not alter the preinstalled environments by installing/removing packages**
If you need addtional packages, please set up a new environment or use your own conda (see previous step).

### Execute code

You have three options to run code:
* **Local login node**: Just run your script with `python <script_name>.py` in the terminal. This will execute the code on the node you are logged in (note that ressources are limited and might be blocked by other users, so this comes with a run time limit).
* **Work on interactive node**: You can reserve/access a HPC node using the following command: `salloc --time=01:00:00 --gres=gpu:1 --ntasks-per-node=1 --mem-per-cpu=4G --account=lect0127 --cpus-per-task=20 --reservation=SPP2331` (specify the ressources individually [5])
* **Submit a job**: Create a batch script and submit it via `sbatch <file_name>.sh`. You can find an example script in `bash_example.sh`

See information on [batch scripts and slurm jobs](https://help.itc.rwth-aachen.de/service/rhr4fjjutttf/article/13ace46cfbb84e92a64c1361e0e4c104/).

**Note**: Please be aware that HPC ressources are limited, costly, and energy-consuming. We have limited ressources for this project (48,000 cpu hours). Try to use them as efficiently as possible. If you have any questions about using the HPC, just let us know.

## Contributors
Jan G. Rittig (AVT.SVT, RWTH Aachen University)

## Acknolwedgements 
This code builds on the chemcrow work and huggingface tutorials (see references above).