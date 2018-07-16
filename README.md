# verdaccio-s3
This is a template for making a docker image for a Verdaccio NPM caching server with S3 storage.
To use:
 - Add your AWS credentials in `patch/home/verdaccio/.aws/credentials`
 - Change the S3 bucket name in `patch/home/verdaccio/.config/verdaccio/config.yaml`
 - Build the image with `make`
