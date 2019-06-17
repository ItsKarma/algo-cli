# algo-cli
Algorithmia CLI Docker Container

## Requirements

You will need to sign up for an Algorithmia account and retrieve your API key from your dashboard.  
You will need to copy this API key into the `/root/.algorithmia/config` file into the container in the following format.  

```
[profiles]
[profiles.default]
api_key = "simXXXXXXXXXXXXXXXXXXXXXXXXX"
```

You can place the file on your own computer use a volume mount `-v` to get the file into the container at runtime. See examples below.

## Example Usage

```
docker run -it -v ~/.algorithmia/:/root/.algorithmia/ itskarma/algo-cli ls
```

```
docker run -t -v ~/.algorithmia/:/root/.algorithmia/ itskarma/algo-cli run kenny/factor -d 19635
```

```
docker run -it -v ~/.algorithmia/:/root/.algorithmia/ itskarma/algo-cli run nlp/KeywordsForDocumentSet/0.1.7 -d '[["badger badger buffalo mushroom mushroom mushroom mushroom mushroom mushroom mushroom","antelope buffalo mushroom","bannana"],2]' --timeout 300
```

## Getting Output

If you want to use the `--output` flag to output the response to a file, the output would be lost unless you use a volume mount `-v` into the container and map it to a local directory to store the output file. See example below.

```
docker run -it \
  -v ~/.algorithmia/:/root/.algorithmia/ \
  -v ${PWD}:/output \
  itskarma/algo-cli \
  run kenny/factor -d 17 --output /output/result.txt
```