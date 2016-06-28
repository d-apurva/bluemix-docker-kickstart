FROM centos
MAINTAINER Avi Alkalay <avi at unix.sh>

# Install software: only one BEGIN->END block should be active. Disable the other blocks.

###### BEGIN Python 3 and Django ######
# 
# RUN yum -y install python3-django openssl python3-wand httpd python3-mod_wsgi; \
# 	yum clean all
# 
# # Add my code
# ADD . /var/www/html
# ADD django.conf /etc/httpd/conf.d/
# 
# # Configure all together for a production environment
# RUN sed -i 's|/home/aviram/srclocal/brdigitalid|/var/www/html|; s|/dj|/|; s|^Alias|#Alias|' /etc/httpd/conf.d/django.conf; \
# 	sed -i 's|/home/aviram/srclocal/brdigitalid|/var/www/html|; s|/dj|/|' /var/www/html/backend/brdigitalid/settings.py; \
# 	sed -i 's|/dj|/|' /var/www/html/js+css/config.js
# 
###### END Python 3 and Django ######



###### BEGIN PHP and Wordpress ######

RUN yum -y install wordpress httpd;\
	yum clean all


###### END PHP and Wordpress ######




# Export port 80
EXPOSE 80

# A plain Apache is our entry point
ENTRYPOINT [ "/usr/sbin/httpd", "-DFOREGROUND" ]
