
Aws.config.update({
  region: 'us-east-1',
  credentials: Aws::Credentials.new(ENV['AKIAJ2BOBVHRL5K7H6YQ'], ENV['fUIMyGHanXoO38Mq22jCUo+GYdE+Hp7ncvd1gYKH']),
})

S3_BUCKET = Aws::S3::Resource.new.bucket(ENV['dishesform'])
