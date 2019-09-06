#!/bin/bash
#SBATCH -N 1
#SBATCH -p cidsegpu3
###SBATCH -p physicsgpu1
#SBATCH -q wildfire

#SBATCH --gres=gpu:4

#SBATCH -J BERT_Agave_Opioid
#SBATCH -o BERT_Agave.OUT
#SBATCH -e BERT_Agave.ERROR

#SBATCH -t 0-01:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=XXXX@asu.edu

export OMP_NUM_THREADS=28
module load anaconda3/5.3.0
pip install --user pytorch-pretrained-bert==0.6.0

python Code/run_classifier_tutorial_opioid.py --bert_model="bert-base-uncased" --do_lower_case --task_name=tutorial_opioid --data_dir=./Data --learning_rate=2e-5 --num_train_epochs=10 --output_dir=./BERT_Output/ --cache_dir=./BERT_CACHE --eval_batch_size=32 --max_seq_length=128 --train_batch_size=32 --do_train --do_eval
