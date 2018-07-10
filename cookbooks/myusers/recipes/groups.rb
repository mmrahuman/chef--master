search("groups", "platform:centos").each do |group_data|
        group group_data['id'] do
                gid group_data['id']
                memebers group_data['members']
        end
end
