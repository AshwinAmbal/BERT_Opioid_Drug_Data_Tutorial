## Tutorial to run BERT for Text Classification


There are three folders in the Tutorial:  
**Code**- Contains the text classification code  
**Data**- Contains the Train, Dev and Test Data  
* Input data needs to be TAB delimited and have three columns namely: ID, Text, Label  

To run the tutorial with the given data, simply run `bash Run_BERT_Opioid_tutorial.sh` OR `sbatch Run_BERT_Opioid_tutorial.sh` (in the Agave Cluster or any SLURM cluster)  

**Run_BERT_Opioid_tutorial.sh**- Script to run
* Refer agaveintro.pdf for all arguments to the slurm job  
* Set SBATCH --mail-user=XXXX@asu.edu command to the email ID of the user to get email notifications of any update on the job  
* All accepted arguments to the run_classifier_tutorial_opioid.py code are given below:  
	
	```
	usage: run_classifier_tutorial_opioid.py [-h] --data_dir DATA_DIR --bert_model
                                         BERT_MODEL --task_name TASK_NAME
                                         --output_dir OUTPUT_DIR
                                         [--cache_dir CACHE_DIR]
                                         [--max_seq_length MAX_SEQ_LENGTH]
                                         [--do_train] [--do_eval]
                                         [--do_lower_case]
                                         [--train_batch_size TRAIN_BATCH_SIZE]
                                         [--eval_batch_size EVAL_BATCH_SIZE]
                                         [--learning_rate LEARNING_RATE]
                                         [--num_train_epochs NUM_TRAIN_EPOCHS]
                                         [--warmup_proportion WARMUP_PROPORTION]
                                         [--no_cuda] [--local_rank LOCAL_RANK]
                                         [--seed SEED]
                                         [--gradient_accumulation_steps GRADIENT_ACCUMULATION_STEPS]
                                         [--fp16] [--loss_scale LOSS_SCALE]
                                         [--server_ip SERVER_IP]
                                         [--server_port SERVER_PORT]
	```
	The arguments in [] are optional and have default values set  
	
**BERT_Output**- Contains the predicted labels, evaluation results, etc. which are the output of the classifier (Folder Required to run evaluation on the test set)  
* *pytorch_model.bin*- The trained model (Required for test)  
* *bert_config.json*- The saved configuration with which BERT was trained (Required for test)  
* *eval_results.txt*- The evaluation results on the test set  
* *Reqd_Labels.csv*- The predicted and gold standard labels for each sentence  
  
**Note**: To run on a new dataset with name **task_name**, do the following:  
* Copy the InputProcessor class and make a new class with name **task_name**_InputProcessor  
* Change the get_labels function in the **task_name**_InputProcessor class to return a list of all possible labels for the new dataset  
* Add **task_name** to the processors dictionary under main and map it to **task_name**_InputProcessor  
* Add **task_name** to the num_labels_task dictionary under main and map it to the number of labels in the task. Note that this number should match with the number of labels returned by get_labels in Step 2.  
* Finally, make sure to call the python code with the appropriate **task_name** used in the above steps.  
* The appropriate Train-Test-Dev data should be present in the Data Directory specified in the args to the python file. This data should be delimited by  TAB and have three columns namely: ID, Text, Label in that order.  

Due to data privacy issues, the files in Data have been corrupted but kept with the same format (to show how data is formatted). The Data is not yet public and hence not made available here. Nevertheless, the code should work for any dataset if the above steps are followed. This Code uses three labels for the data namely ['Q', 'A', 'O'] which stands for Questions, Answers and Others.  

For further reading, refer:  
	BERT Paper- [https://arxiv.org/abs/1810.04805]  
	Estimator- [https://github.com/google-research/bert#fine-tuning-with-bert]  
	Pytorch- [https://github.com/huggingface/pytorch-pretrained-BERT]  
  
