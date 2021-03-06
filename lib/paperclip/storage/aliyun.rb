module Paperclip
  module Storage
    module Aliyun
      def self.extended(base)

      end

      def exists?(style = default_style)
        oss_connection.exists? get_path_with_url_style(style)
      end

      def flush_writes #:nodoc:
        @queued_for_write.each do |style_name, file|
          File.open(file.path, 'r'){|f|
            # 注意！！！
            # 阿里云上传资源不支持带参数的URL
            # 要提供URI的path部分才正确，否则403
            # remove query string
            # aliyun not support attachment path with query
            oss_connection.put get_path_with_url_style(style_name), f
          }
        end

        after_flush_writes

        @queued_for_write = {}
      end

      def flush_deletes #:nodoc:
        @queued_for_delete.each do |path|
          oss_connection.delete get_path_with_url(path)
        end

        @queued_for_delete = []
      end

      def copy_to_local_file(style = default_style, local_dest_path)
        log("copying #{url(style)} to local file #{local_dest_path}")
        local_file = ::File.open(local_dest_path, 'wb')

        remote_file_str = oss_connection.get get_path_with_url_style(style)
        local_file.write(remote_file_str)
        local_file.close
      end

      def oss_connection
        return @oss_connection if @oss_connection

        @oss_connection ||= ::Aliyun::Connection.new
      end

      def get_path_with_url(path)
        u = URI.parse path
        u and u.path
      end

      def get_path_with_url_style(style)
        get_path_with_url url(style)
      end
    end
  end
end
