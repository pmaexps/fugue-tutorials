FROM fugueproject/notebook:0.2.4

ENV NB_USER vscode
ENV NB_UID 1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

WORKDIR ${HOME}

USER root

# RUN ls ${HOME}/.ipython
# RUN rm -rf ${HOME}
RUN echo ${NB_USER}
RUN echo ${NB_UID}

COPY README.md ${HOME}/
COPY tutorials ${HOME}/tutorials
COPY data ${HOME}/data
COPY .jupyter ${HOME}/.jupyter
COPY images ${HOME}/images

# RUN mkdir -p /home/${NB_USER}/.jupyter
# RUN cp -R /root/.jupyter/* /home/${NB_USER}/.jupyter

USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

WORKDIR ${HOME}