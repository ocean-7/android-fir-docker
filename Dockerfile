FROM jangrewe/gitlab-ci-android

#RUN apt-get update
#RUN apt-get install -y openssh-server
#RUN mkdir /var/run/sshd

#RUN echo 'root:root' |chpasswd

#RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
#RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
#RUN ssh-keygen -t dsa

# Setup Gradle
ENV GRADLE_VERSION 3.1
RUN wget -q "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" -O gradle.zip && \
    unzip -q gradle.zip -d /opt && \
    ln -s "/opt/gradle-${GRADLE_VERSION}/bin/gradle" /usr/bin/gradle && \
    rm gradle.zip

# Configure Gradle Environment
ENV GRADLE_HOME /opt/gradle-${GRADLE_VERSION}
ENV PATH $PATH:$GRADLE_HOME/bin
RUN mkdir ~/.gradle
ENV GRADLE_USER_HOME ~/.gradle

EXPOSE 22
