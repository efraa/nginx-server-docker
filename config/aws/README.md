### Using credentials file

If you need to create the credentials file, you can use the aws-cli configure command by using the following command:

```sh 
docker run --rm -tiv $HOME/.aws:/root/.aws mikesir87/aws-cli aws configure
```

From that point on, simply mount the directory containing your config.

```sh 
docker run --rm -v $HOME/.aws:/root/.aws mikesir87/aws-cli aws s3 ls
```

### Using environment variables

  * AWS_ACCESS_KEY_ID` - specify the access key ID
  * AWS_SECRET_ACCESS_KEY` - the secret access key

```sh 
docker run --rm -e AWS_ACCESS_KEY_ID=my-key-id -e AWS_SECRET_ACCESS_KEY=my-secret-access-key -v $(pwd):/aws mikesir87/aws-cli
```