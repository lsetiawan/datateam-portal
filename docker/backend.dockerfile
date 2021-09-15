FROM condaforge/mambaforge

ENV DATATEAM_DIR /opt/datateam
ENV BACKEND_DIR ${DATATEAM_DIR}/datateam-portal-backend

RUN mkdir ${DATATEAM_DIR}

WORKDIR ${DATATEAM_DIR}

RUN git clone https://github.com/lsetiawan/datateam-portal-backend.git && \
    cd datateam-portal-backend && \
    mamba create --name datateam --yes python=2.7 --file requirements.txt

RUN cd ${BACKEND_DIR} && \
    mkdir repos && \
    cd repos && \
    git clone https://github.com/oceanobservatories/preload-database.git && \
    git clone https://github.com/oceanobservatories/asset-management.git  && \
    git clone https://github.com/oceanobservatories/ingestion-csvs.git && \
    cd preload-database/ && \
    mamba env update -n datateam --file conda_env.yml

COPY ./docker/initial.sh ${BACKEND_DIR}/initial.sh
COPY ./docker/update.sh ${BACKEND_DIR}/update.sh

WORKDIR ${BACKEND_DIR}
