CURRENT_DIR=`pwd`
export CUDA_VISIBLE_DEVICES="0"
export BERT_LARGE_DIR=$CURRENT_DIR/prev_trained_model/roberta_zh_L-24_H-1024_A-16
export GLUE_DIR=$CURRENT_DIR/../../glue/chineseGLUEdatasets/

python run_classifier.py \
  --task_name=xnli \
  --do_train=true \
  --do_eval=true \
  --data_dir=$GLUE_DIR/xnli \
  --vocab_file=$BERT_LARGE_DIR/vocab.txt \
  --bert_config_file=$BERT_LARGE_DIR/bert_config_large.json \
  --init_checkpoint=$BERT_LARGE_DIR/roberta_zh_large_model.ckpt \
  --max_seq_length=128 \
  --train_batch_size=64 \
  --eval_batch_size=64 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --output_dir=$CURRENT_DIR/xnli_output/
