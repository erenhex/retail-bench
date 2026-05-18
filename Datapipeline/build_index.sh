REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_ROOT"

products_filepath="data/products-large.jsonl"
documents_filepath="resources/documents.jsonl"

test -f "$documents_filepath" || {
    echo "Missing $documents_filepath — see Datapipeline/readme.md"
    exit 1
}

## convert products to documents
#rm -rf resources
#mkdir -p resources
#python src/search_engine/convert_products_to_documents.py $products_filepath $documents_filepath
#if [ $? -eq 0 ]; then
#    echo "convert products to documents success"
#else
#    exit 1
#fi

# build indexes
rm -rf indexes
mkdir -p indexes
python -m pyserini.index.lucene \
  --collection JsonCollection \
  --input resources \
  --index indexes \
  --generator DefaultLuceneDocumentGenerator \
  --threads 1 \
  --storePositions --storeDocvectors --storeRaw
if [ $? -eq 0 ]; then
    echo "build indexes success"
else
    exit 1
fi

