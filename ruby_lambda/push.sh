docker build -t ruby-lambda -f Dockerfile.ruby31 .

# テスト
docker run -v ~/.aws-lambda-rie:/aws-lambda -p 19000:8080 \
    --entrypoint /aws-lambda/aws-lambda-rie \
    ruby-lambda:latest \
        /usr/local/bundle/bin/aws_lambda_ric app.LambdaFunction::Handler.process

# 別ウインドウでcurlすると関数の戻り値がレスポンスで返ってくる
curl -XPOST "http://localhost:19000/2015-03-31/functions/function/invocations" -d '{}'

aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 765062437422.dkr.ecr.ap-northeast-1.amazonaws.com
docker tag ruby-lambda:latest 765062437422.dkr.ecr.ap-northeast-1.amazonaws.com/ruby-lambda:latest
docker push 765062437422.dkr.ecr.ap-northeast-1.amazonaws.com/ruby-lambda:latest
