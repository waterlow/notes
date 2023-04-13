FROM public.ecr.aws/lambda/ruby:2.7

COPY app.rb ${LAMBDA_TASK_ROOT}
COPY Gemfile ${LAMBDA_TASK_ROOT}
ENV GEM_HOME=${LAMBDA_TASK_ROOT}

CMD ["app.LambdaFunction::Handler.process"]
