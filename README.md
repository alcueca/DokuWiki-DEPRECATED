CloudFormation Stacks to deploy a DokuWiki container in AWS. Lots still to do in terms of tightening security, dns routing and backup/restore.

=== Fresh install ===

docker pull bitnami/dokuwiki
mkdir dokuwiki-persistence
docker network create dokuwiki-tier
docker run -d -p 80:80 -p 443:443 --name dokuwiki \
    --net dokuwiki-tier \
    --volume /home/ec2-user/dokuwiki-persistence:/bitnami \
    bitnami/dokuwiki:latest

=== Backup / Restore ===

Right now the EC2 instance has full access to the techhq-dokuwiki S3 bucket. Please tighten before going public.

From /home/ec2-user in the server running the DokuWiki container you can backup using tar to preserve permissions:
sudo tar czf dokuwiki-persistence-backup.tar.gz dokuwiki-persistence
aws s3 cp dokuwiki-persistence-backup.tar.gz s3://techhq-dokuwiki

From /home/ec2-user in the server running the DokuWiki container you can restore:
aws s3 cp s3://techhq-dokuwiki/dokuwiki-persistence-backup.tar.gz .
sudo tar xpzf dokuwiki-persistence-backup.tar.gz
