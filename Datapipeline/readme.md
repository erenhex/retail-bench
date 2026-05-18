## Data pipelines

- **Download** documents.jsonl file:
  - hf sync hf://buckets/erenhex/retail-agent ./local
- **Search index** (for `search-server`) optional:
  - `bash Datapipeline/build_index.sh`
- **Synthesized suites** (writes under `data/suites/`):
  - `python Datapipeline/src/suitegen/run_synthesize.py Datapipeline/config/synthesize/product.json`
  - `python Datapipeline/src/suitegen/run_synthesize.py Datapipeline/config/synthesize/shop.json`
  - `python Datapipeline/src/suitegen/run_synthesize.py Datapipeline/config/synthesize/voucher.json`