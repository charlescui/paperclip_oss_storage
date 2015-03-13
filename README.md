# PaperclipOssStorage

    gem 'paperclip_oss_storage', github: "charlescui/paperclip_oss_storage", branch: "master"

首先，在config下面的initialise目录下，增加paperclip.rb文件，里面设置阿里云账号参数:

    require "paperclip"

    Paperclip::Attachment.default_options[:aliyun] = {
        :aliyun_access_id => "xxxxxxxxx",
        :aliyun_access_key => "YYBFDSYFBDSYFDSBFYSUFBDSFK",
        :aliyun_bucket => "test",
        :aliyun_area => "cn-hangzhou"
    }

在has_attached_file中，增加一个key：
    :storage => :aliyun

这样图片便可以上传到阿里云OSS。

### 经验

- 阿里云OSS通过put上传资源，资源路径不能带参数，阿里云不会处理的。带参数会报错403
- 如果要计算文件MD5，一定要得到二进制的MD5值，不要转成HEX的Digest结果。
- 得到MD5之后，务必要用Base64转一下，这块阿里云OSS文档上也没说。

## Installation

Add this line to your application's Gemfile:

    gem 'paperclip_oss_storage'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paperclip_oss_storage

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
